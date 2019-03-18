//
//  HistoryController.swift
//  CityGuess
//
//  Created by Андрей Гончаров on 15/03/2019.
//  Copyright © 2019 Андрей Гончаров. All rights reserved.
//

import UIKit

final class HistoryController: NSObject, Lifecycable {
    private weak var realmInteractor: RealmInteractor?
    
    weak var viewController: HistoryViewController?
    
    var tableView: UITableView? {
        return viewController?.historyTableView
    }
    
    init(realmInteractor: RealmInteractor) {
        self.realmInteractor = realmInteractor
    }
    
    private(set) var attemps: [Attempt] = []
    
    func viewWillAppear() {
        reloadAttemps()
    }
    
    private func reloadAttemps() {
        attemps = realmInteractor?.fetchItems(ofType: Attempt.self) ?? []
        tableView?.reloadData()
    }
}
