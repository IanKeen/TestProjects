//
//  ViewController.swift
//  SlimNestedCollectionViews
//
//  Created by Ian Keen on 17/08/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    @IBOutlet private var parentCollectionViewDataSourceDelegate: ParentCollectionViewDataSourceDelegate!
    @IBOutlet private var childCollectionViewDataSourceDelegate: ChildCollectionViewDataSourceDelegate!
}

