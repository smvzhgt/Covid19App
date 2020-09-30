//
//  Seeds.swift
//  Covid19AppTests
//
//  Created by oleg on 30.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation
@testable import Covid19App

struct Seeds {
    static let globalCaseModel = GlobalCasesModel(cases: 1000, deaths: 10, recovered: 900)
    
    static let caseModels = [
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

}


