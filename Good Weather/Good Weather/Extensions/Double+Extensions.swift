//
//  Double+Extensions.swift
//  Good Weather
//
//  Created by Jefin on 08/08/20.
//  Copyright © 2020 Jefin. All rights reserved.
//

import Foundation

extension Double {
    
    var formatAsDegree : String {
        
        return String(format : "%.0f°",self)
    }
}
