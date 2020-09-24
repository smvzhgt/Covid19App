//
//  CountriesViewController.swift
//  Covid19App
//
//  Created by oleg on 21.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import UIKit

final class CountriesViewController: BaseViewController {
    
    // MARK: - Public Properties
    var interactor: CountriesInteractorProtocol!
    var delegate: CountriesTableViewDelegate!
    
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTopBar()
        configureTableView()
        fetchInformation()
    }
    
    
    // MARK: - Private Functions
    private func configureTopBar() {
        navigationItem.title = "Coronavirus by Country"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshData))
    }
    
    @objc private func refreshData() {
        fetchInformation()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: CountryCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: CountryCell.cellIdentifier)
        tableView.delegate = delegate
        tableView.dataSource = delegate
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    private func fetchInformation() {
        showLoading()
        let request = Countries.Fetch.Request()
        interactor.fetchCountriesInformation(request: request)
    }
    
}


// MARK: - Extensions
extension CountriesViewController: CountriesViewProtocol {    
    func displayFetchCountriesInformation(viewModel: Countries.Fetch.ViewModel) {
        hideLoading()
        if let error = viewModel.error {
            showWarningDialog(message: error.localizedDescription)
        } else {
            delegate.dataSource = viewModel.models
            tableView.reloadData()
        }
    }
    
}
