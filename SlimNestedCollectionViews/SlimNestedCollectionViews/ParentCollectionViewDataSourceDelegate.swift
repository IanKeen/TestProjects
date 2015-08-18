//
//  ParentCollectionViewDataSourceDelegate.swift
//  SlimNestedCollectionViews
//
//  Created by Ian Keen on 17/08/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

import UIKit

class ParentCollectionViewDataSourceDelegate: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ParentCell", forIndexPath: indexPath) as! ParentCell
        return cell
    }
}