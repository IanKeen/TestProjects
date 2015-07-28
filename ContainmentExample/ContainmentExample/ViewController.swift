//
//  ViewController.swift
//  ContainmentExample
//
//  Created by Ian Keen on 28/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    private var mapViewController: MapViewController?
    private var textViewController: TextViewController?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapViewController = self.childViewControllers.filter({ $0 is MapViewController }).first as? MapViewController
        self.textViewController = self.childViewControllers.filter({ $0 is TextViewController }).first as? TextViewController
        
        self.mapViewController?.mapViewDidUpdate = { mapView in
            self.textViewController?.updateTextField("\(mapView.centerCoordinate.latitude),\(mapView.centerCoordinate.longitude)")
        }
    }
}

