//
//  CountryCell.swift
//  Covid19App
//
//  Created by oleg on 21.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    
    // MARK: - Public Properties
    static let cellHeight: CGFloat = 130
    static let cellIdentifier: String = "CountryCell"
    
    
    // MARK: - Outlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var country: UILabel!
    @IBOutlet private weak var cases: UILabel!
    @IBOutlet private weak var death: UILabel!
    @IBOutlet private weak var recovered: UILabel!
    
    
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
extension CountryCell {
    func fill(model: Countries.CountryPresentationModel) {
        self.country.text = model.country
        self.cases.text = model.cases
        self.death.text = model.death
        self.recovered.text = model.recovered
    }
    
}
