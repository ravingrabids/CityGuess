//
//  MapViewController.swift
//  CityGuess
//
//  Created by Андрей Гончаров on 15/03/2019.
//  Copyright © 2019 Андрей Гончаров. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    let mapView: GMSMapView = {
        let mapView = GMSMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    private(set) var mapController: MapController?
    
    convenience init(mapController: MapController) {
        self.init()
        self.mapController = mapController
        self.mapController?.mapViewController = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapController?.viewDidLoad()
        setupMapView()
    }
    
    func setupMapView() {
        view.addSubview(mapView)
        mapView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mapView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mapView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        mapView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        let constraints = NSLayoutConstraint.contraints(withNewVisualFormat: "H:|[mapView]|,V:|[mapView]", dict: ["mapView": mapView])
//        view.addConstraints(constraints)
    }
}
