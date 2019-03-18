//
//  HistoryTableViewCell.swift
//  CityGuess
//
//  Created by Андрей Гончаров on 17/03/2019.
//  Copyright © 2019 Андрей Гончаров. All rights reserved.
//

import UIKit
import GoogleMaps

class HistoryTableViewCell: UITableViewCell, NibLoadable {
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var mapView: GMSMapView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        resultImageView.contentMode = .scaleAspectFit
        mapView.isUserInteractionEnabled = false
        selectionStyle = .none
    }
    
    func configure(by attempt: Attempt) {
        distanceLabel.text = "Distance: \(attempt.distance.rounded(.down) / 1000) km"
        if attempt.distance < 100000 {
            resultImageView.image = UIImage(named: "checked")
        } else {
        resultImageView.image = UIImage(named: "error")
        }
        
        mapView.animate(toLocation: attempt.pickedCoordinates)
        mapView.animate(toZoom: 16)
        let marker = GMSMarker()
        marker.position = attempt.pickedCoordinates
        marker.map = mapView
    }
}
