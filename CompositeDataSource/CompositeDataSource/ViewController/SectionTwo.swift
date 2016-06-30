//
//  SectionTwo.swift
//  CompositeDataSource
//
//  Created by Ian Keen on 29/06/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class SectionTwo: SectionBase {
    override func reloadData() {
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
    
    //MARK: - DataSource
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCellWithIdentifier(String(CellTwo), forIndexPath: indexPath) as? CellTwo
            where self.data.indices ~= indexPath.row
            else { return UITableViewCell() }
        
        let friend = self.data[indexPath.row]
        cell.setup(friend)
        return cell
    }
}
