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
        self.backgroundColor = UIColor.whiteColor()
        self.layer.borderColor = UIColor.themeGreyMedium().CGColor
        self.layer.borderWidth = 1

        tapGesture = UITapGestureRecognizer(target: self, action: Selector("goToArticle:"))
        self.addGestureRecognizer(tapGesture)
        
        question = UILabel(frame: CGRectMake(20, 5, frame.width-50, 70))
        question.font = UIFont.fontRegular(17.5)
        question.numberOfLines = 0
        question.text = "¿Cuál es el nombre del director de Star War Episodio VII: The Force Awakeness?"
        question.textAlignment = NSTextAlignment.Left
        question.textColor = UIColor.blackColor()
        self.addSubview(question)
        
        var tag = TagComponent(tag: "Ciencia ficción", icon: UIImage(named: "sfi"))
        tag.frame.origin.x = 20
        tag.frame.origin.y = question.frame.maxY + 5
        self.addSubview(tag)
    }
    
    func goToArticle(sender:UIView){
        delegate.tapInArticle!()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
