//
//  ViewController.swift
//  SegueTest
//
//  Created by Ian Keen on 20/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

import UIKit

struct ContentData {
    var title: String
    var content: String
}

class ViewController: UITableViewController {
    var data: [ContentData] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (self.data.count == 0) {
            self.data = [
                ContentData(title: "Title1", content: "Content"),
                ContentData(title: "Title2", content: "Content"),
                ContentData(title: "Title3", content: "Content")
            ]
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let data = self.data[indexPath.row]
        cell.textLabel?.text = data.title
        cell.detailTextLabel?.text = data.content
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as? ViewController {
            let data = [
                ContentData(title: "New Title1", content: "New Content"),
                ContentData(title: "New Title2", content: "New Content"),
                ContentData(title: "New Title3", content: "New Content")
            ]
            vc.data = data;
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

