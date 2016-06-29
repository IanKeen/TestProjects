//
//  CellTwo.swift
//  CompositeDataSource
//
//  Created by Ian Keen on 29/06/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class CellTwo: UITableViewCell {
    @IBOutlet private var nameLabel: UILabel!
    
    func setup(friend: Friend) {
        self.nameLabel.text = "\(friend.firstName) \(friend.lastName)"
    }
}
