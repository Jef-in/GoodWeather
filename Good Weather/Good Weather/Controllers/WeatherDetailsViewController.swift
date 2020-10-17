//
//  WeatherDetailsViewController.swift
//  Good Weather
//
//  Created by Jefin on 17/10/20.
//  Copyright © 2020 Jefin. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetailsViewController : UIViewController {
    
    @IBOutlet weak var cityNameLabel : UILabel!
    @IBOutlet weak var currentTempLabel : UILabel!
    @IBOutlet weak var maxTempLabel : UILabel!
    @IBOutlet weak var minTempLabel : UILabel!
    
    var weatherViewModel : WeatherViewModel?
    
    override func viewDidLoad() {
    
    setupVmBinding()
        
    }
    
    private func setupVmBinding() {
        
    if let weatherVM = self.weatherViewModel {
    
    weatherVM.name.bind { self.cityNameLabel.text = $0 }
    weatherVM.currentTemperature.temperature.bind { self.currentTempLabel.text = $0.formatAsDegree}
    
    }
        
    }

}
