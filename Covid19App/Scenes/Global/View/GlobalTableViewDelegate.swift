//
//  GlobalTableViewDelegate.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import UIKit

final class GlobalTableViewDelegate: NSObject {
    
    // MARK: - Public Properties
    var dataSource: [Global.GlobalPresentationModel]
    
    
    // MARK: - Initializers
    init(presentationModels: [Global.GlobalPresentationModel] = []) {
        self.dataSource = presentationModels
    }
    
}


// MARK: - UITableView Data Source
extension GlobalTableViewDelegate: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataSource[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: GlobalCell.cellIdentifier) as? GlobalCell {
            cell.fill(model: model)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
}


// MARK: - UITableView Delegate
extension GlobalTableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return GlobalCell.cellHeight
    }
    
}
