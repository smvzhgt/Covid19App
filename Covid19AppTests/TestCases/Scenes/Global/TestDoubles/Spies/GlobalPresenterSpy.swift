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
    
    
    // MARK: - Public Methods
    func presentFetchGlobalInformation(response: Global.Fetch.Response) {
        isCalledPresentFetchedGlobalInformation = true
    }
    
}
