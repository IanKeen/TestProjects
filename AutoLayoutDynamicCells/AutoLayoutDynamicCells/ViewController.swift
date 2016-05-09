//
//  ViewController.swift
//  AutoLayoutDynamicCells
//
//  Created by Ian Keen on 9/05/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //MARK: - IBOutlets
    @IBOutlet private var tableView: UITableView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: String(TableViewCell), bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: String(TableViewCell))
        self.tableView.estimatedRowHeight = 30
    }
    
    //MARK: - Table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(TableViewCell), forIndexPath: indexPath) as! TableViewCell
        cell.label.text = randomText()
        return cell
    }
    
    //MARK: - Helpers
    private func randomText() -> String {
        return [
            "test string",
            "Sed sit amet sapien justo. Duis ultricies eros sed maximus efficitur. Praesent interdum quis felis eget pulvinar. Nunc auctor ullamcorper lorem sit amet fermentum.",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
            ].randomElement()
    }
}

