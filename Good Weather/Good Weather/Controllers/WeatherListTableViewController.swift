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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func WeatherDidSave(vm: WeatherViewModel) {
        
    weatherListViewModel.addWeatherViewModel(vm)
    self.tableView.reloadData()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
    return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return weatherListViewModel.numberofRows(section)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let nav = segue.destination as? UINavigationController else {
            
            fatalError("Naviagtion controller not found")
        }
        guard let addWeatherCityVC = nav.viewControllers.first as? AddCityViewController else {
            
            fatalError("AddWeatherCity Controller not found")
        }
        addWeatherCityVC.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        let weatherVM = weatherListViewModel.weatherModelAtIndex(indexPath.row)
        
        cell.configure(weatherVM)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
}
