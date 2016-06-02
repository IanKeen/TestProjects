//
//  ViewController.swift
//  DynamicSizedComponents
//
//  Created by Ian Keen on 1/06/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var c1: Component!
    @IBOutlet private var c2: Component!
    @IBOutlet private var c3: Component!
    
    @IBOutlet private var title1: UILabel!
    @IBOutlet private var subtitle1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title1.text = "foo foo foo foo foo"
        self.subtitle1.text = "123"
        
        
        c1.title.text = "foo foo foo foo foo"
        c1.subtitle.text = "123"
        
        c2.title.text = "foo"
        c2.subtitle.text = "1 2 3 4 5"
        
        c3.title.text = "foo"
        c3.subtitle.text = "bar baz"
    }
}

