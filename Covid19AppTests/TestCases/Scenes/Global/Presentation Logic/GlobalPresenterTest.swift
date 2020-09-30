//
//  GlobalPresenterTest.swift
//  Covid19AppTests
//
//  Created by oleg on 28.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import XCTest
@testable import Covid19App

final class GlobalPresenterTest: XCTestCase {

    // MARK: - Private Properties
    private var sut: GlobalPresenter!
    private var viewController: GlobalViewControllerSpy!
    
    
    // MARK: - Lifecycle
    override func setUpWithError() throws {
        let globalPresenter = GlobalPresenter()
        let globalViewController = GlobalViewControllerSpy()
        
        globalPresenter.view = globalViewController
        
        sut = globalPresenter
        viewController = globalViewController
    }

    override func tearDownWithError() throws {
        sut = nil
        viewController = nil
    }
    
    
    // MARK: - Public Functions
    func testPresenter_displayFetchGlobalInformation() {
        // Given
        let response = Global.Fetch.Response(result: .success(Seeds.globalCaseModel))
        
        // When
        sut.presentFetchGlobalInformation(response: response)
        
        // Then
        XCTAssertTrue(viewController.isCalledDisplayFetchedGlobalInformation, "Not started viewController.displayFetchGlobalInformation(:)")
    }

}
