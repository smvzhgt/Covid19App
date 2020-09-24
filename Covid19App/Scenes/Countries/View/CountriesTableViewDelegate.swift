//
//  CountriesTableViewDelegate.swift
//  Covid19App
//
//  Created by oleg on 21.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import UIKit

final class CountriesTableViewDelegate: NSObject {
    
    // MARK: - Public Properties
    var dataSource: [Countries.CountryPresentationModel]
    
    
    // MARK: - Initializers
    init(presentationModels: [Countries.CountryPresentationModel] = []) {
        self.dataSource = presentationModels
    }
    
}


// MARK: - UITableView Data Source
extension CountriesTableViewDelegate: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataSource[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.cellIdentifier) as? CountryCell {
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
extension CountriesTableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CountryCell.cellHeight
    }
    
}
