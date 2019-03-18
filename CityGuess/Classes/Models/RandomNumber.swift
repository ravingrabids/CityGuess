//
//  RandomNumber.swift
//  CityGuess
//
//  Created by Андрей Гончаров on 15/03/2019.
//  Copyright © 2019 Андрей Гончаров. All rights reserved.
//

import Foundation

class RandomNumber {
    let value: Int
    init(min: Int = 0, max: Int = 15) {
        self.value = Int(arc4random_uniform(UInt32(max))) + min + 1
    }
}
