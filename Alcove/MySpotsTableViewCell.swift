//
//  MySpotsTableViewCell.swift
//  Alcove
//
//  Created by Oliver Short on 6/13/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import UIKit

class MySpotsTableViewCell: UITableViewCell {

//Custom TableViewCellOutlets
    
    @IBOutlet weak var spotTableViewImage: UIImageView!
    @IBOutlet weak var spotTableViewCellTitleLabel: UILabel!
    @IBOutlet weak var spotTableViewCellDistanceLabel: UILabel!
    @IBOutlet weak var spotTableViewCellTypeLabel: UILabel!
  
    
    override func awakeFromNib() {
        
// Set the corner radius for the spot image view
        super.awakeFromNib()
        self.spotTableViewImage.layer.cornerRadius = self.spotTableViewImage.frame.size.width / 2
        self.spotTableViewImage.clipsToBounds = true
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
