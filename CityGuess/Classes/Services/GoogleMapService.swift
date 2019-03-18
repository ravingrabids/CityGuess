//
//  GoogleMapService.swift
//  CityGuess
//
//  Created by Андрей Гончаров on 15/03/2019.
//  Copyright © 2019 Андрей Гончаров. All rights reserved.
//

import Foundation
import GoogleMaps

protocol GoogleMapService: class {
    func register(with apiKey: String)
}
