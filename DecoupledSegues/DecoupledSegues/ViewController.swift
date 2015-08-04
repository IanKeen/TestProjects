//
//  ViewController.swift
//  DecoupledSegues
//
//  Created by Ian Keen on 4/08/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, StringReceiver {
    @IBOutlet private var stringField: UITextField!
    
    func stringSent(string: String) {
        self.stringField.text = string
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let stringSender = segue.destinationViewController as? StringSender {
            stringSender.receiver = self
        }
    }
}
