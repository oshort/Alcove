//
//  Annotation.swift
//  Alcove
//
//  Created by Oliver Short on 6/15/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import UIKit
import MapKit

class Annotation: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    var id: String?
    
    init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D, id: String?) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
