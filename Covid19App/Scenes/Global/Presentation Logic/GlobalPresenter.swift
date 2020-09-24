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
        let casesModelValue = FormatUtil.formatValue(value: model.cases ?? 0) ?? ""
        let casesModel = Global.GlobalPresentationModel(category: "Coronavirus cases", value: casesModelValue)
        let deathsModelValue = FormatUtil.formatValue(value: model.deaths ?? 0) ?? ""
        let deathsModel = Global.GlobalPresentationModel(category: "Deaths", value: deathsModelValue)
        let recoveredModelValue = FormatUtil.formatValue(value: model.recovered ?? 0) ?? ""
        let recoveredModel = Global.GlobalPresentationModel(category: "Recovered", value: recoveredModelValue)
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
