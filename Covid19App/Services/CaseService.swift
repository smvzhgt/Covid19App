//
//  CaseService.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation
import CoreData

protocol CaseServiceProtocol {
    func fetchGlobalCases(completion: @escaping (_ result: GlobalCasesModel?, _ error: CommonError?) -> Void)
    func saveGlobalCaseEntity(model: GlobalCasesModel, completion: @escaping (_ error: CommonError?) -> Void)
    func fetchGlobalCaseModel(completion: @escaping (_ result: GlobalCasesModel?, _ error: CommonError?) -> Void)
    func fetchCountryCases(completion: @escaping (_ result: [CaseModel]?, CommonError?) -> Void)
    func saveCountryCaseEntities(models: [CaseModel], completion: @escaping (_ error: CommonError?) -> Void)
    func fetchCountryCaseModels(completion: @escaping (_ result: [CaseModel]?, _ error: CommonError?) -> Void)
}

final class CaseService {
    
    // MARK: - Private Properties
    private let apiClient: APIClientProtocol
    private let coreDataStack: CoreDataStack
    
    
    // MARK: - Initializers
    init(apiClient: APIClientProtocol = APIClient(), coreDataStack: CoreDataStack = CoreDataStack.shared) {
        self.apiClient = apiClient
        self.coreDataStack = coreDataStack
    }
    
}


// MARK: - Extension
extension CaseService: CaseServiceProtocol {
    
    func fetchGlobalCases(completion: @escaping (GlobalCasesModel?, CommonError?) -> Void) {
        apiClient.fetchAllCases(completion: completion)
    }
    
    func saveGlobalCaseEntity(model: GlobalCasesModel, completion: @escaping (CommonError?) -> Void) {
        coreDataStack.persistentContainer.performBackgroundTask { (context) in
            
            let entity = GlobalCaseEntity(context: context)
            entity.saveData(model: model)
            
            do {
                try context.save()
                DispatchQueue.main.async {
                    completion(nil)
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(CommonError.networkError(error: error))
                }
            }
        }
    }
    
    func fetchGlobalCaseModel(completion: @escaping (GlobalCasesModel?, CommonError?) -> Void) {
        let fetchRequest: NSFetchRequest<GlobalCaseEntity> = GlobalCaseEntity.fetchRequest()
        let asyncRequest = NSAsynchronousFetchRequest(fetchRequest: fetchRequest) { result in
            guard let entity = result.finalResult?.first else {
                return completion(nil, nil)
            }
            
            let model = GlobalCasesModel.convertToModel(entity: entity)
            
            DispatchQueue.main.async {
                completion(model, nil)
            }
        }
        
        do {
            let backgroundContext = coreDataStack.persistentContainer.newBackgroundContext()
            try backgroundContext.execute(asyncRequest)
        } catch let error {
            DispatchQueue.main.async {
                completion(nil, CommonError.networkError(error: error))
            }
        }
    }
    
    func fetchCountryCases(completion: @escaping ([CaseModel]?, CommonError?) -> Void) {
        apiClient.fetchCountryCases(completion: completion)
    }
    
    func saveCountryCaseEntities(models: [CaseModel], completion: @escaping (CommonError?) -> Void) {
        coreDataStack.persistentContainer.performBackgroundTask { (context) in
            for model in models {
                let entity = CaseEntity(context: context)
                entity.saveData(model: model)
            }
            
            do {
                try context.save()
                DispatchQueue.main.async {
                    completion(nil)
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(CommonError.networkError(error: error))
                }
            }
        }
    }
    
    func fetchCountryCaseModels(completion: @escaping ([CaseModel]?, CommonError?) -> Void) {
        let fetchRequest: NSFetchRequest<CaseEntity> = CaseEntity.fetchRequest()
        let asyncRequest = NSAsynchronousFetchRequest(fetchRequest: fetchRequest) { result in
            guard let entities = result.finalResult else {
                return completion(nil, nil)
            }
            
            let models = entities.map({ CaseModel.convertToModel(entity: $0) })
            
            DispatchQueue.main.async {
                completion(models, nil)
            }
        }
        
        do {
            let backgroundContext = coreDataStack.persistentContainer.newBackgroundContext()
            try backgroundContext.execute(asyncRequest)
        } catch let error {
            DispatchQueue.main.async {
                completion(nil, CommonError.networkError(error: error))
            }
        }
    }
    
}
