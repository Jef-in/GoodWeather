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
    
}


struct WeatherViewModel : Decodable {
    
    let name : String
    let currentTemperature : TemperatureViewModel
    
    private enum CodingKeys : String, CodingKey {
        
    case name
    case currentTemperature = "main"
        
    }
}

struct TemperatureViewModel : Decodable {
    
    let temperature : Double
    let temperatureMin : Double
    let temperatureMax : Double
    
    private enum CodingKeys : String, CodingKey {
        
     case temperature = "temp"
     case temperatureMin = "temp_min"
     case temperatureMax = "temp_max"
        
    }
}
