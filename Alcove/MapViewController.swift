//
//  SecondViewController.swift
//  Alcove
//
//  Created by Oliver Short on 6/13/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

//MARK: Outlet(s)
    
    
//MARK: Location Manager
    
    let locationManager = CLLocationManager()
    let mapRegionRadius: CLLocationDistance = 200
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func checkLocationAuthorization() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }

}