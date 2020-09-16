//
//  CaseService.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

protocol CaseServiceProtocol {
    
}

final class CaseService {
    
    // MARK: - Private Properties
    let apiClient: APIClientProtocol
    
    // MARK: - Initializers
    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
}


// MARK: - Extension
extension CaseService: CaseServiceProtocol {
    
}
