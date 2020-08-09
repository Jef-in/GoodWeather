//
//  BindingTextField.swift
//  Good Weather
//
//  Created by Jefin on 09/08/20.
//  Copyright © 2020 Jefin. All rights reserved.
//

import Foundation
import UIKit

class BindingTextField : UITextField {
    
    var textChangeClosure : (String) -> () = { _ in }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        commonInit()
    }
    
     func bind(callback : @escaping (String) -> ()) {
        
        self.textChangeClosure = callback
    }
    
    private func commonInit() {
        
    self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }
    
    @objc func textFieldDidChange(_ textField : UITextField ) {
        
        if let text = textField.text {
            
            self.textChangeClosure(text)
        }
    }
    
}
