//
//  APIClient.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

protocol APIClientProtocol {
    func fetchAllCases(completion: @escaping (Result<GlobalCasesModel, CommonError>) -> Void)
    func fetchCountriesCases(completion: @escaping (Result<[CaseModel], CommonError>) -> Void)
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
    
    func fetchAllCases(completion: @escaping (Result<GlobalCasesModel, CommonError>) -> Void) {
        guard let urlRequest = AllCasesRequest().getURLRequest() else {
            return completion(.failure(CommonError.invalidRequest))
        }
        
        executor.execute(with: urlRequest, completion: completion)
    }
    
    func fetchCountriesCases(completion: @escaping (Result<[CaseModel], CommonError>) -> Void) {
        guard let urlRequest = CountiesCasesRequest().getURLRequest() else {
            return completion(.failure(CommonError.invalidRequest))
        }
        
        executor.execute(with: urlRequest, completion: completion)
    }
    
}
