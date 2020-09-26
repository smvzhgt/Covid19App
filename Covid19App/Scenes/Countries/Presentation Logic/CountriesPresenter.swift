//
//  CountriesPresenter.swift
//  Covid19App
//
//  Created by oleg on 21.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

final class CountriesPresenter {
    
    // MARK: - Public Properties
    weak var view: CountriesViewProtocol!
    
}


// MARK: - Extension
extension CountriesPresenter: CountriesPresenterProtocol {
    func presentFetchCountriesInformation(response: Countries.Fetch.Response) {
        switch response.result {
        case .success(let models):
            handleSuccessResult(models: models)
        case .failure(let error):
            handleFailureResult(error: error)
        }
    }
    
    private func handleSuccessResult(models: [CaseModel]) {
        DispatchQueue.global(qos: .userInitiated).async {  [weak self] in
            guard let `self` = self else { return }
            let presentationModels = models.map { caseModel -> Countries.CountryPresentationModel in
                return Countries.CountryPresentationModel(caseModel: caseModel)
            }
            DispatchQueue.main.async { [weak self] in
                guard let `self` = self else { return }
                let viewModel = Countries.Fetch.ViewModel(models: presentationModels, error: nil)
                self.view.displayFetchCountriesInformation(viewModel: viewModel)
            }
        }
    }
    
    private func handleFailureResult(error: CommonError) {
        let viewModel = Countries.Fetch.ViewModel(models: [], error: error)
        view.displayFetchCountriesInformation(viewModel: viewModel)
    }
    
}
