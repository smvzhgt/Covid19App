//
//  LoadingBuilder.swift
//  Covid19App
//
//  Created by oleg on 17.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import UIKit

final class LoadingBuilder: ModuleBuilder {

    init() {}


    // MARK: - Public Functions
    func build() -> UIViewController {
        
        let viewController = LoadingViewController()
        
        return viewController
    }

}

