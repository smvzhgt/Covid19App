//
//  APIClient.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

protocol APIClientProtocol {

}


final class APIClient {
    
    // MARK: - Private Properties
    private let executor: RequestExecutorProtocol
    
    
    // MARK: - Initializers
    init(executor: RequestExecutorProtocol = RequestExecutor()) {
        self.executor = executor
    }
    
}


// MARK: - Extension
extension APIClient: APIClientProtocol {
    
    
}
