//
//  SettingsTableViewController.swift
//  Good Weather
//
//  Created by Jefin on 09/08/20.
//  Copyright © 2020 Jefin. All rights reserved.
//

import Foundation
import UIKit

protocol SettingsDelegate {
    
    func settingsDone(vm : SettingsViewModel)
}

class SettingsTableViewController : UITableViewController {
    
private var settingsViewModel = SettingsViewModel()
    
  var delegate : SettingsDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return self.settingsViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.visibleCells.forEach { cell in
              
        cell.accessoryType = .none
            
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            settingsViewModel.selectedUnit = unit
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
      if let cell = tableView.cellForRow(at: indexPath) {
            
            cell.accessoryType = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let SettingsItem = settingsViewModel.units[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        cell.textLabel?.text = SettingsItem.displayName
        
        if SettingsItem == settingsViewModel.selectedUnit {
            
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    @IBAction func done() {
        
        if let delegate = delegate {
            
            delegate.settingsDone(vm: self.settingsViewModel)
        }
        dismiss(animated: true, completion: nil)
        
    }
}
