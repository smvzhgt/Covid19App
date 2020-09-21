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
    @IBOutlet private weak var category: UILabel!
    @IBOutlet private weak var value: UILabel!
    @IBOutlet private weak var containerView: UIView!
    
    
    // MARK: Lifecycles
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        containerView.layer.masksToBounds = false
        containerView.layer.cornerRadius = 12
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: -1, height: 2)
        containerView.layer.shadowRadius = 3
        containerView.layer.shadowOpacity = 0.3
    }
    
}


// MARK: - Extensions
extension GlobalCell {
    func fill(model: Global.GlobalPresentationModel) {
        self.category.text = model.category
        self.value.text = model.value
    }
    
}
