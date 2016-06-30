//
//  SectionBase.swift
//  CompositeDataSource
//
//  Created by Ian Keen on 29/06/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class SectionBase: NSObject, CompositeTableViewDataSourceSection {
    //MARK: - Internal Properties
    internal let viewModel: ViewModel
    internal var data = [Friend]()
    
    //MARK: - Lifecycle
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    //MARK: - CompositeTableViewDataSourceSection
    internal var state: CompositeDataSourceState = .Loading {
        didSet {
            print("\(String(self)) State: \(self.state)")
            self.stateUpdated(self.state)
        }
    }
    var stateUpdated: CompositeTableViewDataSourceStateUpdate = { _ in fatalError("This must be set") }
    func reloadData() {
        fatalError("Must Override")
    }
    
    //MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        fatalError("Must Override")
    }
}