//
//  GlobalProtocol.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

// MARK: - Business Logic Protocol
protocol GlobalInteractorProtocol: class {
    func fetchGlobalInformation(request: Global.Fetch.Request)
}


// MARK: - Presentation Protocol
protocol GlobalPresenterProtocol: class {
    func presentFetchGlobalInformation(response: Global.Fetch.Response)
}


// MARK: - View Protocol
protocol GlobalViewProtocol: class {
    func displayFetchGlobalInformation(viewModel: Global.Fetch.ViewModel)
}

