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
    var location: CLLocationCoordinate2D
    var annotation: Annotation?
    var wifi: Bool?
    var coffee: Bool?
    var groupSpace: Bool?
    var photos: [String]?
    
    init?(json: JSON) {
        id = "id" <~~ json
        name = "name" <~~ json
        address = "address" <~~ json
        type = "type" <~~ json
        location = CLLocationCoordinate2DMake(("latitude" <~~ json)!, ("longitude" <~~ json)!)
        annotation = Annotation(title: "MySpot", subtitle: address, coordinate: location, id: id)
        photos = "photos" <~~ json
        wifi = "wifi" <~~ json
        coffee = "coffee" <~~ json
        groupSpace = "groupSpace" <~~ json
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
