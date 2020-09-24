//
//  CountriesBuilder.swift
//  Covid19App
//
//  Created by oleg on 21.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import UIKit

final class CountriesBuilder: ModuleBuilder {
    
    init() {}
    
    func build() -> UIViewController {
        
        // Presenter
        let presenter = CountriesPresenter()
        
        // Interactor
        let interactor = CountriesInteractor(presenter: presenter)
        
        // View
        let storyboard = UIStoryboard.init(name: "Countries", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "CountriesViewController") as! CountriesViewController
        
        let tableViewDelegate = CountriesTableViewDelegate()
        
        controller.delegate = tableViewDelegate
        controller.interactor = interactor
        
        presenter.view = controller
        
        return UINavigationController(rootViewController: controller)
    }
    
}
