//
//  RealmInteractor.swift
//  CityGuess
//
//  Created by Андрей Гончаров on 15/03/2019.
//  Copyright © 2019 Андрей Гончаров. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmInteractor {
    func save(object: Object) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(object, update: false)
        }
    }
    
    func fetchItems<T: Object>(ofType type: T.Type) -> [T] {
        let realm = try! Realm()
        return realm.objects(type).toArray()
    }
}

extension Results {
    func toArray() -> [Element] {
        var array: [Element] = []
        for element in self {
            array.append(element)
        }
        
        return array
    }
}
