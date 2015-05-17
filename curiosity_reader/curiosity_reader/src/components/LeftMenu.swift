//
//  LeftMenu.swift
//  Yo Intervengo
//
//  Created by Jorge Raul Ovalle Zuleta on 1/14/15.
//  Copyright (c) 2015 Olinguito. All rights reserved.
//

import Foundation
import UIKit

@objc protocol LeftMenuDelegate{
    optional func goTo(index:Int)
}

class LeftMenu: UIView{
    var opened = false
    var btnRep:UIButton!
    var btnWiki:UIButton!
    var btnStat:UIButton!
    var btnProf:UIButton!
    var btnSett:UIButton!
    var delegate:LeftMenuDelegate?
    var btnBack:UIButton!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.themeMain().colorWithAlphaComponent(0.98)
        let spacer = 10
        let size:CGFloat = frame.width - 40
        btnRep  = UIButton(frame: CGRect(x: 20, y: 76, width: size, height: 26))
        btnWiki = UIButton(frame: CGRect(x: 20, y: btnRep.frame.maxY+10, width: size, height: 26))
        btnStat = UIButton(frame: CGRect(x: 20, y: btnWiki.frame.maxY+10, width: size, height: 26))
        btnProf = UIButton(frame: CGRect(x: 20, y: btnStat.frame.maxY+10, width: size, height: 26))
        
        btnRep.setTitle("Inicio", forState: UIControlState.Normal)
        btnWiki.setTitle("Perfil", forState: UIControlState.Normal)
        btnStat.setTitle("Categorías", forState: UIControlState.Normal)
        btnProf.setTitle("Acerca de", forState: UIControlState.Normal)
        
        btnRep.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btnWiki.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btnStat.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btnProf.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        
        btnRep.titleLabel?.font  = UIFont.fontRegular(20)
        btnWiki.titleLabel?.font = UIFont.fontRegular(20)
        btnStat.titleLabel?.font = UIFont.fontRegular(20)
        btnProf.titleLabel?.font = UIFont.fontRegular(20)
        
        btnRep.contentHorizontalAlignment  = UIControlContentHorizontalAlignment.Right
        btnWiki.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        btnStat.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        btnProf.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        
        btnRep.tag  = 3330;
        btnWiki.tag = 3331;
        btnStat.tag = 3332;
        btnProf.tag = 3333;
        
        btnRep.addTarget(self,  action: "goBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        btnWiki.addTarget(self, action: "goBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        btnStat.addTarget(self, action: "goBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        btnProf.addTarget(self, action: "goBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        
        btnBack = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        btnBack.frame = CGRectMake(0, 0, 50, 50)
        btnBack.tintColor = UIColor.whiteColor()
        btnBack.setImage(UIImage(named: "btnMenu"), forState: UIControlState.Normal)
        btnBack.addTarget(self, action: "interact", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(btnBack)
        
        self.addSubview(btnRep)
        self.addSubview(btnWiki)
        self.addSubview(btnStat)
        self.addSubview(btnProf)
        
        opened = false
    }
    
    func interact(){
        var spAn = POPBasicAnimation(propertyNamed:kPOPViewCenter)
        spAn.timingFunction =  CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        if opened{
            spAn.toValue = NSValue(CGPoint: CGPointMake(-100, self.center.y))
        }
        else{
            spAn.toValue = NSValue(CGPoint: CGPointMake(100, self.center.y))
            
        }
        opened = !opened
        self.pop_addAnimation(spAn, forKey: "center")
    }
    
    func setColor(idBtn:Int){
        btnRep.titleLabel?.font  = UIFont.fontRegular(20)
        btnWiki.titleLabel?.font = UIFont.fontRegular(20)
        btnStat.titleLabel?.font = UIFont.fontRegular(20)
        btnProf.titleLabel?.font = UIFont.fontRegular(20)
        
        //sender.setTitleColor( UIColor.orangeYI() , forState: UIControlState.Normal)
        
        (self.viewWithTag(idBtn) as! UIButton).titleLabel?.font = UIFont.fontBold(21)
    }
    
    func goBtn(sender:UIButton){
        setColor(sender.tag)
        self.delegate!.goTo!(sender.tag - 3330)
    }
    
}
