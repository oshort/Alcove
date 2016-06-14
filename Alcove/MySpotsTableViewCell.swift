//
//  MySpotsTableViewCell.swift
//  Alcove
//
//  Created by Oliver Short on 6/13/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import UIKit

@IBDesignable
class MySpotsTableViewCell: UITableViewCell {

    @IBOutlet weak var spotTableCellTitleLabel: UILabel!
    @IBOutlet weak var spotTableViewImage: UIImageView!
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            if let localImageView = spotTableViewImage {
                localImageView.layer.cornerRadius = cornerRadius
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
