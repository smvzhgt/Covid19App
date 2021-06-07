//
//  GlobalProtocol.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

// MARK: - Business Logic Protocol
protocol GlobalInteractorProtocol: AnyObject {
    func fetchGlobalInformation(request: Global.Fetch.Request)
}


// MARK: - Presentation Protocol
protocol GlobalPresenterProtocol: AnyObject {
    func presentFetchGlobalInformation(response: Global.Fetch.Response)
}


// MARK: - View Protocol
protocol GlobalViewProtocol: AnyObject {
    func displayFetchGlobalInformation(viewModel: Global.Fetch.ViewModel)
}

