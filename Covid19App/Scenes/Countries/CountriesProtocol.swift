//
//  CountriesProtocol.swift
//  Covid19App
//
//  Created by oleg on 21.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

// MARK: - Business Logic Protocol
protocol CountriesInteractorProtocol: class {
    func fetchCountriesInformation(request: Countries.Fetch.Request)
}


// MARK: - Presentation Protocol
protocol CountriesPresenterProtocol: class {
    func presentFetchCountriesInformation(response: Countries.Fetch.Response)
}


// MARK: - View Protocol
protocol CountriesViewProtocol: class {
    func displayFetchCountriesInformation(viewModel: Countries.Fetch.ViewModel)
}

