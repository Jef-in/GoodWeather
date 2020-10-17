//
//  TableDataSource.swift
//  Good Weather
//
//  Created by Jefin on 17/10/20.
//  Copyright © 2020 Jefin. All rights reserved.
//

import Foundation
import UIKit

class TableDataSource<cellType,viewModel> : NSObject,UITableViewDataSource where cellType : UITableViewCell{
    
    let cellIdentifier : String
    var items : [viewModel]
    let configureCell : (cellType,viewModel) -> ()
    
    init(cellIdentifier : String, items : [viewModel], configureCell : @escaping(cellType,viewModel) -> ()) {
        
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func updateItems(_ items : [viewModel]) {
        
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? cellType else { fatalError("cell not found") }
        
        let VM = self.items[indexPath.row]
        
        self.configureCell(cell,VM)
        
        return cell
    }
    
}
