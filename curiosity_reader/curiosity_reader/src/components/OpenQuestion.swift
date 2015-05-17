    //
//  OpenQuestion.swift
//  curiosity_reader
//
//  Created by Jorge Raul Ovalle Zuleta on 5/17/15.
//  Copyright (c) 2015 Olinguito. All rights reserved.
//

    
    import UIKit
    
@objc protocol OpenQuestionDelegate{
    optional func tapInArticle()
}

class OpenQuestion: UIView, UITextViewDelegate {
    var delegate:ArticleComponentDelegate!
    var tap:UITapGestureRecognizer!
    var question:UILabel!
    var data:JSON!
    var textQuestion:UITextView!
    var indication:UILabel!
    
    init(frame: CGRect, data:JSON) {
        super.init(frame: frame)
        self.data = data
        
        self.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.97)
        
        question = UILabel(frame: CGRectMake(0, 0, frame.width, frame.height))
        question.font = UIFont(name: "MetaBold-Italic", size: 28)
        question.text = "¿Lorem Ipsum?"
        question.textAlignment = NSTextAlignment.Center
        question.textColor = UIColor.whiteColor()
        self.addSubview(question)
        
        var btnClose = UIButton(frame: CGRectMake(frame.width - 50, 0, 50, 50))
        btnClose.setImage(UIImage(named: "btnClose"), forState: UIControlState.Normal)
        btnClose.addTarget(self, action: Selector("closeView:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(btnClose)
        
        var lblIntro = UILabel(frame: CGRectMake(24, 60, frame.width-48, 40))
        lblIntro.text = "Realiza una pregunta breve relacionada con la lectura anterior"
        lblIntro.font = UIFont.fontRegular(15)
        lblIntro.numberOfLines = 0
        lblIntro.textColor = UIColor.blackColor()
        self.addSubview(lblIntro)
        
        var container = UIView(frame: CGRectMake(24, lblIntro.frame.maxY + 20, frame.width-48, 100))
        container.layer.borderWidth = 1
        container.layer.cornerRadius = 2
        container.layer.borderColor = UIColor.themeMain().CGColor
        self.addSubview(container)
        
        let margin:CGFloat = 10
        textQuestion = UITextView(frame:CGRectMake(margin, margin, container.frame.width - 2*margin, 65))
        textQuestion.tintColor = UIColor.themeMain()
        textQuestion.font = UIFont.fontRegular(17.5)
        textQuestion.delegate = self
        textQuestion.backgroundColor = UIColor.clearColor()
        container.addSubview(textQuestion)
        
        indication = UILabel(frame: CGRectMake(margin, textQuestion.frame.maxY + 5 , container.frame.width - 2*margin, 13))
        indication.font = UIFont.fontRegular(13)
        indication.text = "0/80 carácteres"
        indication.textColor = UIColor.themeGreyDark()
        indication.textAlignment = NSTextAlignment.Right
        container.addSubview(indication)
        
        var btnContinue = UIButton(frame: CGRectMake(margin, container.frame.maxY + 15 , 272, 45))
        btnContinue.backgroundColor = UIColor.themeMain()
        btnContinue.layer.cornerRadius = 2
        btnContinue.center.x = self.center.x
        btnContinue.titleLabel?.font = UIFont.fontRegular(20)
        btnContinue.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btnContinue.setTitle("Preguntar", forState: UIControlState.Normal)
        btnContinue.addTarget(self, action: Selector("sendQuestion"), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(btnContinue)
        
        tap = UITapGestureRecognizer(target: self, action: Selector("hideKB"))
        self.addGestureRecognizer(tap)
        
    }
    
    func textViewDidChange(textView: UITextView) {
        indication.text = "\(count(textView.text))/80 carácteres"
    }
    
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        // Prevent crashing undo bug – see note below.
        if(range.length + range.location > count(textView.text))
        {
            return false
        }
        
        var newLength = count(textView.text) - range.length
        return newLength <= 79;
    }
    
  
    func closeView(sender:UIButton){
        self.removeFromSuperview()
    }
    
    func sendQuestion(){
        self.removeFromSuperview()
    }
    
    
    func hideKB(){
        textQuestion.resignFirstResponder()
    }
    
    
    func goToArticle(sender:UIView){
        delegate.tapInArticle!()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
