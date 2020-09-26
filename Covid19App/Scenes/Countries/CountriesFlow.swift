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
        var today: String?
        var death: String?
        var deathToday: String?
        var recovered: String?
        var recoveredCritical: String?
    }
}

extension Countries.CountryPresentationModel {
    init(caseModel: CaseModel) {
        self.country = caseModel.country
        self.cases = "Cases: \(FormatUtil.formatValue(value: caseModel.cases) ?? "")"
        self.today = "Today: \(FormatUtil.formatValue(value: caseModel.todayCases) ?? "") | Active: \(FormatUtil.formatValue(value: caseModel.active) ?? "")"
        self.death = "Death: \(FormatUtil.formatValue(value: caseModel.deaths) ?? "")"
        self.deathToday = "Today: \(FormatUtil.formatValue(value: caseModel.todayDeaths) ?? "")"
        self.recovered = "Recovered: \(FormatUtil.formatValue(value: caseModel.recovered) ?? "")"
        self.recoveredCritical = "Critical: \(FormatUtil.formatValue(value: caseModel.critical) ?? "")"
    }
    
}
