//
//  JOFooterBar.swift
//  curiosity_reader
//
//  Created by Jorge Raul Ovalle Zuleta on 5/17/15.
//  Copyright (c) 2015 Olinguito. All rights reserved.
//

import UIKit

class JOFooterBar: UIView {
    var progressReaded:UIProgressView!
    var progress:UIProgressView!
    var btnBack:UIButton!
    var delegate:JONavigationBarDelegate?
    
    var step1:UIButton!
    var step2:UIButton!
    var step3:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.themeGreyLight()
        
        progressReaded = UIProgressView(frame: CGRectMake(0, 0, self.frame.width, 1))
        progressReaded.progress = 0.0
        progressReaded.tintColor = UIColor.themeMain()
        progressReaded.trackTintColor = UIColor.themeGreyMedium()
        var transform = CGAffineTransformMakeScale(1.0, 3.0)
        progressReaded.transform = transform
        self.addSubview(progressReaded)
        
        step1 = UIButton(frame: CGRectMake(0, 0, 50, 50))
        step1.setImage(UIImage(named: "st1_1"), forState: UIControlState.Normal)
        step1.center = CGPointMake(frame.width/2 - 55, frame.height/2)
        self.addSubview(step1)
        
        step2 = UIButton(frame: CGRectMake(0, 0, 50, 50))
        step2.setImage(UIImage(named: "st2_1"), forState: UIControlState.Normal)
        step2.center = CGPointMake(frame.width/2, frame.height/2)
        self.addSubview(step2)
        
        step3 = UIButton(frame: CGRectMake(0, 0, 50, 50))
        step3.setImage(UIImage(named: "st3_1"), forState: UIControlState.Normal)
        step3.center = CGPointMake(frame.width/2 + 55, frame.height/2)
        self.addSubview(step3)
        
        progress = UIProgressView(frame: CGRectMake(0, 0, step3.frame.midX - step1.frame.midX, 2))
        progress.center = step2.center
        progress.tintColor = UIColor.themeMain()
        progress.trackTintColor = UIColor.themeGreyDark()
        self.insertSubview(progress, belowSubview: step1)
    }
    
    func setStep(step:Int){
        var popUp:POPSpringAnimation!
        popUp = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
        popUp.toValue = NSValue(CGSize: CGSize(width: 1.25, height: 1.25))
        switch(step){
        case 1: step1.setImage(UIImage(named: "st1_2"), forState: UIControlState.Normal)
                step1.pop_addAnimation(popUp, forKey: "Hello")
        case 2: progress.setProgress(0.5, animated: true)
                step1.setImage(UIImage(named: "st1_3"), forState: UIControlState.Normal)
                step2.setImage(UIImage(named: "st2_2"), forState: UIControlState.Normal)
                step2.pop_addAnimation(popUp, forKey: "Hello")
        case 3: step3.setImage(UIImage(named: "st3_2"), forState: UIControlState.Normal)
                step3.pop_addAnimation(popUp, forKey: "Hello")
                progress.setProgress(1, animated: true)
        default: print("error")
        }
        
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}