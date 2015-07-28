//
//  TextViewController.swift
//  ContainmentExample
//
//  Created by Ian Keen on 28/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
    @IBOutlet private var textField: UITextField!
    
    func updateTextField(text: String) {
        self.textField.text = text
    }
}
