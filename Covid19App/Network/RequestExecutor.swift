//
//  RequestExecutor.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation
import Combine

protocol RequestExecutorProtocol {
    func execute<T: Decodable>(with urlRequest: URLRequest, completion: @escaping((Result<T, CommonError>) -> Void))
}


final class RequestExecutor {
    private let urlSession: URLSession
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.httpMaximumConnectionsPerHost = 5
        urlSession = URLSession(configuration: configuration)
    }
}


// MARK: - Extension
extension RequestExecutor: RequestExecutorProtocol {
    
    func execute<T: Decodable>(with urlRequest: URLRequest, completion: @escaping ((Result<T, CommonError>) -> Void)) {
        
        let task = urlSession.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(CommonError.networkError(error: error)))
                }
            }
            
            guard self.isSuccessCode(response) else {
                DispatchQueue.main.async {
                    completion(.failure(CommonError.invalidResponse))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(CommonError.invalidResponseDataType))
                }
                return
            }
            
            do {
                let decoder: JSONDecoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .secondsSince1970
                let resultData = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(resultData))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(Result.failure(CommonError.decodingDataError))
                }
            }
            
        }
        task.resume()
    }
    
    
    // MARK: - Private Functions
    private func isSuccessCode(_ statusCode: Int) -> Bool {
        
        return statusCode >= 200 && statusCode < 300
    }
    
    private func isSuccessCode(_ response: URLResponse?) -> Bool {
        
        guard let urlResponse = response as? HTTPURLResponse else {
            return false
        }
        
        return isSuccessCode(urlResponse.statusCode)
    }
    
}
