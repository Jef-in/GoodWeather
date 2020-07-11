//
//  AddCityViewController.swift
//  Good Weather
//
//  Created by Jefin on 11/07/20.
//  Copyright © 2020 Jefin. All rights reserved.
//

import Foundation
import UIKit

class AddCityViewController : UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
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
    
            WebService().load(resource: weatherResource) { result  in
             
                
            }
            
        
            
            
        }
        
        
        
    }
    
    @IBAction func closeButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
