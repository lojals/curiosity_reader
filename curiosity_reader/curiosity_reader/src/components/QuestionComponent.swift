//
//  QuestionComponent.swift
//  curiosity_reader
//
//  Created by Jorge Raul Ovalle Zuleta on 5/17/15.
//  Copyright (c) 2015 Olinguito. All rights reserved.
//

import UIKit

@objc protocol QuestionComponentDelegate{
    optional func tapInQuestion()
}

class QuestionComponent: UIView {
    var tapGesture:UITapGestureRecognizer!
    var delegate:QuestionComponentDelegate!
    var question:UILabel!
    var arrow:UIImageView!
    var answers:UILabel!
    var data:JSON!
    
    init(frame: CGRect, data:JSON) {
        super.init(frame: frame)
        self.data = data
        
        self.layer.borderColor = UIColor.themeGreyMedium().CGColor
        self.layer.borderWidth = 0.5
        
        tapGesture = UITapGestureRecognizer(target: self, action: Selector("goToQuesiton:"))
        self.addGestureRecognizer(tapGesture)
        
        arrow = UIImageView(image: UIImage(named: "arrow"))
        arrow.center = CGPoint(x: frame.width - 30, y: frame.height/2)
        self.addSubview(arrow)
        
        var src = "¿Abrahams era  el adecuado para dirigir episodio VII?"
        question = UILabel(frame: CGRectMake(24, 15, frame.width - 81, heightForView(src, font: UIFont.fontRegular(17.5), width: frame.width - 81)))
        question.font = UIFont.fontRegular(17.5)
        question.text = src
        question.numberOfLines = 0
        question.textAlignment = NSTextAlignment.Left
        question.textColor = UIColor.blackColor()
        self.addSubview(question)
        
        var answers_logo = UIImageView(image: UIImage(named: "iconAns"))
        answers_logo.center = CGPoint(x: 30, y: frame.height-16)
        self.addSubview(answers_logo)
        
        answers = UILabel(frame: CGRectMake(answers_logo.frame.maxX + 5, 0, 100, 13))
        answers.textColor = UIColor.themeGreyDark()
        answers.font = UIFont.fontRegular(13)
        answers.center.y = answers_logo.center.y
        answers.text = "72"
        self.addSubview(answers)
    }
    
    func goToQuesiton(sender:UIView){
        delegate.tapInQuestion!()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
}
