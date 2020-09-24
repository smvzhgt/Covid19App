//
//  GlobalCasesModel.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

final class GlobalCasesModel: Decodable {
    let cases: Int?
    let deaths: Int?
    let recovered: Int?
    
    init(cases: Int,
         deaths: Int,
         recovered: Int) {
        self.cases = cases
        self.deaths = deaths
        self.recovered = recovered
    }
}
