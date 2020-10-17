//
//  WeatherListTableViewController.swift
//  Good Weather
//
//  Created by Jefin on 11/07/20.
//  Copyright © 2020 Jefin. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController : UITableViewController,addWeatherDelegate {
    
  var weatherListViewModel = WeatherListViewModel()
    
    var datasource : TableDataSource<WeatherCell,WeatherViewModel>!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.datasource = TableDataSource(cellIdentifier: "WeatherCell", items: self.weatherListViewModel.weatherModels) { cell,vm in
            
            cell.citynameLabel.text = vm.name.value
            cell.temperatureLabel.text = vm.currentTemperature.temperature.value.formatAsDegree
            
        }
        
        self.tableView.dataSource = self.datasource
    }
    
    func WeatherDidSave(vm: WeatherViewModel) {
        
    weatherListViewModel.addWeatherViewModel(vm)
    self.datasource.updateItems(self.weatherListViewModel.weatherModels)
    self.tableView.reloadData()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
    return 1
        
    }
    
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "AddCityViewController" {
            
            prepareSegureForAddCity(segue: segue)
            
        } else if segue.identifier == "SettingsTableViewController" {
            
            prepareSegureForSettings(segue: segue)
            
        } else if segue.identifier == "WeatherDetailsViewController" {
            
            prepareSegueForWeatherDetails(segue : segue)
        }
      
    }
    
    
    private func prepareSegueForWeatherDetails(segue : UIStoryboardSegue) {
        
      guard let weatherDetailVC = segue.destination as? WeatherDetailsViewController,
        let indexPath  = self.tableView.indexPathForSelectedRow else {
            
            return
        }
        
        let WeatherVM = weatherListViewModel.weatherModelAtIndex(indexPath.row)
        
        weatherDetailVC.weatherViewModel = WeatherVM
    }
    
    private func prepareSegureForAddCity(segue : UIStoryboardSegue) {
        
    guard let nav = segue.destination as? UINavigationController else {
        
        fatalError("Naviagtion controller not found")
    }
    guard let addWeatherCityVC = nav.viewControllers.first as? AddCityViewController else {
        
        fatalError("AddWeatherCity Controller not found")
    }
    addWeatherCityVC.delegate = self
        
        
    }
    
    private func prepareSegureForSettings(segue : UIStoryboardSegue) {
         
     guard let nav = segue.destination as? UINavigationController else {
         
         fatalError("Naviagtion controller not found")
     }
     guard let settingsVC = nav.viewControllers.first as? SettingsTableViewController else {
         
         fatalError("AddWeatherCity Controller not found")
     }
     
        settingsVC.delegate = self
         
     }
        
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
}
extension WeatherListTableViewController : SettingsDelegate {
   
    
    func settingsDone(vm: SettingsViewModel) {
        
        print("settings Done")
        self.weatherListViewModel.updateUnit(to : vm.selectedUnit)
        self.tableView.reloadData()
    }
    
    
    
}
