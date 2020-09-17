//
//  BaseViewController.swift
//  Covid19App
//
//  Created by oleg on 17.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Public Properties
    var loadingViewController: UIViewController?
    
    
    // MARK: - Private Functions
    internal func showLoading() {
        loadingViewController = LoadingBuilder().build()
        addChildViewController(childViewController: loadingViewController)
    }
    
    internal func hideLoading() {
        removeChildViewController(childViewController: loadingViewController)
        loadingViewController = nil
    }
    
}
