//
//  NewSpotsViewController.swift
//  Alcove
//
//  Created by Oliver Short on 6/23/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import UIKit
import Gloss

class NewSpotsViewController: UIViewController {
    
    @IBOutlet weak var newSpotImage: UIImageView!
    @IBOutlet weak var newSpotNameTextField: UITextField!
    @IBOutlet weak var newSpotAddressTextField: UITextField!
    @IBOutlet weak var newSpotWifiLabel: AlcoveBadge!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { 
        }
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        let spotName = newSpotNameTextField.text
        let address = newSpotAddressTextField.text
        let newSpotRef = DataService.dataService.studySpotsRef.childByAutoId()
        // location
        // images
        if let newSpot = StudySpot(json: ["name": spotName!, "address": address!, "id": newSpotRef.key,"type": "Coffee Shop"] as JSON){
            newSpotRef.updateChildValues(newSpot.toJSON()!)
        } else{
            //make a UI Alert to tell user to fix what needs fixing
        }
        
    }
    
    
}
