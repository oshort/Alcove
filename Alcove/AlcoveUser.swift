//
//  AlcoveUser.swift
//  Alcove
//
//  Created by Oliver Short on 6/15/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import Foundation
import Gloss
import CoreLocation

struct AlcoveUser: Decodable, Glossy {
    var id: String?
    var name: String?
    var location: CLLocationCoordinate2D
//    var userSpots: [String: Bool]?
    
    init?(json: JSON) {
        id = "id" <~~ json
        name = "name" <~~ json
        location = CLLocationCoordinate2DMake(("latitude" <~~ json)!, ("longitude" <~~ json)!)
//        userSpots = "userSpots" <~~ json
    }
    
    func toJSON() -> JSON? {
        let latitude = location.latitude
        let longitude = location.longitude
        
        return jsonify([
            "id" ~~> id,
            "name" ~~> name,
            "latitude" ~~> latitude,
            "longitude" ~~> longitude,
//            "userSpots" ~~> userSpots
            ])
    }
}
