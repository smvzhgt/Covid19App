//
//  TableViewSpy.swift
//  Covid19AppTests
//
//  Created by oleg on 28.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import UIKit

final class TableViewSpy: UITableView {
    
    // MARK: - Public Properties
    private(set) var isCalledReloadData = false
    
    
    // MARK: - Public Functions
    override func reloadData() {
        super.reloadData()
        
        isCalledReloadData = true
    }
    
}
