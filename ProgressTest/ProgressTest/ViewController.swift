//
//  ViewController.swift
//  ProgressTest
//
//  Created by Ian Keen on 1/02/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var progress: ProgressView!
    @IBOutlet private var slider: UISlider!

    @IBAction private func sliderUpdate(x: UISlider) {
        self.progress.progress = CGFloat(self.slider.value)
    }
    @IBAction private func buttonPress(x: UIButton) {
        self.progress.progress = self.progress.progress + 0.10
    }
}

