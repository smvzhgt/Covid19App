//
//  ModuleBuilder.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import UIKit

protocol ModuleBuilder: AnyObject {
    func build() -> UIViewController
}
