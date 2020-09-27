//
//  GlobalModelCaseTests.swift
//  Covid19AppTests
//
//  Created by oleg on 27.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import XCTest
@testable import Covid19App

class GlobalModelCaseTests: XCTestCase {

    // MARK: - Public Properties
    var model: GlobalCasesModel!


    override func setUpWithError() throws {
        let data = readFile(name: "globalcase", extension: "json")
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        model = try decoder.decode(GlobalCasesModel.self, from: data)
    }

    override func tearDownWithError() throws {
        model = nil
    }


    // MARK: - Test Cases
    func testData_Model() {
        XCTAssertNotNil(model)
    }

    func testModel_Cases() {
        XCTAssertEqual(model.cases, 1000)
        XCTAssertEqual(model.deaths, 0)
        XCTAssertEqual(model.recovered, 1000)
    }

}

