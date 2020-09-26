//
//  GlobalBuilder.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import UIKit

final class GlobalBuilder: ModuleBuilder {
    
    init() {}
    
    func build() -> UIViewController {
        
        // Presenter
        let presenter = GlobalPresenter()
        
        // Interactor
        let interactor = GlobalInteractor(presenter: presenter)
        
        // View
        let storyboard = UIStoryboard.init(name: "Global", bundle: nil)
        guard let controller = storyboard.instantiateViewController(identifier: "GlobalViewController") as? GlobalViewController else {
            return UIViewController()
        }
        
        let tableViewDelegate = GlobalTableViewDelegate()
        
        controller.delegate = tableViewDelegate
        controller.interactor = interactor
        
        presenter.view = controller
        
        return UINavigationController(rootViewController: controller)
    }
    
}
