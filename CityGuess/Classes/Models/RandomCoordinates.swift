//
//  RandomCoordinates.swift
//  CityGuess
//
//  Created by Андрей Гончаров on 15/03/2019.
//  Copyright © 2019 Андрей Гончаров. All rights reserved.
//

import Foundation
import CoreLocation

class RandomCoordinates {
    let value: CLLocationCoordinate2D
    
    private let arrayOfCoordinates: [CLLocationCoordinate2D] = [
        // list of cities
        // London
        CLLocationCoordinate2DMake(51.500165, -0.124297),
        // Paris,
        CLLocationCoordinate2DMake(48.860288, 2.356689),
        // Moscow
        CLLocationCoordinate2DMake(55.751985, 37.618215),
        // New York
        CLLocationCoordinate2DMake(40.684601, -73.979769),
        // Pekin
        CLLocationCoordinate2DMake(39.922072, 116.468572),
        // Berlin
        CLLocationCoordinate2DMake(52.518106, 13.408053),
        // Athens
        CLLocationCoordinate2DMake(37.981496, 23.719969),
        // Los Angeles
        CLLocationCoordinate2DMake(34.025448, -118.296032),
        // Rome
        CLLocationCoordinate2DMake(41.889511, 12.485151),
        // Barcelona
        CLLocationCoordinate2DMake(41.379017, 2.165287),
        // Vatikan
        CLLocationCoordinate2DMake(41.900882, 12.457576),
        // Dubai
        CLLocationCoordinate2DMake(25.184233, 55.236267),
        // Seoul
        CLLocationCoordinate2DMake(37.555717, 126.955199),
        // Tokyo
        CLLocationCoordinate2DMake(35.656434, 139.719970),
        // Istanbul
        CLLocationCoordinate2DMake(41.010007, 28.922905),
        // Kuala Lumpur
        CLLocationCoordinate2DMake(3.109365, 101.631025),
        // Singapore
        CLLocationCoordinate2DMake(1.337334, 103.844938),
        // Bangkok
        CLLocationCoordinate2DMake(13.703844, 100.628291),
        // Madrid
        CLLocationCoordinate2DMake(40.409590, -3.703622),
        // Lisbon
        CLLocationCoordinate2DMake(38.720707, -9.129665),
        // Havana
        CLLocationCoordinate2DMake(23.138839, -82.382687),
        // St. Petersburg
        CLLocationCoordinate2DMake(59.921213, 30.296884),
        // Jerusalem
        CLLocationCoordinate2DMake(31.760948, 35.208284),
        // Prague
        CLLocationCoordinate2DMake(50.068778, 14.448478),
        // Amsterdam
        CLLocationCoordinate2DMake(52.370704, 4.882039),
        // Munich
        CLLocationCoordinate2DMake(48.128397, 11.562872),
        // Vienna
        CLLocationCoordinate2DMake(48.218601, 16.338239),
        // Washington
        CLLocationCoordinate2DMake(38.901022, -77.042192),
        // Brussels
        CLLocationCoordinate2DMake(50.856854, 4.357846),
        // Tel Aviv
        CLLocationCoordinate2DMake(32.075764, 34.766063),
        // Sydney
        CLLocationCoordinate2DMake(-33.879528, 151.227413),
        // Rio De Janeiro
        CLLocationCoordinate2DMake(-23.006758, -43.388130),
        // Venice
        CLLocationCoordinate2DMake(45.437910, 12.328156),
        // Budapest
        CLLocationCoordinate2DMake(47.492890, 19.031705),
        // Seville
        CLLocationCoordinate2DMake(37.383309, -5.989532),
        // Granada
        CLLocationCoordinate2DMake(37.184101, -3.605680),
        // San Francisco
        CLLocationCoordinate2DMake(37.791261, -122.389273),
        // Cape Town
        CLLocationCoordinate2DMake(-33.970637, 18.479570),
        // Hong Kong
        CLLocationCoordinate2DMake(22.345388, 114.137813),
        // Buenos Aires
        CLLocationCoordinate2DMake(-34.621724, -58.432395),
        // Florence
        CLLocationCoordinate2DMake(43.768497, 11.255452),
        // Cairo
        CLLocationCoordinate2DMake(30.044112, 31.235498),
        // Toronto
        CLLocationCoordinate2DMake(43.695505, -79.403336),
        // Edinburgh
        CLLocationCoordinate2DMake(55.948681, -3.195168),
        // Mexico City
        CLLocationCoordinate2DMake(19.403245, -99.149122),
        // Las Vegas
        CLLocationCoordinate2DMake(36.149745, -115.193340),
        // Stockholm
        CLLocationCoordinate2DMake(59.329320, 18.038416),
        // Chicago
        CLLocationCoordinate2DMake(41.866155, -87.617246),
        // Kyoto
        CLLocationCoordinate2DMake(35.008202, 135.747561),
        // Seattle
        CLLocationCoordinate2DMake(47.586806, -122.329629),
        // Helsinki
        CLLocationCoordinate2DMake(60.161237, 24.945000),
        // Cusco
        CLLocationCoordinate2DMake(-13.530827, -71.961752),
        // Monaco
        CLLocationCoordinate2DMake(43.735271, 7.421685),
        // Bern
        CLLocationCoordinate2DMake(46.944704, 7.435947),
        // Marseille
        CLLocationCoordinate2DMake(43.294266, 5.357552),
        // Manchester
        CLLocationCoordinate2DMake(53.487338, -2.243096),
        // Kiev
        CLLocationCoordinate2DMake(50.446868, 30.526625),
        // Minsk
        CLLocationCoordinate2DMake(53.902125, 27.562500),
    ]
    
    init() {
        self.value = arrayOfCoordinates.randomElement()!
    }
}

