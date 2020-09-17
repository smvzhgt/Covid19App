//
//  GlobalInteractor.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

final class GlobalInteractor {
    
    // MARK: - Public Properties
    let presenter: GlobalPresenterProtocol!
    
    
    // MARK: - Private Properties
    private var service: CaseServiceProtocol
    
    
    // MARK: - Initializers
    init(presenter: GlobalPresenterProtocol,
         service: CaseServiceProtocol = CaseService()) {
        self.presenter = presenter
        self.service = service
    }
    
}


// MARK: - Extension
extension GlobalInteractor: GlobalInteractorProtocol {
    func fetchGlobalInformation(request: Global.Fetch.Request) {
        service.fetchAllCases {  [weak self] (result: Result<GlobalCasesModel, CommonError>) in
            guard let `self` = self else { return }
            let response = Global.Fetch.Response(result: result)
            self.presenter.presentFetchGlobalInformation(response: response)
        }
    }
    
}
