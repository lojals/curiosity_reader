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
        
        progressContainer = UIView(frame: CGRectMake(0, 0, vW, 100))
        progressContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(progressContainer)
        
        articleScroll = UIScrollView(frame: CGRectMake(0, progressContainer.frame.height, vW, vH - progressContainer.frame.height))
        articleScroll.contentSize = CGSize(width: vW, height: 1000)
        self.view.addSubview(articleScroll)
        
        for(var i=0;i<4;i++){
            var article = ArticleComponent(frame: CGRectMake(0, CGFloat(140*i), vW, 140), data: nil)
            article.delegate = self
            articleScroll.addSubview(article)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tapInArticle(){
        var articleVC = ArticleVC()
        self.navigationController?.pushViewController(articleVC, animated: true)
    }

    
    

}
