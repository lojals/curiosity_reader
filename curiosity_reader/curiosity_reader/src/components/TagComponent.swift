//
//  TagComponent.swift
//  curiosity_reader
//
//  Created by Jorge Raul Ovalle Zuleta on 5/17/15.
//  Copyright (c) 2015 Olinguito. All rights reserved.
//


import Foundation
import UIKit

class TagComponent: UIView{
    var icon:UIImageView!
    var label:UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(tag:String!, icon:UIImage!) {
        super.init(frame:CGRectZero)
        self.icon = UIImageView(image: icon)
        self.frame = CGRectMake(0, 0, CGFloat(50+(count(tag)*5)), 26)
        self.backgroundColor = UIColor.themeGreyDark()
        self.layer.cornerRadius = frame.height/2
        self.icon.center = CGPoint(x: 20, y: 13)
        self.addSubview(self.icon)
        
        label = UILabel(frame: CGRectMake(self.icon.frame.maxX + 10, 0, CGFloat(count(tag)*5), 26))
        label.textColor = UIColor.whiteColor()
        label.text = tag
        label.font = UIFont.fontRegular(12)
        self.addSubview(self.label)
    }
}
