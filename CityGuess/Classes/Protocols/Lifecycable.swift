//
//  Lifecycable.swift
//  CityGuess
//
//  Created by Андрей Гончаров on 15/03/2019.
//  Copyright © 2019 Андрей Гончаров. All rights reserved.
//

import Foundation

@objc protocol Lifecycable {
    @objc optional func viewDidLoad()
    @objc optional func viewWillAppear()
}

