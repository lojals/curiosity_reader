//
//  ArticleComponent.swift
//  curiosity_reader
//
//  Created by Jorge Raul Ovalle Zuleta on 5/16/15.
//  Copyright (c) 2015 Olinguito. All rights reserved.
//

import UIKit

@objc protocol ArticleComponentDelegate{
    optional func tapInArticle()
}

class ArticleComponent: UIView {
    var tapGesture:UITapGestureRecognizer!
    var delegate:ArticleComponentDelegate!
    var question:UILabel!
    var data:JSON!
    
    init(frame: CGRect, data:JSON) {
        super.init(frame: frame)
        self.data = data
        
        // Test Code
        self.backgroundColor = UIColor.orangeColor()
        self.layer.borderColor = UIColor.redColor().CGColor
        self.layer.borderWidth = 1
        //
        
        tapGesture = UITapGestureRecognizer(target: self, action: Selector("goToArticle:"))
        self.addGestureRecognizer(tapGesture)
        
        question = UILabel(frame: CGRectMake(0, 0, frame.width, frame.height))
        question.font = UIFont(name: "MetaBold-Italic", size: 28)
        question.text = "¿Lorem Ipsum?"
        question.textAlignment = NSTextAlignment.Center
        question.textColor = UIColor.whiteColor()
        self.addSubview(question)
        
        
    }
    
    func goToArticle(sender:UIView){
        delegate.tapInArticle!()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
