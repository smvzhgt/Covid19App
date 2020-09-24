//
//  CaseModel.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

final class CaseModel: Codable {
    var country: String?
    var cases: Int?
    var todayCases: Int?
    var deaths: Int?
    var todayDeaths: Int?
    var recovered: Int?
    var active: Int?
    var critical: Int?
    var casesPerOneMillion: Int?
    var deathsPerOneMillion: Int?
    var totalTests: Int?
    var testsPerOneMillion: Int?
    
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
