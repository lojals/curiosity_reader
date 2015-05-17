//
//  GenericVC.swift
//  curiosity_reader
//
//  Created by Jorge Raul Ovalle Zuleta on 5/16/15.
//  Copyright (c) 2015 Olinguito. All rights reserved.
//

import UIKit

class GenericVC: UIViewController,APIManagerDelegate,JONavigationBarDelegate {
    var APIManagerClass:APIManager!
    var actView:Int!
    
    var vH:CGFloat!
    var vW:CGFloat!
    
    //Nav Bar
    var navBar:JONavigationBar!
    var footerBar:JOFooterBar!
    var lblHeader:UILabel!
    var btnLeft:UIButton!
    var btnRight:UIButton!
    
    var loaded:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        vH = self.view.frame.height
        vW = self.view.frame.width
        let barH:CGFloat = 59
        
        APIManagerClass = APIManager()
        APIManagerClass.delegate = self
        
        navBar = JONavigationBar(frame: CGRectMake(0, 0, vW, barH))
        navBar.delegate = self
        self.view.addSubview(navBar)
        
        footerBar = JOFooterBar(frame: CGRectMake(0, vH-barH, vW, barH))
        self.view.addSubview(footerBar)
            
        showNavBar(false)
        showFooterBar(false)
        loaded = false
    }
    
    
    func showNavBar(value:Bool){
        if value{
            navBar.userInteractionEnabled = true
            navBar.alpha = 1
        }else{
            navBar.userInteractionEnabled = false
            navBar.alpha = 0
        }
    }
    
    func showFooterBar(value:Bool){
        if value{
            footerBar.userInteractionEnabled = true
            footerBar.alpha = 1
        }else{
            footerBar.userInteractionEnabled = false
            footerBar.alpha = 0
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    /*func goTo(index: Int) {
        print(String(actView) + "y" + String(index))
        if actView != index {
            switch (index){
            case 0: self.navigationController?.popToRootViewControllerAnimated(true)
            case 1: var c  = AboutVC()
            self.navigationController?.pushViewController(c, animated: false)
            case 2: print(3)
            case 3: print(4)
            default: print(5)
            }
            menuView.interact()  \n
        }
    }*/
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
    func heightForViewWithAttributes(text:NSMutableAttributedString, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.attributedText = text
        label.sizeToFit()
        return label.frame.height
    }
    
    //MARK - NAVIGATION DELEGATE
    func tapBack() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
