//
//  PlaySession.swift
//  CityGuess
//
//  Created by Андрей Гончаров on 15/03/2019.
//  Copyright © 2019 Андрей Гончаров. All rights reserved.
//

import Foundation
import CoreLocation

final class PlaySession {
    enum Result {
        case success(Double)
        case fail(Double)
        case error
    }
    
    private(set) var coordinates: CLLocationCoordinate2D?
    private(set) var isSessionActive: Bool = false
    
    func start(coordinates: CLLocationCoordinate2D) {
        self.coordinates = coordinates
        isSessionActive = true
    }
    
    func pick(point: CLLocationCoordinate2D) -> Result {
        guard let coordinates = coordinates else {
            return .error
        }
        let distance = CoordinatesDistance(firstCoordinate: point, secondCoordinate: coordinates).value
        switch distance {
        case 0...100000: return Result.success(distance)
        default: return Result.fail(distance)
        }
    }
    
    func end() {
        coordinates = nil
        isSessionActive = false
    }
}
