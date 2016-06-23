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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typeLabel.text = studySpot?.type
        distanceLabel.text = "Not yet implemented"
        addressLabel.text = studySpot?.address

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
