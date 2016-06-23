//
//  DataService.swift
//  Alcove
//
//  Created by Oliver Short on 6/16/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    static let dataService = DataService()
    
    private let BASE_REF = FIRDatabase.database().reference()
//    private let BASE_STORAGE_REF = FIRStorage.storage().referenceForURL("")
    private let USERS_REF = FIRDatabase.database().reference().child("users")
    private let STUDY_SPOTS_REF = FIRDatabase.database().reference().child("studyspots")
    
    var baseRef : FIRDatabaseReference {
        return BASE_REF
    }
    
    var usersRef : FIRDatabaseReference {
        return USERS_REF
    }
    var studySpotsRef : FIRDatabaseReference {
        return STUDY_SPOTS_REF
    }
}