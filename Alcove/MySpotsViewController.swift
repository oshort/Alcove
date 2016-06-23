//
//  FirstViewController.swift
//  Alcove
//
//  Created by Oliver Short on 6/13/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import UIKit
import MapKit
import Firebase
import Gloss


class MySpotsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var ref = FIRDatabase.database().reference().child("studyspots/asdlkjf/address")
    @IBOutlet weak var spotsTableView: UITableView!
    
    var objects = [StudySpot]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            print("view loaded!")
        
        
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
            callSpotsData()
             }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        DataService.dataService.studySpotsRef.removeAllObservers()
    }

//MARK: Data Retrieval Func
    
    func callSpotsData(){
        DataService.dataService.studySpotsRef.observeEventType(FIRDataEventType.Value, withBlock: { (snapshot) in
            if let responseDict = snapshot.value as? [String:AnyObject] {
                
                var objArray = [StudySpot]()
                for item in responseDict.keys {
                    objArray.append(StudySpot(json: (responseDict[item] as! JSON) )!)
                }
                self.objects = objArray
                dispatch_async(dispatch_get_main_queue(), {
                    self.spotsTableView.reloadData()
                })
            }
        })
    }

//MARK: TableView

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mySpotsTableViewCell", forIndexPath: indexPath) as? MySpotsTableViewCell
        
        cell?.spotTableViewCellTitleLabel.text = (self.objects[indexPath.row]).name
        cell?.spotTableViewCellTypeLabel.text = (self.objects[indexPath.row]).type
        
        return cell!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "spotDetailSegue"{
            let destinationViewController = segue.destinationViewController as? MySpotsDetailViewController
            destinationViewController!.studySpot = self.objects[(self.spotsTableView.indexPathForSelectedRow! as NSIndexPath).row]
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

}

