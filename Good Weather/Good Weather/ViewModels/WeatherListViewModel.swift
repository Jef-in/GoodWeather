//
//  WeatherListViewModel.swift
//  Good Weather
//
//  Created by Jefin on 11/07/20.
//  Copyright © 2020 Jefin. All rights reserved.
//

import Foundation

struct WeatherListViewModel {

 private var weatherModels = [WeatherViewModel] ()
    
 mutating func addWeatherViewModel(_ vm : WeatherViewModel) {
        
    weatherModels.append(vm)
 }
    
 func numberofRows(_ section : Int) -> Int {
        
 return weatherModels.count
    
 }

func weatherModelAtIndex(_ index : Int) -> WeatherViewModel {
        
return self.weatherModels[index]
    
}
    
mutating private func toCelsius() {
  
   weatherModels = weatherModels.map { vm in
        
    var weatherModel = vm
        
    weatherModel.currentTemperature.temperature = (weatherModel.currentTemperature.temperature - 32) * 5/9
    
    return weatherModel
    }
        
}
    
mutating private func toFarenheit() {
      
       weatherModels = weatherModels.map { vm in
            
        var weatherModel = vm
            
        weatherModel.currentTemperature.temperature = (weatherModel.currentTemperature.temperature * 9/5) + 32
         
        return weatherModel
        }
            
    }
    
mutating func updateUnit(to unit : Unit) {
        
    switch unit {
        
    case .celsius :
        
        toCelsius()
        
    case .farenheit :
        
        toFarenheit()
    }

}
    
}


struct WeatherViewModel : Decodable {
    
    let name : String
    var currentTemperature : TemperatureViewModel
    
    private enum CodingKeys : String, CodingKey {
        
    case name
    case currentTemperature = "main"
        
    }
}

struct TemperatureViewModel : Decodable {
    
    var temperature : Double
    let temperatureMin : Double
    let temperatureMax : Double
    
    private enum CodingKeys : String, CodingKey {
        
     case temperature = "temp"
     case temperatureMin = "temp_min"
     case temperatureMax = "temp_max"
        
    }
}
