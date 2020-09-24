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
