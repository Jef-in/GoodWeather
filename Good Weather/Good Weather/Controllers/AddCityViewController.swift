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
        
        
    }
    
    @IBAction func closeButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
