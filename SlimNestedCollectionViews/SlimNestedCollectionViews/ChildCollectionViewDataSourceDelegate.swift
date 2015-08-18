//
//  ChildCollectionViewDataSourceDelegate.swift
//  SlimNestedCollectionViews
//
//  Created by Ian Keen on 17/08/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

import UIKit

class ChildCollectionViewDataSourceDelegate: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ChildCell", forIndexPath: indexPath) as! ChildCell
        cell.label.text = "\(indexPath.row)"
        return cell
    }
}
