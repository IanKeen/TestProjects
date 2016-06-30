//
//  CompositeDataSource.swift
//  CompositeDataSource
//
//  Created by Ian Keen on 29/06/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

enum CompositeDataSourceState: Equatable {
    case Loading
    case Complete
    case Failed
}

typealias CompositeTableViewDataSourceStateUpdate = (CompositeDataSourceState) -> Void

protocol CompositeTableViewDataSourceSection: UITableViewDataSource {
    var state: CompositeDataSourceState { get }
    var stateUpdated: CompositeTableViewDataSourceStateUpdate { get set }
    func reloadData()
}

final class CompositeTableViewDataSource: NSObject, UITableViewDataSource {
    //MARK: - Public Properties
    private(set) var state: CompositeDataSourceState = .Loading {
        didSet { self.stateUpdated(self.state) }
    }
    
    //MARK: - Private Properties
    private var dataSources: [CompositeTableViewDataSourceSection]
    private let stateUpdated: CompositeTableViewDataSourceStateUpdate
    
    //MARK: - Lifecycle
    init(dataSources: [CompositeTableViewDataSourceSection], stateUpdated: CompositeTableViewDataSourceStateUpdate) {
        self.dataSources = dataSources
        self.stateUpdated = stateUpdated
        
        super.init()
        self.bindToDataSources()
    }
    
    //MARK: - Public Functions
    func reloadData() {
        self.dataSources.forEach { $0.reloadData() }
    }
    
    //MARK: - Private Function
    func bindToDataSources() {
        self.dataSources.forEach { $0.stateUpdated = self.childStateUpdated }
    }
    private func childStateUpdated(state: CompositeDataSourceState) {
        switch state {
        case .Failed: self.state = .Failed
        case .Loading: self.state = .Loading
        case .Complete:
            let totalComplete = self.dataSources.filter({ $0.state == .Complete }).count
            self.state = (totalComplete == self.dataSources.count ? .Complete : .Loading)
        }
    }
    
    //MARK: - UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.dataSources.count
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard self.dataSources.indices ~= section else { return 0 }
        return self.dataSources[section].tableView(tableView, numberOfRowsInSection: section)
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard self.dataSources.indices ~= indexPath.section else { return UITableViewCell() }
        return self.dataSources[indexPath.section].tableView(tableView, cellForRowAtIndexPath: indexPath)
    }
}
