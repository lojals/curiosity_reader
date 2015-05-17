//
//  ExFonts.swift
//  curiosity_reader
//
//  Created by Jorge Raul Ovalle Zuleta on 5/16/15.
//  Copyright (c) 2015 Olinguito. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    class func fontBold(size:CGFloat) -> UIFont {
        return UIFont(name: "MetaBold-Roman", size: size)!
    }
    
    class func fontRegular(size:CGFloat) -> UIFont {
        return UIFont(name: "MetaBookLF-Roman", size: size)!
    }
    
    class func fontRegularSerif(size:CGFloat) -> UIFont {
        return UIFont(name: "MetaSerif-Book", size: size)!
    }
}