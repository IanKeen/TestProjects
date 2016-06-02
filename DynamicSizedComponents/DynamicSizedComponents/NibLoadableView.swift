//
//  NibLoadableView.swift
//  DynamicSizedComponents
//
//  Created by Ian Keen on 1/06/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class NibLoadableView: UIView {
    //MARK: - Components
    private var view: UIView!
    
    //MARK: - Lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.nibSetup()
        self.initialSetup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.nibSetup()
        self.initialSetup()
    }
    
    //MARK: - Private
    private func nibSetup() {
        self.view = self.loadViewFromNib()
        self.view.frame = bounds
        self.view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        self.addSubview(self.view)
    }
    private func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: String(self.dynamicType), bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil).first as! UIView
        return view
    }
    
    //MARK: - Override Points
    internal func initialSetup() { }
}