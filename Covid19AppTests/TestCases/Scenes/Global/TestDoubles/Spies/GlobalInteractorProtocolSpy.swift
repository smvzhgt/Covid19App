//
//  GlobalInteractorProtocolSpy.swift
//  Covid19AppTests
//
//  Created by oleg on 28.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import XCTest
@testable import Covid19App

final class GlobalInteractorProtocolSpy: GlobalInteractorProtocol {
    
    // MARK: - Public Properties
    private(set) var isCalledFetchGlobalInformation = false
    
    
    // MARK: - Public Functions
    func fetchGlobalInformation(request: Global.Fetch.Request) {
        isCalledFetchGlobalInformation = true
    }
    
}
