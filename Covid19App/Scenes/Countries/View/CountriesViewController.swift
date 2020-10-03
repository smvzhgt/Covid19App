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
    
    
    // MARK: - Private Properties
    private lazy var tableViewDelegate = CountriesTableViewDelegate()
    private let searchController = UISearchController(searchResultsController: nil)
    private var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    private var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTopBar()
        configureTableView()
        configureSearchController()
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
        let nibCell = UINib(nibName: CountryCell.cellIdentifier, bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: CountryCell.cellIdentifier)
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDelegate
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    private func fetchInformation() {
        showLoading()
        let request = Countries.Fetch.Request()
        interactor.fetchCountriesInformation(request: request)
    }
    
    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Country"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
}


// MARK: - Extensions
extension CountriesViewController: CountriesViewProtocol {    
    func displayFetchCountriesInformation(viewModel: Countries.Fetch.ViewModel) {
        hideLoading()
        if let error = viewModel.error {
            showWarningDialog(message: error.localizedDescription)
        } else {
            tableViewDelegate.dataSource = viewModel.models
            tableView.reloadData()
        }
    }
    
}

extension CountriesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.searchTextField.text else {
            return
        }
        
        tableViewDelegate.isFiltering = isFiltering
        tableViewDelegate.filterContentForSearchText(searchText)
        tableView.reloadData()
    }
    
}
