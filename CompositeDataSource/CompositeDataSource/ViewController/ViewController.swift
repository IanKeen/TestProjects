//
//  ViewController.swift
//  CompositeDataSource
//
//  Created by Ian Keen on 29/06/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var spinner: UIActivityIndicatorView!
    
    //MARK: - Private
    private var viewModel: ViewModel!
    lazy var dataSource: CompositeTableViewDataSource = CompositeTableViewDataSource(
        dataSources: [
            SectionOne(viewModel: self.viewModel),
            SectionTwo(viewModel: self.viewModel)
        ],
        stateUpdated: self.tableStateUpdated
    )
    
    //MARK: - Lifecycle
    convenience init(viewModel: ViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        
        self.title = "CompositeDataSource"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Refresh", style: .Plain,
            target: self, action: #selector(ViewController.reloadData)
        )
        
        self.reloadData()
    }
    
    //MARK: - TableView
    private func configureTableView() {
        self.viewModel.cellRepresentables.forEach { $0.registerCell(self.tableView) }
        self.tableView.dataSource = self.dataSource
    }
    private func tableStateUpdated(state: CompositeDataSourceState) {
        print("DataSource State: \(state)")
        self.spinner.stopAnimating()
        
        switch state {
        case .Loading:
            self.spinner.startAnimating()
            
        case .Failed:
            UIAlertView(title: self.title, message: "An Error Occured", delegate: nil, cancelButtonTitle: "OK").show()
            
        case .Complete:
            self.tableView.reloadData()
        }
    }
    @objc private func reloadData() {
        self.dataSource.reloadData()
    }
}
