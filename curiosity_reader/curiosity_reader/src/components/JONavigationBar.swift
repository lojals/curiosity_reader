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
    var title:UILabel!
    
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
        
        title = UILabel(frame: CGRectMake(btnBack.frame.maxX, 0, favoriteBtn.frame.minX - btnBack.frame.maxX, self.frame.height))
        title.textColor = UIColor.blackColor()
        title.textAlignment = NSTextAlignment.Right
        self.addSubview(title)
        
    }
    
    func back(selector:Selector){
        delegate?.tapBack!()
    }
    
    func setType(type:Int){
        switch(type){
            case 1: favoriteBtn.setImage(UIImage(named: "btnFavorite"), forState: UIControlState.Normal)
                    favoriteBtn.addTarget(self, action: Selector("back:"), forControlEvents: UIControlEvents.TouchUpInside)
                    title.alpha = 0
            case 2: bookmarkBtn.alpha = 0
                    bookmarkBtn.userInteractionEnabled = false
                    shareBtn.alpha = 0
                    shareBtn.userInteractionEnabled = false
                    favoriteBtn.setImage(UIImage(named: "btnFavorite"), forState: UIControlState.Normal)
                    favoriteBtn.addTarget(self, action: Selector("back:"), forControlEvents: UIControlEvents.TouchUpInside)
                    title.alpha = 1
            case 3:
                    bookmarkBtn.alpha = 0
                    bookmarkBtn.userInteractionEnabled = false
                    shareBtn.alpha = 0
                    shareBtn.userInteractionEnabled = false
                    favoriteBtn.alpha = 0
                    favoriteBtn.userInteractionEnabled = false
                    btnBack.setImage(UIImage(named: "btnMenu"), forState: UIControlState.Normal)
                    btnBack.removeTarget(self, action: Selector("back:"), forControlEvents: UIControlEvents.TouchUpInside)
                    title.alpha = 1
                    title.textAlignment = NSTextAlignment.Center
                    title.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
            default: print("Unknown")
        }
    }
    

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
