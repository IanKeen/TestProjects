//
//  ViewController.swift
//  InputView
//
//  Created by Ian Keen on 23/06/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var customInputView: UIView!
    @IBOutlet private var textInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textInput.inputView = self.customInputView
    }
    
    @IBAction private func fooPress() {
        self.textInput.text = (self.textInput.text ?? "") + "foo "
    }
    @IBAction private func barPress() {
        self.textInput.text = (self.textInput.text ?? "") + "bar "
    }
}

