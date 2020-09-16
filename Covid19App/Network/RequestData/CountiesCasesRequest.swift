//
//  CountiesCasesRequest.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

struct CountiesCasesRequest {
        
}


// MARK: - Extension
extension CountiesCasesRequest: APIRequest {
    
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = Endpoint.scheme
        urlComponents.host = Endpoint.host
        urlComponents.path = "/countries"
        return urlComponents.url?.absoluteURL
    }
    
    func getURLRequest() -> URLRequest? {
        guard let url = url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        return urlRequest
    }
    
}
