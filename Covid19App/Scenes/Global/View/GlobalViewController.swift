//
//  GlobalViewController.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import UIKit

final class GlobalViewController: UIViewController {
    
    // MARK: - Public Properties
    var interactor: GlobalInteractorProtocol!
    var delegate: GlobalTableViewDelegate!
    
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        fetchInformation()
    }
    
    
    // MARK: - Private Functions
    private func configureTableView() {
        tableView.register(UINib(nibName: GlobalCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: GlobalCell.cellIdentifier)
        tableView.delegate = delegate
        tableView.dataSource = delegate
    }
    
    private func fetchInformation() {
        let request = Global.Fetch.Request()
        interactor.fetchGlobalInformation(request: request)
    }
    
}


// MARK: - Extensions
extension GlobalViewController: GlobalViewProtocol {
    func displayFetchGlobalInformation(viewModel: Global.Fetch.ViewModel) {
        if let error = viewModel.error {
            // TODO: show error
        } else {
            delegate.dataSource = viewModel.models
            tableView.reloadData()
        }
    }
    
}
