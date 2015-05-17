//
//  HomeVC.swift
//  curiosity_reader
//
//  Created by Jorge Raul Ovalle Zuleta on 5/16/15.
//  Copyright (c) 2015 Olinguito. All rights reserved.
//

import UIKit

class HomeVC: GenericVC, UIScrollViewDelegate, ArticleComponentDelegate{
    var progressContainer:UIView!
    var progressBar:UIProgressView!
    var articleScroll:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressContainer = UIView(frame: CGRectMake(0, navBar.frame.maxY, vW, 100))
        progressContainer.backgroundColor = UIColor.whiteColor()
        self.view.insertSubview(progressContainer, belowSubview: navBar)
        
        articleScroll = UIScrollView(frame: CGRectMake(0, progressContainer.frame.maxY, vW, vH - progressContainer.frame.height))
        articleScroll.contentSize = CGSize(width: vW, height: 1000)
        self.view.addSubview(articleScroll)
        
        for(var i=0;i<4;i++){   
            var article = ArticleComponent(frame: CGRectMake(0, CGFloat(114*i)+CGFloat(10*i), vW, 114), data: nil)
            article.delegate = self
            articleScroll.addSubview(article)
        }
        
        navBar.setType(3)
        navBar.title.text = "Inicio"
        navBar.title.font = UIFont.fontBold(20)
        navBar.btnBack.addTarget(self, action: Selector("interactMenu"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(menuView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tapInArticle(){
        var articleVC = ArticleVC()
        self.navigationController?.pushViewController(articleVC, animated: true)
    }

    override func viewWillAppear(animated: Bool) {
        showNavBar(true)
        showFooterBar(false)
        actView = 0
        self.menuView.setColor(actView+3330)
    }
    

}
