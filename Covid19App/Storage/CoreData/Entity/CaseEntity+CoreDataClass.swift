//
//  CaseEntity+CoreDataClass.swift
//  Covid19App
//
//  Created by oleg on 29.11.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CaseEntity)
public class CaseEntity: NSManagedObject {

}

extension CaseEntity {
    
    func saveData(model: CaseModel) {
        country = model.country
        cases = Int32(model.cases ?? 0)
        todayCases = Int32(model.todayCases ?? 0)
        deaths = Int32(model.deaths ?? 0)
        todayDeaths = Int32(model.todayDeaths ?? 0)
        recovered = Int32(model.recovered ?? 0)
        active = Int32(model.active ?? 0)
        critical = Int32(model.critical ?? 0)
        casesPerOneMillion = Int32(model.casesPerOneMillion ?? 0)
        deathsPerOneMillion = Int32(model.deathsPerOneMillion ?? 0)
        totalTests = Int32(model.totalTests ?? 0)
        testsPerOneMillion = Int32(model.testsPerOneMillion ?? 0)
    }
    
}
