//
//  CaseServiceSpy.swift
//  Covid19AppTests
//
//  Created by oleg on 29.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation
@testable import Covid19App

final class CaseServiceSpy: CaseServiceProtocol {
    
    // MARK: - Public Properties
    private(set) var isCalledFetchAllCases = false
    private(set) var isCalledFetchCountriesCases = false
    private(set) var globalCaseModel: GlobalCasesModel
    private(set) var caseModels: [CaseModel]
    
    
    // MARK: - Initializer
    init(globalCaseModel: GlobalCasesModel = GlobalCasesModel(cases: 0, deaths: 0, recovered: 0),
         caseModels: [CaseModel] = []) {
        self.globalCaseModel = globalCaseModel
        self.caseModels = caseModels
    }
    
    
    // MARK: - Public Functions
    func fetchAllCases(completion: @escaping (Result<GlobalCasesModel, CommonError>) -> Void) {
        isCalledFetchAllCases = true
        completion(.success(Seeds.globalCaseModel))
    }
    
    func fetchCountriesCases(completion: @escaping (Result<[CaseModel], CommonError>) -> Void) {
        isCalledFetchCountriesCases = true
        completion(.success(Seeds.caseModels))
    }
    
}
