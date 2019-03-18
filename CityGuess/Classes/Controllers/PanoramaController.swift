//
//  PanoramaController.swift
//  CityGuess
//
//  Created by Андрей Гончаров on 15/03/2019.
//  Copyright © 2019 Андрей Гончаров. All rights reserved.
//

import Foundation
import GoogleMaps

class PanoramaController: NSObject, Lifecycable {
    private weak var googleService: GoogleMapService?
    private weak var realmInteractor: RealmInteractor?
    weak var viewController: PanoramaViewController?
    
    var panoramaView: GMSPanoramaView? {
        return viewController?.panoramaView
    }
    
    private let session: PlaySession = PlaySession()
    
    init(googleService: GoogleMapService, realmInteractor: RealmInteractor) {
        self.googleService = googleService
        self.realmInteractor = realmInteractor
    }
    
    func viewDidLoad() {
        observeMapControllerClosures()
        addTargets()
        restartSession()
    }
    
    private func restartSession() {
        let mapController = viewController?.mapViewController?.mapController
        mapController?.clearMapView()
        let coordinates = RandomCoordinates().value
        print("Generated coordinates: \(coordinates)")
        panoramaView?.moveNearCoordinate(coordinates, radius: 1000)
        session.start(coordinates: coordinates)
    }
    
    private func addTargets() {
        viewController?.downButton.addTarget(self, action: #selector(downButtonClicked), for: .touchUpInside)
    }
    
    func rightButtonClicked() {
        restartSession()
    }
    
    @objc private func downButtonClicked() {
        viewController?.hideMapViewController()
    }
    
    private func addAttemptToHistory(distance: Double, pickedCoordinates: CLLocationCoordinate2D, rightCoordinates: CLLocationCoordinate2D?) {
        guard let rightCoordinates = rightCoordinates else {
            return
        }
        
        let attempt = Attempt(distance: distance,
                            pickedCoordinates: pickedCoordinates,
                            rightCoordinates: rightCoordinates)
        
        realmInteractor?.save(object: attempt)
    }
    
    private func observeMapControllerClosures() {
        let mapController = viewController?.mapViewController?.mapController
        
        mapController?.mapViewMovingStarted = {
            self.viewController?.expandMapViewController()
        }
        
        mapController?.mapViewCoordinateTapped = {
            coordinates in
            if let rightCoordinates = self.session.coordinates, self.session.isSessionActive {
                mapController?.drawPath(firstCoordinate: coordinates, secondCoordinate: rightCoordinates)
                mapController?.addMarket(on: coordinates)
                let result = self.session.pick(point: coordinates)
                self.session.end()
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
                    switch result {
                    case .fail(let meters):
                        self.addAttemptToHistory(distance: meters / 1000, pickedCoordinates: coordinates, rightCoordinates: rightCoordinates)
                        self.viewController?.showAlert(with: "You are mistaken, correct city is: Moscow", and: "Distance: \(meters.rounded() / 1000) km.")
                    case .success(let meters):
                        self.addAttemptToHistory(distance: meters / 1000, pickedCoordinates: coordinates, rightCoordinates: rightCoordinates)
                        self.viewController?.showAlert(with: "You are right", and: "Distance: \(meters.rounded() / 1000) km.")
                    case .error:
                        self.viewController?.showAlert(with: "Oops", and: "Error...")
                    }
                    self.restartSession()
                })
            }
        }
    }
}
