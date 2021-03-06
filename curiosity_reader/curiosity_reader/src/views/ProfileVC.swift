//
//  ProfileVC.swift
//  curiosity_reader
//
//  Created by Jorge Raul Ovalle Zuleta on 5/16/15.
//  Copyright (c) 2015 Olinguito. All rights reserved.
//

import UIKit

class ProfileVC: GenericVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.setType(3)
        navBar.title.text = "Perfil"
        navBar.title.font = UIFont.fontBold(20)
        navBar.btnBack.addTarget(self, action: Selector("interactMenu"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(menuView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        actView = 1
        self.menuView.setColor(actView+3330)
    }

}
