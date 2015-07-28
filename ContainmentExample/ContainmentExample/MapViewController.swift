//
//  MapViewController.swift
//  ContainmentExample
//
//  Created by Ian Keen on 28/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

import UIKit
import MapKit

typealias MapViewDidUpdate = (mapView: MKMapView) -> Void

class MapViewController: UIViewController, MKMapViewDelegate {
    var mapViewDidUpdate: MapViewDidUpdate?
    
    func mapView(mapView: MKMapView!, regionDidChangeAnimated animated: Bool) {
        self.mapViewDidUpdate?(mapView: mapView)
    }
}
