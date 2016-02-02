//
//  ViewController.swift
//  ProgressTest
//
//  Created by Ian Keen on 1/02/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet private var progress: ProgressView!
    private var cellProgress: ProgressView?
    @IBOutlet private var slider: UISlider!

    @IBAction private func sliderUpdate(x: UISlider) {
        self.progress.progress = CGFloat(self.slider.value)
        self.cellProgress?.progress = CGFloat(self.slider.value)
    }
    @IBAction private func buttonPress(x: UIButton) {
        self.progress.progress = self.progress.progress + 0.10
        self.cellProgress?.progress = self.progress.progress + 0.10
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProgressCell", forIndexPath: indexPath)
        if let progressView = cell.contentView.viewWithTag(99) as? ProgressView {
            self.cellProgress = progressView
        }
        return cell
    }
}

