//
//  APIClient.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

protocol APIClientProtocol {
    func fetchAllCases(completion: @escaping (_ result: GlobalCasesModel?, _ error: CommonError?) -> Void)
    func fetchCountryCases(completion: @escaping (_ result: [CaseModel]?, _ error: CommonError?) -> Void)
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

    func fetchAllCases(completion: @escaping (GlobalCasesModel?, CommonError?) -> Void) {
        guard let urlRequest = AllCasesRequest().getURLRequest() else {
            return completion(nil, CommonError.invalidRequest)
        }
        
        executor.execute(with: urlRequest, completion: completion)
    }
    
    func fetchCountryCases(completion: @escaping ([CaseModel]?, CommonError?) -> Void) {
        guard let urlRequest = CountiesCasesRequest().getURLRequest() else {
            return completion(nil, CommonError.invalidRequest)
        }
        
        executor.execute(with: urlRequest, completion: completion)
    }
    
}
