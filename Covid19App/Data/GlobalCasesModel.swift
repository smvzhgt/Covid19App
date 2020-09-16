//
//  GlobalCasesModel.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

final class GlobalCasesModel: Codable {
    var cases: Int
    var deaths: Int
    var recovered: Int
    
    init(cases: Int,
         deaths: Int,
         recovered: Int) {
        self.cases = cases
        self.deaths = deaths
        self.recovered = recovered
    }
}
