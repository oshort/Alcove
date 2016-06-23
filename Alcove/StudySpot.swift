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
    var name: String?
    var address: String?
    var type: String?
    var location: CLLocationCoordinate2D?
    var wifi: Bool?
    var coffee: Bool?
    var groupSpace: Bool?
    var printing: Bool?
    var photos: String?
    
    init?(json: JSON) {
        id = "id" <~~ json
        name = "name" <~~ json
        address = "address" <~~ json
        type = "type" <~~ json
        if let lat : Double = "latitude" <~~ json, let long : Double = "longitude" <~~ json {
            location = CLLocationCoordinate2DMake(lat, long)
        } else {
            location = nil
        }
        
        photos = "photos" <~~ json
        wifi = "wifi" <~~ json
        coffee = "coffee" <~~ json
        groupSpace = "groupSpace" <~~ json
        printing = "printing" <~~ json
    }
    
    func toJSON() -> JSON? {
        let latitude = location?.latitude
        let longitude = location?.longitude
       
        return jsonify([
            "id" ~~> id,
            "name" ~~> name,
            "address" ~~> address,
            "latitude" ~~> latitude,
            "type" ~~> type,
            "longitude" ~~> longitude,
            "wifi" ~~> wifi,
            "coffee" ~~> coffee,
            "groupSpace" ~~> groupSpace,
            "printing" ~~> printing,
            "photos" ~~> photos
            ])
    }
}
