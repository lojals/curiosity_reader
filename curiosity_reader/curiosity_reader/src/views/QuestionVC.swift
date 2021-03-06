//
//  QuestionVC.swift
//  curiosity_reader
//
//  Created by Jorge Raul Ovalle Zuleta on 5/17/15.
//  Copyright (c) 2015 Olinguito. All rights reserved.
//

import UIKit

class QuestionVC: GenericVC,QuestionComponentDelegate {
    var questionScroll:UIScrollView!
    var questionValidated:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.setType(2)
        navBar.favoriteBtn.setImage(UIImage(named: "btnAddAns"), forState: UIControlState.Normal)
        navBar.title.attributedText = NSMutableAttributedString.titles("Preguntas",subtype: "Añadir")
        
        questionScroll = UIScrollView(frame: self.view.frame)
        questionScroll.contentSize = CGSize(width: vW, height: 1000)
        questionScroll.contentInset = UIEdgeInsets(top: navBar.frame.height, left: 0, bottom: navBar.frame.height, right: 0)
        questionScroll.contentOffset = CGPointMake(0,0)
        self.view.insertSubview(questionScroll, belowSubview: navBar)
        
        
        for(var i=0;i<4;i++){
            var question = QuestionComponent(frame: CGRectMake(0, CGFloat(105*i), vW, 105), data: nil)
            question.delegate = self
            questionScroll.addSubview(question)
        }
        questionValidated = false
        
        
    }
    
    func tapInQuestion(){
        if questionValidated == false {
            var q = OpenQuestion(frame: self.view.frame, data: nil)
            self.view.addSubview(q)
            questionValidated = true
        }else{
            var answerVC = AnswerVC()
            self.navigationController?.pushViewController(answerVC, animated: true)
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        showNavBar(true)
        showFooterBar(true)
    }
    
    override func viewDidAppear(animated: Bool) {
        footerBar.setStep(2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
