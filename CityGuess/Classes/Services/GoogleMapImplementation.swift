//
//  GoogleMapImplementation.swift
//  CityGuess
//
//  Created by Андрей Гончаров on 15/03/2019.
//  Copyright © 2019 Андрей Гончаров. All rights reserved.
//

import Foundation
import GoogleMaps
import GooglePlaces

class GoogleMapImplementation: GoogleMapService {
    func register(with apiKey: String) {
        GMSServices.provideAPIKey(apiKey)
        GMSPlacesClient.provideAPIKey(apiKey)
    }
}

