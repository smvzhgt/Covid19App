//
//  GlobalViewController.swift
//  Covid19App
//
//  Created by oleg on 16.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import UIKit

final class GlobalViewController: BaseViewController {
    
    // MARK: - Public Properties
    var interactor: GlobalInteractorProtocol!
    var delegate: GlobalTableViewDelegate?
    
    
    // MARK: - IBOutlets
    @IBOutlet public weak var tableView: UITableView!
    
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTopBar()
        configureTableView()
        fetchInformation()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupDelegate()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setupDelegate()
    }
    
    
    // MARK: - Private Functions
    private func setupDelegate() {
        delegate = GlobalTableViewDelegate()
    }
    
    private func configureTopBar() {
        navigationItem.title = "World Coronavirus Information"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshData))
    }
    
    @objc private func refreshData() {
        fetchInformation()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: GlobalCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: GlobalCell.cellIdentifier)
        tableView.delegate = delegate
        tableView.dataSource = delegate
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    private func fetchInformation() {
        showLoading()
        let request = Global.Fetch.Request()
        interactor.fetchGlobalInformation(request: request)
    }
    
}


// MARK: - Extensions
extension GlobalViewController: GlobalViewProtocol {
    func displayFetchGlobalInformation(viewModel: Global.Fetch.ViewModel) {
        hideLoading()
        if let error = viewModel.error {
            showWarningDialog(message: error.localizedDescription)
        } else {
            delegate?.dataSource = viewModel.models
            tableView.reloadData()
        }
    }
    
}
