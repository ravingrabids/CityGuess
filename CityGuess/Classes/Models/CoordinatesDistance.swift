//
//  CoordinatesDistance.swift
//  CityGuess
//
//  Created by Андрей Гончаров on 15/03/2019.
//  Copyright © 2019 Андрей Гончаров. All rights reserved.
//

import UIKit
import CoreLocation

class CoordinatesDistance {
    let value: Double
    
    init(firstCoordinate: CLLocationCoordinate2D, secondCoordinate: CLLocationCoordinate2D) {
        self.value = CLLocation(latitude: firstCoordinate.latitude, longitude: firstCoordinate.longitude).distance(from: CLLocation.init(latitude: secondCoordinate.latitude, longitude: secondCoordinate.longitude))
    }
}
