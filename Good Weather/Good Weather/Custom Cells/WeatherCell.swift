//
//  WeatherCell.swift
//  Good Weather
//
//  Created by Jefin on 11/07/20.
//  Copyright © 2020 Jefin. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell : UITableViewCell {
    
    @IBOutlet weak var citynameLabel : UILabel!
    @IBOutlet weak var temperatureLabel : UILabel!
   
    func configure(_ vm : WeatherViewModel) {
        
        citynameLabel.text = vm.name
        temperatureLabel.text = "\(vm.currentTemperature.temperature.formatAsDegree)"
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
}
