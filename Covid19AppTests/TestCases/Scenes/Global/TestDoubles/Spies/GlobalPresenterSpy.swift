//
//  GlobalPresenterSpy.swift
//  Covid19AppTests
//
//  Created by oleg on 29.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation
@testable import Covid19App

final class GlobalPresenterSpy: GlobalPresenterProtocol {
    
    // MARK: - Public Properties
    private(set) var isCalledPresentFetchedGlobalInformation = false
    private(set) var globalCaseModel: GlobalCasesModel
    
    
    // MARK: - Initializer
    init(globalCaseModel: GlobalCasesModel = GlobalCasesModel(cases: 0, deaths: 0, recovered: 0)) {
        self.globalCaseModel = globalCaseModel
    }
    
    
    // MARK: - Public Functions
    func presentFetchGlobalInformation(response: Global.Fetch.Response) {
        isCalledPresentFetchedGlobalInformation = true
    }
    
}
