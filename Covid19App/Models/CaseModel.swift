//
//  CaseModel.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

final class CaseModel: Decodable {
    let country: String?
    let cases: Int?
    let todayCases: Int?
    let deaths: Int?
    let todayDeaths: Int?
    let recovered: Int?
    let active: Int?
    let critical: Int?
    let casesPerOneMillion: Int?
    let deathsPerOneMillion: Int?
    let totalTests: Int?
    let testsPerOneMillion: Int?
    
    init(country: String,
         cases: Int,
         todayCases: Int,
         deaths: Int,
         todayDeaths: Int,
         recovered: Int,
         active: Int,
         critical: Int,
         casesPerOneMillion: Int,
         deathsPerOneMillion: Int,
         totalTests: Int,
         testsPerOneMillion: Int
         ) {
        self.country = country
        self.cases = cases
        self.todayCases = todayCases
        self.deaths = deaths
        self.todayDeaths = todayDeaths
        self.recovered = recovered
        self.active = active
        self.critical = critical
        self.casesPerOneMillion = casesPerOneMillion
        self.deathsPerOneMillion = deathsPerOneMillion
        self.totalTests = totalTests
        self.testsPerOneMillion = testsPerOneMillion
    }
}


// MARK: - Extention
extension CaseModel {
    static func convertToModel(entity: CaseEntity) -> CaseModel {
        let country = entity.country ?? ""
        let cases = Int(entity.cases)
        let todayCases = Int(entity.todayCases)
        let deaths = Int(entity.deaths)
        let todayDeaths = Int(entity.todayDeaths)
        let recovered = Int(entity.recovered)
        let active = Int(entity.active)
        let critical = Int(entity.critical)
        let casesPerOneMillion = Int(entity.casesPerOneMillion)
        let deathsPerOneMillion = Int(entity.deathsPerOneMillion)
        let totalTests = Int(entity.totalTests)
        let testsPerOneMillion = Int(entity.testsPerOneMillion)
        
        return CaseModel(country: country,
                         cases: cases,
                         todayCases: todayCases,
                         deaths: deaths,
                         todayDeaths: todayDeaths,
                         recovered: recovered,
                         active: active,
                         critical: critical,
                         casesPerOneMillion: casesPerOneMillion,
                         deathsPerOneMillion: deathsPerOneMillion,
                         totalTests: totalTests,
                         testsPerOneMillion: testsPerOneMillion)
    }
    
}
