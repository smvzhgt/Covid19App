//
//  GlobalInteractorTest.swift
//  Covid19AppTests
//
//  Created by oleg on 28.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import XCTest
@testable import Covid19App

final class GlobalInteractorTest: XCTestCase {
    
    // MARK: - Private Properties
    private var sut: GlobalInteractor!
    private var globalPresenter: GlobalPresenterSpy!
    private var caseService: CaseServiceSpy!
    
    
    // MARK: - Lifecycle
    override func setUpWithError() throws {
        let presenter = GlobalPresenterSpy(globalCaseModel: Seeds.globalCaseModel)
        let service = CaseServiceSpy(globalCaseModel: Seeds.globalCaseModel,
                                     caseModels: Seeds.caseModels)
        let interactor = GlobalInteractor(presenter: presenter, service: service)
        
        sut = interactor
        caseService = service
        globalPresenter = presenter
    }
    
    override func tearDownWithError() throws {
        sut = nil
        caseService = nil
        globalPresenter = nil
    }
    
    
    // MARK: - Public Functions
    func testInteractor_fetchGlobalInformation_callService() {
        // Given
        let request = Global.Fetch.Request()
        
        // When
        sut.fetchGlobalInformation(request: request)
        
        // Then
        XCTAssertTrue(caseService.isCalledFetchAllCases, "Not started service.fetchAllCases(:)")
        
    }
    
    func testInteractor_fetchGlobalInformation_callPresenter() {
        // Given
        let request = Global.Fetch.Request()
        
        // When
        sut.fetchGlobalInformation(request: request)
        
        // Then
        XCTAssertTrue(globalPresenter.isCalledPresentFetchedGlobalInformation, "Not started globalPresenter.presentFetchGlobalInformation(:)")
    }
    
    func testInteractor_fetchGlobalInformation_callPresenter_theSameResult() {
        // Given
        let request = Global.Fetch.Request()
        
        // When
        sut.fetchGlobalInformation(request: request)
        
        // Then
        XCTAssertEqual(globalPresenter.globalCaseModel, Seeds.globalCaseModel, "fetchGlobalInformation() should ask the presenter to format the same movies it fetched")
    }
    
}
