//
//  SecondViewController.swift
//  DecoupledSegues
//
//  Created by Ian Keen on 4/08/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, StringSender {
    var receiver: StringReceiver?
    
    @IBAction private func sendButtonTitle(sender: UIButton) {
        if let string = sender.titleLabel?.text {
            self.receiver?.stringSent(string)
        }
    }
}