//
//  DataStorage.swift
//  Alcove
//
//  Created by Oliver Short on 6/23/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import Gloss

class DataStorage: AnyObject {
    
    static var userProfile: AlcoveUser?
    static var usersSpots: [StudySpot]?
    static weak var currentUser: FIRUser?
    
    class func isUserLoggedIn() -> Bool {
        return currentUser != nil
    }
    
    class func signOut() {
        try! FIRAuth.auth()?.signOut()
        userProfile = nil
        currentUser = nil
    }
    
    class func addStudySpot(studySpot: StudySpot, completion: () -> Void) {
        var newSpot = studySpot
        let newKey = DataService.dataService.studySpotsRef.childByAutoId().key
        newSpot.id = newKey
        DataService.dataService.studySpotsRef.child(newKey).updateChildValues(newSpot.toJSON()!)
      
    }
    
}
