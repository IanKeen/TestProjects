//
//  ViewController.swift
//  GenericStoryboards
//
//  Created by Ian Keen on 22/03/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class ViewController: GenericViewControllerContailer {
}

class GenericViewControllerContailer: UIViewController {
    let genericViewController = GenericViewController<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChildViewController(self.genericViewController)
        self.genericViewController.willMoveToParentViewController(self)
        self.view.addSubview(self.genericViewController.view)
        self.genericViewController.didMoveToParentViewController(self)
    }
    override func viewWillLayoutSubviews() {
        self.genericViewController.view.frame = self.view.bounds
    }
}
