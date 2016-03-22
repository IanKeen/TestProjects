//
//  GenericViewController.swift
//  GenericStoryboards
//
//  Created by Ian Keen on 22/03/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class GenericViewController<T>: UIViewController {
    var label: UILabel?
    
    convenience init() { self.init(nibName: nil, bundle: nil) }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.textAlignment = .Center
        label.text = String(T)
        self.view.addSubview(label)
        self.label = label
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.label?.frame = self.view.bounds
    }
}
