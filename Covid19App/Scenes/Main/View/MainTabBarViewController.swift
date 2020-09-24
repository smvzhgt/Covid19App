//
//  MainTabBarViewController.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import UIKit

final class MainTabBarViewController: UITabBarController {
    
    // MARK: - Initializers
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    // MARK: - Private Functions
    func setupUI() {
            
        // Global
        let globalViewController = GlobalBuilder().build()
        let globalItem = UITabBarItem()
        globalItem.title = "Global"
        globalItem.image = UIImage(systemName: "globe")
        globalViewController.tabBarItem = globalItem
        
        // By country
        let countriesViewController = CountriesBuilder().build()
        let countriesItem = UITabBarItem()
        countriesItem.title = "Countries"
        countriesItem.image = UIImage(systemName: "flag")
        countriesViewController.tabBarItem = countriesItem
        
        self.viewControllers = [
            globalViewController,
            countriesViewController
        ]
    }
    
}
