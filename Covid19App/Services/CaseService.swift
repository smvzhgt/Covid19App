//
//  CaseService.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

protocol CaseServiceProtocol {
    func fetchAllCases(completion: @escaping (Result<GlobalCasesModel, CommonError>) -> Void)
    func fetchCountriesCases(completion: @escaping (Result<[CaseModel], CommonError>) -> Void)
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
    
    func fetchAllCases(completion: @escaping (Result<GlobalCasesModel, CommonError>) -> Void) {
        apiClient.fetchAllCases(completion: completion)
    }
    
    func fetchCountriesCases(completion: @escaping (Result<[CaseModel], CommonError>) -> Void) {
        apiClient.fetchCountriesCases(completion: completion)
    }
    
}
