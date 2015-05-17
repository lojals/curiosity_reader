//
//  CategoryVC.swift
//  curiosity_reader
//
//  Created by Jorge Raul Ovalle Zuleta on 5/17/15.
//  Copyright (c) 2015 Olinguito. All rights reserved.
//

import UIKit

class CategoryVC: GenericVC {
    var questionScroll:UIScrollView!
    var questionValidated:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.setType(3)
        navBar.title.text = "Categorías"
        navBar.title.font = UIFont.fontBold(20)
        navBar.btnBack.addTarget(self, action: Selector("interactMenu"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(menuView)
    }
    
    override func viewWillAppear(animated: Bool) {
        showNavBar(true)
        showFooterBar(true)
        actView = 2
        self.menuView.setColor(actView+3330)
    }
    
    override func viewDidAppear(animated: Bool) {
        footerBar.setStep(2)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}