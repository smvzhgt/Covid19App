//
//  GlobalCaseEntity+CoreDataClass.swift
//  Covid19App
//
//  Created by oleg on 29.11.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//
//

import Foundation
import CoreData

@objc(GlobalCaseEntity)
public class GlobalCaseEntity: NSManagedObject {
    
}

extension GlobalCaseEntity {
    
    func saveData(model: GlobalCasesModel) {
        cases = Int32(model.cases ?? 0)
        deaths = Int32(model.deaths ?? 0)
        recovered = Int32(model.recovered ?? 0)
    }
    
}
