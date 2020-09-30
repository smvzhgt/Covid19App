//
//  GlobalViewControllerSpy.swift
//  Covid19AppTests
//
//  Created by oleg on 30.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation
@testable import Covid19App

final class GlobalViewControllerSpy: GlobalViewProtocol {
    
    // MARK: - Public Properties
    private(set) var isCalledDisplayFetchedGlobalInformation = false
    private(set) var models: [Global.GlobalPresentationModel] = []
    
    
    // MARK: - Public Functions
    func displayFetchGlobalInformation(viewModel: Global.Fetch.ViewModel) {
        isCalledDisplayFetchedGlobalInformation = true
        models = viewModel.models
    }
    
}
