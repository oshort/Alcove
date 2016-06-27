//
//  DirectoryServices.swift
//  Alcove
//
//  Created by Oliver Short on 6/23/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//


import UIKit

class DirectoryServices: AnyObject {

// MARK: Image Directory Services for adding images to a StudySpot
    
    //Creating a file path to the documents directory locally
    class func getDocumentsDirectory() -> NSURL {
        return NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
    }
    
    class func getImagePath(fileName:String) -> String {
        return getDocumentsDirectory().URLByAppendingPathComponent(fileName).path!
    }
    
    class func getTempImagePath() -> String {
        return getDocumentsDirectory().URLByAppendingPathComponent("tempSpotImage").path!
    }
    
    class func writeImageToDirectory(image: UIImage, fileName: String) {
        let newImage = UIImagePNGRepresentation(image)
        try! newImage?.writeToFile(getImagePath(fileName), options: .DataWritingAtomic)
    }
    
    class func writeTempImageToDirectory(image: UIImage) {
        let newImage = UIImagePNGRepresentation(image)
        try! newImage?.writeToFile(getTempImagePath(), options: .DataWritingAtomic)
    }
    
    class func spotImageExists(fileName: String) -> Bool {
        return NSFileManager.defaultManager().fileExistsAtPath(getImagePath(fileName))
    }
    
    class func tempSpotImageExists() -> Bool {
        return NSFileManager.defaultManager().fileExistsAtPath(getTempImagePath())
    }
    
    class func removeImage(fileName: String) {
        try! NSFileManager.defaultManager().removeItemAtPath(getImagePath(fileName))
    }
    
    class func removeTempImage() {
        try! NSFileManager.defaultManager().removeItemAtPath(getTempImagePath())
    }
    
}
