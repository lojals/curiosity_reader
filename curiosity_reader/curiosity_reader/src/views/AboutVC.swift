//
//  AboutVC.swift
//  curiosity_reader
//
//  Created by Jorge Raul Ovalle Zuleta on 5/17/15.
//  Copyright (c) 2015 Olinguito. All rights reserved.
//

import UIKit

class AboutVC: GenericVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.setType(3)
        navBar.title.text = "Acerca de"
        navBar.title.font = UIFont.fontBold(20)
        navBar.btnBack.addTarget(self, action: Selector("interactMenu"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(menuView)
    }
    
    override func viewWillAppear(animated: Bool) {
        showNavBar(true)
        showFooterBar(true)
        actView = 3
        self.menuView.setColor(actView+3330)
    }
}
