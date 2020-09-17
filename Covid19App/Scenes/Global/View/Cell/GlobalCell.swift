//
//  GlobalCell.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import UIKit

class GlobalCell: UITableViewCell {
    
    // MARK: - Public Properties
    static let cellHeight: CGFloat = 100
    static let cellIdentifier: String = "GlobalCell"
    
    
    // MARK: - Outlets
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var category: UILabel!
    @IBOutlet private weak var value: UILabel!
    
    
    // MARK: Lifecycles
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
}


// MARK: - Extensions
extension GlobalCell {
    func fill(model: Global.GlobalPresentationModel) {
        self.title.text = model.title
        self.category.text = model.category
        self.value.text = "\(model.value)"
    }
    
}
