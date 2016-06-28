//
//  MySpotsDetailViewController.swift
//  Alcove
//
//  Created by Oliver Short on 6/15/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import UIKit

class MySpotsDetailViewController: UIViewController {
    var studySpot: StudySpot?
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var spotDetailImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typeLabel.text = studySpot?.type
        distanceLabel.text = "1.0 miles away"
        addressLabel.text = studySpot?.address
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
