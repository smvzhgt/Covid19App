//
//  APIRequest.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

protocol APIRequest {
    var url: URL? { get }
    var urlComponents: URLComponents? { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
    func getURLRequest() -> URLRequest?
}

extension APIRequest {
    
    var urlComponents: URLComponents? {
        return nil
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
