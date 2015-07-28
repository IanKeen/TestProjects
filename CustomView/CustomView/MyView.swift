//
//  MyView.swift
//  CustomView
//
//  Created by Ian Keen on 20/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

import UIKit

@IBDesignable class MyView: UIView {
    @IBOutlet private var textField: UITextField!
    @IBInspectable var bgColor: UIColor = .redColor()
    var view: UIView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "MyView", bundle: bundle)
        
        let view = nib.instantiateWithOwner(self, options: nil).first as! UIView
        return view
    }
    func xibSetup() {
        self.view = loadViewFromNib()
        self.view.frame = bounds
        self.view.autoresizingMask = (.FlexibleWidth | .FlexibleHeight)
        self.addSubview(self.view)
    }
    override func drawRect(rect: CGRect) {
        self.bgColor.set()
        CGContextFillRect(UIGraphicsGetCurrentContext(), rect)
    }
}
