//
//  AddCityViewController.swift
//  Good Weather
//
//  Created by Jefin on 11/07/20.
//  Copyright © 2020 Jefin. All rights reserved.
//

import Foundation
import UIKit

protocol addWeatherDelegate {
    
func WeatherDidSave(vm : WeatherViewModel)
    
}

class AddCityViewController : UIViewController {
    
    private var cityViewModel = addCityViewModel()
    
    @IBOutlet weak var cityNameTextField: BindingTextField! {
        
        didSet {
            
            self.cityNameTextField.bind {  self.cityViewModel.city = $0 }
        }
    }
    
    var delegate : addWeatherDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
       
       
        if let city = cityNameTextField.text {
            
          let weatherUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=dd2b5f096a5d5d171933aa4fc21092d8&units=imperial")!
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherUrl) { data in
                
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                       
                return weatherVM
                
            }
    
            WebService().load(resource: weatherResource) {[weak self] result  in
             
                if let weatherVM = result {
                    
                    if let delegate = self?.delegate {
                        
                        delegate.WeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                    
                }
                
            }
            
        
            
            
        }
        
        
        
    }
    
    @IBAction func closeButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
