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
    let globalCaseModel = GlobalCasesModel(cases: 1000, deaths: 10, recovered: 900)
    let caseModels = [
        CaseModel(country: "USA", cases: 7011829, todayCases: 7061, deaths: 204181, todayDeaths: 63,
                  recovered: 4261777, active: 2545871, critical: 14023, casesPerOneMillion: 21156,
                  deathsPerOneMillion: 616, totalTests: 98242623, testsPerOneMillion: 296415),
        CaseModel(country: "India", cases: 3011829, todayCases: 7061, deaths: 204181, todayDeaths: 63,
                  recovered: 4261777, active: 2545871, critical: 14023, casesPerOneMillion: 21156,
                  deathsPerOneMillion: 616, totalTests: 98242623, testsPerOneMillion: 296415),
        CaseModel(country: "Brazil", cases: 7011829, todayCases: 7061, deaths: 204181, todayDeaths: 63,
                  recovered: 4261777, active: 2545871, critical: 14023, casesPerOneMillion: 21156,
                  deathsPerOneMillion: 616, totalTests: 98242623, testsPerOneMillion: 296415),
        CaseModel(country: "Russia", cases: 7011829, todayCases: 7061, deaths: 204181, todayDeaths: 63,
                  recovered: 4261777, active: 2545871, critical: 14023, casesPerOneMillion: 21156,
                  deathsPerOneMillion: 616, totalTests: 98242623, testsPerOneMillion: 296415),
        CaseModel(country: "Peru", cases: 7011829, todayCases: 7061, deaths: 204181, todayDeaths: 63,
                  recovered: 4261777, active: 2545871, critical: 14023, casesPerOneMillion: 21156,
                  deathsPerOneMillion: 616, totalTests: 98242623, testsPerOneMillion: 296415)
    ]
    
    
    // MARK: - Public Methods
    func fetchAllCases(completion: @escaping (Result<GlobalCasesModel, CommonError>) -> Void) {
        isCalledFetchAllCases = true
        completion(.success(globalCaseModel))
    }
    
    func fetchCountriesCases(completion: @escaping (Result<[CaseModel], CommonError>) -> Void) {
        isCalledFetchCountriesCases = true
        completion(.success(caseModels))
    }
    
}
