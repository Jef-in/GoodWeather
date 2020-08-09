//
//  SettingsViewModel.swift
//  Good Weather
//
//  Created by Jefin on 09/08/20.
//  Copyright © 2020 Jefin. All rights reserved.
//

import Foundation

enum Unit : String, CaseIterable {
    
case celsius = "metric"
case farenheit = "imperial"
    
}

extension Unit {
    
var displayName : String {

    get {
        
        switch (self) {
            
        case .celsius:
            
            return "Celsius"
            
        case .farenheit :
            
            return  "Farenheit"
        }
    }
}
}

class SettingsViewModel {
    
let units = Unit.allCases
    
private var _selectedUnit : Unit = Unit.farenheit
    
    var selectedUnit : Unit {
        
        get {
            
            let userdefaults = UserDefaults.standard
            
            if let value = userdefaults.value(forKey: "unit") as? String {
                
                return Unit(rawValue: value)!
            }
            return _selectedUnit
            
        } set {
            
            let userdefaults = UserDefaults.standard
            userdefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
    
}
