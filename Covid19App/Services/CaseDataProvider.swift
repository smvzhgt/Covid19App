//
//  CaseDataProvider.swift
//  Covid19App
//
//  Created by oleg on 29.11.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation
import CoreData
import Promises

protocol CaseDataProviderProtocol {
    func fetchGlobalCases(completion: @escaping (Result<GlobalCasesModel?, CommonError>) -> Void)
    func fetchCountryCases(completion: @escaping (Result<[CaseModel], CommonError>) -> Void)
}

final class CaseDataProvider {
    
    // MARK: - Private Properties
    private let service: CaseServiceProtocol
    private var entity: GlobalCaseEntity?
    private let coreDataStack: CoreDataStack
    private let globalCaseKey: String = "last_sync_global_case_date"
    private let allCasesKey: String = "last_sync_all_cases_date"
    
    
    // MARK: - Initializers
    init(service: CaseServiceProtocol = CaseService(), coreDataStack: CoreDataStack = CoreDataStack.shared) {
        self.service = service
        self.coreDataStack = coreDataStack
    }
    
}


// MARK: - Extension
extension CaseDataProvider: CaseDataProviderProtocol {
    
    // MARK: - Public Functions
    func fetchGlobalCases(completion: @escaping (Result<GlobalCasesModel?, CommonError>) -> Void) {
        
        let lastUsedDate = UserDefaults.standard.integer(forKey: globalCaseKey)
        
        func fetchData() {
            fetchGlobalCaseModelFromDataBase().then({ model in
                completion(.success(model))
            }).catch({ error in
                completion(.failure(.generalError(eror: error)))
            })
        }
        
        func updateData() {
            fetchGlobalCaseModelFromServer().then({ [unowned self] model in
                return self.saveGlobalCaseModelToDataBase(model: model)
            }).then({ [unowned self] in
                return self.fetchGlobalCaseModelFromDataBase()
            }).then({ model in
                completion(.success(model!))
            }).catch({ error in
                completion(.failure(.generalError(eror: error)))
            })
        }
        
        
        if lastUsedDate == 0 || !DateUtil.isTheSameDay(comparedDateInMilliseconds: lastUsedDate) {
            let todayDateInMilliseconds = Date().millisecondsSince1970
            UserDefaults.standard.setValue(todayDateInMilliseconds, forKey: globalCaseKey)
            
            updateData()
        } else {
            fetchData()
        }
    }
    
    func fetchCountryCases(completion: @escaping (Result<[CaseModel], CommonError>) -> Void) {
        let lastUsedDate = UserDefaults.standard.integer(forKey: allCasesKey)
        
        func fetchData() {
            fetchCountryCaseModelsFromDataBase().then({ models in
                completion(.success(models ?? []))
            }).catch({ error in
                completion(.failure(.generalError(eror: error)))
            })
        }
        
        func updateData() {
            fetchCountryCaseModelsFromServer().then({ [unowned self] models in
                return self.saveCountryCaseModelsToDataBase(models: models)
            }).then({ [unowned self] in
                return self.fetchCountryCaseModelsFromDataBase()
            }).then({ models in
                completion(.success(models ?? []))
            }).catch({ error in
                completion(.failure(.generalError(eror: error)))
            })
        }
        
        if lastUsedDate == 0 || !DateUtil.isTheSameDay(comparedDateInMilliseconds: lastUsedDate) {
            let todayDateInMilliseconds = Date().millisecondsSince1970
            UserDefaults.standard.setValue(todayDateInMilliseconds, forKey: allCasesKey)
            
            updateData()
        } else {
            fetchData()
        }
    }
    
    
    // MARK: - Private Functions
    private func fetchGlobalCaseModelFromServer() -> Promise<GlobalCasesModel> {
        return Promise<GlobalCasesModel>(on: .global(qos: .userInitiated), { fullfill, reject in
            self.service.fetchGlobalCases { (model, error) in
                if let error = error {
                    reject(CommonError.networkError(error: error))
                } else if let model = model {
                    fullfill(model)
                } else {
                    reject(CommonError.invalidResponse)
                }
            }
        })
    }
    
    private func saveGlobalCaseModelToDataBase(model: GlobalCasesModel) -> Promise<Void> {
        return Promise<Void>(on: .global(qos: .userInitiated), { fullfill, reject in
            self.service.saveGlobalCaseEntity(model: model) { (error) in
                if let error = error {
                    reject(error)
                } else {
                    fullfill(())
                }
            }
        })
    }
    
    private func fetchGlobalCaseModelFromDataBase() -> Promise<GlobalCasesModel?> {
        return Promise<GlobalCasesModel?>(on: .global(qos: .userInitiated), { fullfill, reject in
            self.service.fetchGlobalCaseModel{ (model, error) in
                if let error = error {
                    reject(error)
                } else  {
                    fullfill(model)
                }
            }
        })
    }
    
    private func fetchCountryCaseModelsFromServer() -> Promise<[CaseModel]> {
        return Promise<[CaseModel]>(on: .global(qos: .userInitiated), { fullfill, reject in
            self.service.fetchCountryCases { models, error in
                if let error = error {
                    reject(CommonError.networkError(error: error))
                } else if let models = models {
                    fullfill(models)
                } else {
                    reject(CommonError.invalidResponse)
                }
            }
        })
    }
    
    private func saveCountryCaseModelsToDataBase(models: [CaseModel]) -> Promise<Void> {
        return Promise<Void>(on: .global(qos: .userInitiated), { fullfill, reject in
            self.service.saveCountryCaseEntities(models: models) { (error) in
                if let error = error {
                    reject(error)
                } else {
                    fullfill(())
                }
            }
        })
    }
    
    private func fetchCountryCaseModelsFromDataBase() -> Promise<[CaseModel]?> {
        return Promise<[CaseModel]?>(on: .global(qos: .userInitiated), { fullfill, reject in
            self.service.fetchCountryCaseModels { (models, error) in
                if let error = error {
                    reject(error)
                } else  {
                    fullfill(models)
                }
            }
        })
    }
    
}
