//
//  SectionTwo.swift
//  CompositeDataSource
//
//  Created by Ian Keen on 29/06/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class SectionTwo: NSObject, CompositeTableViewDataSourceSection, CellRepresentable {
    //MARK: - Private Properties
    private let viewModel: ViewModel
    private var data = [Friend]()
    
    //MARK: - Lifecycle
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    //MARK: - CompositeTableViewDataSourceSection
    private(set) var state: CompositeDataSourceState = .Loading {
        didSet {
            print("SectionTwo State: \(self.state)")
            self.stateUpdated(self.state)
        }
    }
    var stateUpdated: CompositeTableViewDataSourceStateUpdate = { _ in }
    func reloadData() {
        self.state = .Loading
        self.viewModel.sectionTwoData(
            success: { data in
                self.data = data
                self.state = .Complete
            },
            failure: { error in
                print(error)
                self.state = .Failed
            }
        )
    }
    
    //MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard
            let cell = self.dequeueCell(tableView, indexPath: indexPath) as? CellTwo
            where self.data.indices ~= indexPath.row
            else { return UITableViewCell() }
        
        let friend = self.data[indexPath.row];
        cell.setup(friend)
        return cell
    }
    
    //MARK: - CellRepresentable
    static func registerCell(tableView: UITableView) {
        tableView.registerNib(UINib(nibName: String(CellTwo), bundle: nil), forCellReuseIdentifier: String(CellTwo))
    }
    func dequeueCell(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier(String(CellTwo), forIndexPath: indexPath)
    }
    func cellSelected() {
        //..
    }
}