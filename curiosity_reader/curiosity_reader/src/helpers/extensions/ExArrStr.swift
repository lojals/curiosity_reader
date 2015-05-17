//
//  ExArrStr.swift
//  curiosity_reader
//
//  Created by Jorge Raul Ovalle Zuleta on 5/17/15.
//  Copyright (c) 2015 Olinguito. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    class func titles(type:String, subtype:String) -> NSMutableAttributedString {
        var str = "\(type) | \(subtype)"
        var strAtt = NSMutableAttributedString(string: str, attributes: [NSFontAttributeName:UIFont.fontRegular(20)])
        strAtt.addAttribute(NSFontAttributeName, value: UIFont.fontBold(20), range: NSRange(location:0,length:count(type)))
        strAtt.addAttribute(NSFontAttributeName, value: UIFont.fontRegular(20), range: NSRange(location:count(type) + 2,length:count(subtype)))
        return strAtt
    }
}