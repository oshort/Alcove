//
//  AlcoveBadge.swift
//  Alcove
//
//  Created by Oliver Short on 6/17/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import UIKit

@IBDesignable class AlcoveBadge: UIView {
    
    //
    @IBInspectable var badgeColor: UIColor = UIColor.redColor(){
        didSet {
            setNeedsDisplay()
        }
    }
    // Width of the badge border
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    // Color of the bardge border
    @IBInspectable var borderColor: UIColor = UIColor.whiteColor() {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    // Badge insets that describe the margin between text and the edge of the badge.
    @IBInspectable var insets: CGSize = CGSize(width: 5, height: 2) {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
// MARK: Badge shadow
    
    // Opacity of the badge shadow
    @IBInspectable var shadowOpacityBadge: CGFloat = 0.5 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacityBadge)
            setNeedsDisplay()
        }
    }
    
    // Size of the badge shadow
    @IBInspectable var shadowRadiusBadge: CGFloat = 0.5 {
        didSet {
            layer.shadowRadius = shadowRadiusBadge
            setNeedsDisplay()
        }
    }
    
    // Color of the badge shadow
    @IBInspectable var shadowColorBadge: UIColor = UIColor.blackColor() {
        didSet {
            layer.shadowColor = shadowColorBadge.CGColor
            setNeedsDisplay()
        }
    }
    
    /// Offset of the badge shadow
    @IBInspectable var shadowOffsetBadge: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            layer.shadowOffset = shadowOffsetBadge
            setNeedsDisplay()
        }
    }
}

