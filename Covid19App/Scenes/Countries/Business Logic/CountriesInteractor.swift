//
//  CountriesInteractor.swift
//  Covid19App
//
//  Created by oleg on 21.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

final class CountriesInteractor {
    
    // MARK: - Public Properties
    let presenter: CountriesPresenterProtocol!
    
    
    // MARK: - Private Properties
    private var service: CaseServiceProtocol
    
    
    // MARK: - Initializers
    init(presenter: CountriesPresenterProtocol,
         service: CaseServiceProtocol = CaseService()) {
        self.presenter = presenter
        self.service = service
    }
    
}


// MARK: - Extension
extension CountriesInteractor: CountriesInteractorProtocol {
    func fetchCountriesInformation(request: Countries.Fetch.Request) {
        service.fetchCountriesCases { [weak self] (result: Result<[CaseModel], CommonError>) in
            guard let `self` = self else { return }
            let response = Countries.Fetch.Response(result: result)
            self.presenter.presentFetchCountriesInformation(response: response)
        }
    }
    
}
