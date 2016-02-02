//
//  ProgressView.swift
//  ProgressTest
//
//  Created by Ian Keen on 1/02/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    private var progressView = UIView()
    private var initialDraw = true
    
    var progressColor: UIColor = .redColor()
    var positionView: UIView = ProgressView.defaultPositionView()
    
    @IBInspectable var progress: CGFloat = 0.0 {
        didSet {
            if (self.progress < 0.0) { self.progress = 0.0 }
            else if (self.progress > 1.0) { self.progress = 1.0 }
            else {
                let duration = (self.initialDraw ? 0.0 : 0.35)
                self.initialDraw = false
                UIView.animateWithDuration(duration) {
                    self.setNeedsLayout()
                    self.layoutIfNeeded()
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .lightGrayColor()
        self.addSubview(self.progressView)
        self.addSubview(self.positionView)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = self.bounds.width * self.progress
        self.progressView.backgroundColor = self.progressColor
        self.progressView.frame = CGRect(x: 0, y: 0, width: width, height: self.bounds.height)
        
        let x = width.clamp(0 + self.positionView.bounds.midX, max: self.bounds.width - self.positionView.bounds.midX)
        self.positionView.center = CGPoint(x: x, y: self.bounds.midY)
    }
    
    static private func defaultPositionView() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40.0, height: 40.0))
        view.backgroundColor = .blueColor()
        return view
    }
}

extension FloatingPointType {
    func clamp(min: Self, max: Self) -> Self {
        if (self < min) { return min }
        else if (self > max) { return max }
        return self
    }
}