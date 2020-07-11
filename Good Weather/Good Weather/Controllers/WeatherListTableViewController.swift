//
//  WeatherListTableViewController.swift
//  Good Weather
//
//  Created by Jefin on 11/07/20.
//  Copyright © 2020 Jefin. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController : UITableViewController {
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
    return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    return 1
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        cell.citynameLabel.text = "Houston"
        cell.temperatureLabel.text = "70°"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
}
