//
//  SectionOne.swift
//  CompositeDataSource
//
//  Created by Ian Keen on 29/06/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class SectionOne: SectionBase {
    override func reloadData() {
        self.state = .Loading
        self.viewModel.sectionOneData(
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

    //MARK: - CellRepresentable
    override class func registerCellWithTableView(tableView: UITableView) {
        tableView.registerNib(UINib(nibName: String(CellOne), bundle: nil), forCellReuseIdentifier: String(CellOne))
    }
    override func dequeueCell(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCellWithIdentifier(String(CellOne), forIndexPath: indexPath) as? CellOne
            where self.data.indices ~= indexPath.row
            else { return UITableViewCell() }
        
        let friend = self.data[indexPath.row]
        cell.setup(friend)
        return cell
    }
    override func cellSelected() {
        //..
    }
}
