//
//  CommonError.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

enum CommonError: Error {
    
    case invalidRequest
    case invalidResponse
    case invalidResponseDataType
    case decodingDataError
    case generalError(eror: Error)
    case networkError(error: Error)
    case failGetDataFromFile
    case resourceNotFound
    case mockError(message: String)
    
    
    var localizedDescription: String {
        switch self {
        case .invalidRequest:
            return "Invalid Request"
        case .invalidResponse:
            return "Invalid Response"
        case .invalidResponseDataType:
            return "Invalid Response Data Type"
        case .decodingDataError:
            return "Decoding Data Error"
        case let .networkError(error):
            return "Network:\n\(error.localizedDescription)"
        case let .generalError(error):
            return "Error error:\n\(error.localizedDescription)"
        case .failGetDataFromFile:
            return "Can not read data from json file"
        case .resourceNotFound:
            return "File resource json to read data not found"
        case .mockError(message: let message):
            return "Mock error: \(message)"
        }
    }
    
}
