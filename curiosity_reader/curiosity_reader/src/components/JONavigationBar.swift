//
//  JONavigationBar.swift
//  curiosity_reader
//
//  Created by Jorge Raul Ovalle Zuleta on 5/16/15.
//  Copyright (c) 2015 Olinguito. All rights reserved.
//

import UIKit


@objc protocol JONavigationBarDelegate{
    optional func tapBack()
}
class JONavigationBar: UIView {
    var progress:UIProgressView!
    var btnBack:UIButton!
    var delegate:JONavigationBarDelegate?
    
    var bookmarkBtn:UIButton!
    var shareBtn:UIButton!
    var favoriteBtn:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.themeGreyLight()
        progress = UIProgressView(frame: CGRectMake(0, frame.height - 2, frame.width, 2))
        progress.tintColor = UIColor.themeMain()
        progress.setProgress(5, animated: true)
        self.addSubview(progress)
        
        btnBack = UIButton(frame: CGRectMake(0, 0, 50, frame.height))
        btnBack.setImage(UIImage(named: "btnBack"), forState: UIControlState.Normal)
        btnBack.addTarget(self, action: Selector("back:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(btnBack)
        
        bookmarkBtn = UIButton(frame: CGRectMake(btnBack.frame.maxX + 15, 0, 50, frame.height))
        bookmarkBtn.setImage(UIImage(named: "btnBookmark"), forState: UIControlState.Normal)
        bookmarkBtn.addTarget(self, action: Selector("back:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(bookmarkBtn)
        
        favoriteBtn = UIButton(frame: CGRectMake( frame.width - 65, 0, 50, frame.height))
        favoriteBtn.setImage(UIImage(named: "btnFavorite"), forState: UIControlState.Normal)
        favoriteBtn.addTarget(self, action: Selector("back:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(favoriteBtn)
        
        shareBtn = UIButton(frame: CGRectMake( ((favoriteBtn.frame.midX - bookmarkBtn.frame.midX)/2)+bookmarkBtn.frame.minX, 0, 50, frame.height))
        shareBtn.setImage(UIImage(named: "btnShare"), forState: UIControlState.Normal)
        shareBtn.addTarget(self, action: Selector("back:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(shareBtn)
    }
    
    func back(selector:Selector){
        delegate?.tapBack!()
    }
    

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
