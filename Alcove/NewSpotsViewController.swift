//
//  NewSpotsViewController.swift
//  Alcove
//
//  Created by Oliver Short on 6/23/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import UIKit
import Gloss

class NewSpotsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let picker = UIImagePickerController()
    @IBOutlet weak var newSpotImage: UIImageView!
    @IBOutlet weak var newSpotNameTextField: UITextField!
    @IBOutlet weak var newSpotAddressTextField: UITextField!
    @IBOutlet weak var newSpotTypeField: UITextField!
    @IBOutlet weak var newSpotWifiLabel: AlcoveBadge!
    @IBOutlet weak var newSpotCoffeeLabel: AlcoveBadge!
    @IBOutlet weak var newSpotPrintingLabel: AlcoveBadge!
    @IBOutlet weak var newSpotNoiseLabel: AlcoveBadge!
    @IBOutlet weak var newSpotGroupLabel: AlcoveBadge!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NewSpotsViewController.imageTapped(_:)))
        newSpotImage.userInteractionEnabled = true
        newSpotImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
//MARK: Badge Tap Gesture Recognizers
 
    @IBAction func coffeeLabelTapped(sender: AnyObject) {
        newSpotCoffeeLabel.badgeColor = UIColor(red: 22.0/255.0, green: 73.0/255.0, blue: 152.0/255.0, alpha: 1.0)
        newSpotCoffeeLabel.textColor = UIColor.whiteColor()
    }
    
    @IBAction func printingLabelTapped(sender: AnyObject) {
        newSpotPrintingLabel.badgeColor = UIColor(red: 22.0/255.0, green: 73.0/255.0, blue: 152.0/255.0, alpha: 1.0)
        newSpotPrintingLabel.textColor = UIColor.whiteColor()
    }
    
    @IBAction func wifiLabelTapped(sender: AnyObject) {
        newSpotWifiLabel.badgeColor = UIColor(red: 22.0/255.0, green: 73.0/255.0, blue: 152.0/255.0, alpha: 1.0)
        newSpotWifiLabel.textColor = UIColor.whiteColor()
        
    }
    @IBAction func groupLabelTapped(sender: AnyObject) {
        newSpotGroupLabel.badgeColor = UIColor(red: 22.0/255.0, green: 73.0/255.0, blue: 152.0/255.0, alpha: 1.0)
        newSpotGroupLabel.textColor = UIColor.whiteColor()
    }
    
    @IBAction func quietLabelTapped(sender: AnyObject) {
        newSpotNoiseLabel.badgeColor = UIColor(red: 22.0/255.0, green: 73.0/255.0, blue: 152.0/255.0, alpha: 1.0)
        newSpotNoiseLabel.textColor = UIColor.whiteColor()
    }
    
    
    
//MARK: Image Picker Methods
    func imageTapped(img: AnyObject) {
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            picker.sourceType = .Camera
            picker.allowsEditing = true
            presentViewController(picker, animated: true, completion: nil)
        }
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        if let spotPhoto = info[UIImagePickerControllerOriginalImage] as? UIImage {
            newSpotImage.image = spotPhoto
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { 
        }
    }
    
//MARK: Saving Spot Info Methods(Name, Address, Location and Spot Image) - Firebase
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        let spotName = newSpotNameTextField.text
        let address = newSpotAddressTextField.text
        let type = newSpotTypeField.text
        let newSpotRef = DataService.dataService.studySpotsRef.childByAutoId()
        // location
        var spotDict = ["name": spotName!, "address": address!, "id": newSpotRef.key,"type": type!]
        if let spotImage = newSpotImage.image {
            let fileName = NSUUID().UUIDString
            DirectoryServices.writeImageToDirectory(spotImage, fileName: fileName)
            DataService.dataService.storageRef.child(newSpotRef.key).putFile(NSURL(fileURLWithPath: DirectoryServices.getImagePath(fileName)), metadata: .None)
            spotDict["photos"] = fileName
        }
        if let newSpot = StudySpot(json: spotDict as JSON){
            newSpotRef.updateChildValues(newSpot.toJSON()!)
        } else {
            //make a UI Alert to tell user to fix what needs fixing
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
}
