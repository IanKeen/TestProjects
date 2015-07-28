//
//  MapViewController.swift
//  ContainmentExample
//
//  Created by Ian Keen on 28/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

import UIKit
import MapKit

protocol MapViewControllerProtocol {
    func mapViewDidUpdate(mapView: MKMapView) -> Void
}

class MapViewController: UIViewController, MKMapViewDelegate {
    var delegate: MapViewControllerProtocol?
    
    func mapView(mapView: MKMapView!, regionDidChangeAnimated animated: Bool) {
        self.delegate?.mapViewDidUpdate(mapView)
    }
}
