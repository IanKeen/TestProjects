//
//  GenericViewControllerContainer.swift
//  GenericStoryboards
//
//  Created by Ian Keen on 22/03/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class GenericViewControllerContailer: UIViewController {
    var genericViewController: UIViewController? {
        willSet {
            if let existing = self.genericViewController {
                existing.willMoveToParentViewController(nil)
                existing.view.removeFromSuperview()
                existing.removeFromParentViewController()
            }
        }
        didSet {
            guard let genericViewController = self.genericViewController else { return }
            self.addChildViewController(genericViewController)
            genericViewController.willMoveToParentViewController(self)
            self.view.addSubview(genericViewController.view)
            genericViewController.didMoveToParentViewController(self)
        }
    }
    override func viewWillLayoutSubviews() {
        self.genericViewController?.view.frame = self.view.bounds
    }
}
