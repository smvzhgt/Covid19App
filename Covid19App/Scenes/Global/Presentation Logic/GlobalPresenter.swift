//
//  GlobalPresenter.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

final class GlobalPresenter {
    
    // MARK: - Public Properties
    weak var view: GlobalViewProtocol!
    
    
    // MARK: - Private Functions
    private func buildPresentationModels(model: GlobalCasesModel) -> [Global.GlobalPresentationModel] {
        let casesModel = Global.GlobalPresentationModel(title: "Global", category: "Coronavirus cases", value: model.cases)
        let deathsModel = Global.GlobalPresentationModel(title: "Global", category: "Deaths", value: model.deaths)
        let recoveredModel = Global.GlobalPresentationModel(title: "Global", category: "Recovered", value: model.recovered)
        return [casesModel, deathsModel, recoveredModel]
    }
    
}


// MARK: - Extension
extension GlobalPresenter: GlobalPresenterProtocol {
    func presentFetchGlobalInformation(response: Global.Fetch.Response) {
        switch response.result {
        case .success(let model):
            DispatchQueue.global(qos: .userInitiated).async {  [weak self] in
                guard let `self` = self else { return }
                let presentationModels = self.buildPresentationModels(model: model)
                DispatchQueue.main.async { [weak self] in
                    guard let `self` = self else { return }
                    let viewModel = Global.Fetch.ViewModel(models: presentationModels, error: nil)
                    self.view.displayFetchGlobalInformation(viewModel: viewModel)
                }
            }
        case .failure(let error):
            let viewModel = Global.Fetch.ViewModel(models: [], error: error)
            view.displayFetchGlobalInformation(viewModel: viewModel)
        }
    }
    
}
