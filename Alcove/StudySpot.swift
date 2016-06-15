//
//  StudySpot.swift
//  Alcove
//
//  Created by Oliver Short on 6/15/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import Foundation
import Gloss
import CoreLocation

// Create our StudySpot Object and use Gloss to parse the JSON object passed from Firebase

struct StudySpot: Decodable, Glossy {
    var id: String?
    var address: String?
    var location: CLLocationCoordinate2D
//    var annotation = Annotation?
    var wifi: Bool?
    var coffee: Bool?
    var groupSpace: Bool?
    var photos: [String]?
    
    init?(json: JSON) {
        id = "id" <~~ json
        address = "address" <~~ json
        location = CLLocationCoordinate2DMake(("latitude" <~~ json)!, ("longitude" <~~ json)!)
        photos = "photos" <~~ json
        wifi = "wifi" <~~ json
        coffee = "coffee" <~~ json
    }
    
    func toJSON() -> JSON? {
        let latitude = location.latitude
        let longitude = location.longitude
       
        return jsonify([
            "id" ~~> id,
            "address" ~~> address,
            "laitude" ~~> latitude,
            "longitude" ~~> longitude,
            "photos" ~~> photos
            ])
    }
}
