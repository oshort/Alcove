//
//  SecondViewController.swift
//  Alcove
//
//  Created by Oliver Short on 6/13/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import UIKit
import MapKit
import Firebase
import Gloss

class MapViewController: UIViewController, CLLocationManagerDelegate {

//MARK: Outlet(s)
    
    
//MARK: Location Manager
    
    let locationManager = CLLocationManager()
    let mapRegionRadius: CLLocationDistance = 200
    var studySpots = [String: StudySpot]()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
// MARK: Firebase Functions - **LOOK INTO USING GEOFIRE**
        
    func listenForStudySpotEvents() {
            // Listener for new study spots
            DataService.dataService.studySpotsRef.observeEventType(.ChildAdded) { (activeKeys: FIRDataSnapshot) in
                DataService.dataService.studySpotsRef.child(activeKeys.key).observeSingleEventOfType(.Value) { (snapshot: FIRDataSnapshot) in
                    let studySpot = StudySpot(json: snapshot.value as! JSON)
                    self.studySpots[snapshot.key] = studySpot
//                    self.mapView.addAnnotation((studySpot?.mapAnnotation)!)
            }
        }
    }

    func checkLocationAuthorization() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    


}