//
//  Protocols.swift
//  DecoupledSegues
//
//  Created by Ian Keen on 4/08/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

import Foundation

protocol StringReceiver {
    func stringSent(string: String)
}

protocol StringSender: class {
    var receiver: StringReceiver? { get set }
}