//
//  ViewController.swift
//  GenericStoryboards
//
//  Created by Ian Keen on 22/03/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class ViewController: GenericViewControllerContainer {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.genericViewController = GenericViewController<String>()
    }
}

