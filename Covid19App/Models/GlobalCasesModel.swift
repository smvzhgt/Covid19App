//
//  GlobalCasesModel.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

final class GlobalCasesModel: Decodable, Equatable {
    
    // MARK: - Public Properties
    let cases: Int?
    let deaths: Int?
    let recovered: Int?
    
    
    // MARK: - Initializers
    init(cases: Int,
         deaths: Int,
         recovered: Int) {
        self.cases = cases
        self.deaths = deaths
        self.recovered = recovered
    }
    
    init(entity: GlobalCaseEntity) {
        self.cases = Int(entity.cases)
        self.deaths = Int(entity.deaths)
        self.recovered = Int(entity.recovered)
    }
    
    
    // MARK: - Public Functions
    static func == (lhs: GlobalCasesModel, rhs: GlobalCasesModel) -> Bool {
        return lhs.cases == rhs.cases
            && lhs.deaths == rhs.deaths
            && lhs.recovered == rhs.recovered
    }
    
}


// MARK: - Extention
extension GlobalCasesModel {
    static func convertToModel(entity: GlobalCaseEntity) -> GlobalCasesModel {
        let cases = Int(entity.cases)
        let deaths = Int(entity.deaths)
        let recovered = Int(entity.recovered)
        return GlobalCasesModel(cases: cases, deaths: deaths, recovered: recovered)
    }
    
}
