//
//  ViewController.swift
//  Temp
//
//  Created by Ian Keen on 27/05/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

import UIKit

/*

This is where the magic happens.., this code should live in its own file..

*/
protocol ViewModelBackedViewController: class {
    typealias ViewModelType
    var viewModel: ViewModelType! { get set }
}
extension UIViewController {
    static func instance() -> Self { return self() } /* replace this with more appropriate init method.. */
    
    static func instance<T: ViewModelBackedViewController>(viewModel: T.ViewModelType) -> T? {
        if let instance = self.instance() as? T {
            instance.viewModel = viewModel
            return instance;
        }
        return nil;
    }
}
/*



*/



/*

To make this work:

1. Create a view model 
2. Make view controller adhere to ViewModelBackedViewController
2. Add the viewModel property and set the typealias value
3. Profit!

*/

class MyViewmodel {
    var bgColor: UIColor = UIColor.redColor()
}

class ViewController: UIViewController, ViewModelBackedViewController {
    typealias ViewModelType = MyViewmodel
    var viewModel: ViewModelType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = self.viewModel.bgColor
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("tapTap:"))
        self.view.addGestureRecognizer(tap)
    }
    
    func tapTap(sender: AnyObject) {
        if let instance = newInstance() {
            self.navigationController?.pushViewController(instance, animated: true)
        }
    }
    
}

/*
example instansiation
*/
func newInstance() -> ViewController? {
    let model = MyViewmodel()
    if let instance: ViewController = ViewController.instance(model) { //important to specifiy the VC type with the variable otherwise it can't infer from T.ViewModelType
        return instance
    }
    return nil
}
