//
//  ViewController.swift
//  ReactiveFormTest
//
//  Created by Ian Keen on 10/09/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet private var field1: UITextField!
    @IBOutlet private var field2: UITextField!
    @IBOutlet private var field3: UITextField!
    @IBOutlet private var button: UIButton!
    
    lazy private var fields: [UITextField] = { return [self.field1, self.field2, self.field3] }()
    private let textFieldLength = 6
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let enabled = self.fields.reduce(true) { bool, field in
            let length = count(field.text) + ((textField == field) ? count(string) - range.length : 0)
            return bool && (length >= self.textFieldLength)
        }
        self.button.enabled = enabled
        
        return true
    }
}
