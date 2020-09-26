//
//  GlobalFlow.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

enum Global {
    enum Fetch {
        struct Request {
            
        }
        struct Response {
            let result: Result<GlobalCasesModel, CommonError>
        }
        struct ViewModel {
            let models: [GlobalPresentationModel]
            let error: CommonError?
        }
    }
    
    struct GlobalPresentationModel {
        let category: String?
        let value: String?
    }
    
}

