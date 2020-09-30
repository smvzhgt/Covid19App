//
//  GlobalViewControllerTest.swift
//  Covid19AppTests
//
//  Created by oleg on 28.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import XCTest
@testable import Covid19App

final class GlobalViewControllerTest: XCTestCase {
    
    // MARK: - Private Properties
    private var sut: GlobalViewController!
    private var interactor: GlobalInteractorProtocolSpy!
    private var window: UIWindow!
    
    
    // MARK: - Lifecycle
    override func setUpWithError() throws {
        let mainWindow = UIWindow()
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Global", bundle: bundle)
        
        let globalViewController = storyboard.instantiateViewController(identifier: "GlobalViewController") as? GlobalViewController
        let globalInteractor = GlobalInteractorProtocolSpy()
        
        globalViewController?.interactor = globalInteractor
                
        sut = globalViewController
        interactor = globalInteractor
        window = mainWindow
        
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    override func tearDownWithError() throws {
        sut = nil
        interactor = nil
        window = nil
    }
    
    
    // MARK: - Public Functions
    func testDidLoad() {
        sut.viewWillAppear(true)
        
        XCTAssert(interactor.isCalledFetchGlobalInformation, "Not started interactor.fetchGlobalInformation(:)")
    }
    
    func testDisplayFetchedGlobalInformation() {
        // Given
        let tableViewSpy = TableViewSpy()
        let models = [
            Global.GlobalPresentationModel(category: "Coronavirus cases", value: "120,000"),
            Global.GlobalPresentationModel(category: "Deaths", value: "1,000"),
            Global.GlobalPresentationModel(category: "Recovered", value: "119,000")
        ]
        let viewModel = Global.Fetch.ViewModel(models: models, error: nil)
        sut.tableView = tableViewSpy

        // When
        sut.displayFetchGlobalInformation(viewModel: viewModel)
        
        // Then
        XCTAssertTrue(tableViewSpy.isCalledReloadData, "Not started tableView.reloadData")
    }
    
}
