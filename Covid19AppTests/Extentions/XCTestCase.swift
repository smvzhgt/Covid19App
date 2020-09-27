//
//  XCTestCase.swift
//  Covid19AppTests
//
//  Created by oleg on 27.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import XCTest

extension XCTestCase {
    
    func readFile(name: String, extension: String) -> Data {
        let bundle = Bundle(for: type(of: self))
        
        let url = bundle.url(forResource: name, withExtension: `extension`)
        
        return try! Data(contentsOf: url!)
    }
    
}
