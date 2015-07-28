//
//  AppDelegate.swift
//  ArrayListeners
//
//  Created by Ian Keen on 20/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    var strings: [String] = [] {
        didSet {
            println("didSet: \(strings)")
        }
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        strings.append("test1")
        strings.append("test2")
        strings.append("test3")
        
        return true
    }
}

