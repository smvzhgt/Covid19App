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
    private var sut: GlobalInteractorProtocol!
    private var globalPresenter: GlobalPresenterSpy!
    private var caseService: CaseServiceSpy!
    
    
    // MARK: - Lifecycle
    override func setUpWithError() throws {
        let presenter = GlobalPresenterSpy()
        let service = CaseServiceSpy()
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
    
    
    // MARK: - Public Methods
    func testFetchGlobalInformationCallServiceToFetch() {
        // Given
        let request = Global.Fetch.Request()
        
        // When
        sut.fetchGlobalInformation(request: request)
        
        // Then
        XCTAssertTrue(caseService.isCalledFetchAllCases, "Not started service.fetchAllCases(:)")
        
    }
    
    func testFetchGlobalInformationCallPresenterToTransformData() {
        // Given
        let request = Global.Fetch.Request()
        
        // When
        sut.fetchGlobalInformation(request: request)
        
        // Then
        XCTAssertTrue(globalPresenter.isCalledPresentFetchedGlobalInformation, "Not started globalPresenter.presentFetchGlobalInformation(:)")
    }
    
}
