//
//  CountriesFlow.swift
//  Covid19App
//
//  Created by oleg on 21.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

enum Countries {
    enum Fetch {
        struct Request {
            
        }
        struct Response {
            let result: Result<[CaseModel], CommonError>
        }
        struct ViewModel {
            let models: [CountryPresentationModel]
            let error: CommonError?
        }
    }
    
    struct CountryPresentationModel {
        var country: String?
        var cases: String?
        var death: String?
        var recovered: String?
    }
}

extension Countries.CountryPresentationModel {
    init(caseModel: CaseModel) {
        self.country = caseModel.country
        self.cases = "Cases: \(caseModel.cases ?? 0) | Today:\(caseModel.todayCases ?? 0) | Active:\(caseModel.active ?? 0)"
        self.death = "Death: \(caseModel.deaths ?? 0) | Today:\(caseModel.todayDeaths ?? 0)"
        self.recovered = "Recovered: \(caseModel.recovered ?? 0) | Critical:\(caseModel.critical ?? 0)"
    }
}
