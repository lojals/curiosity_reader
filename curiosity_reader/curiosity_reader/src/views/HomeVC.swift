//
//  HomeVC.swift
//  curiosity_reader
//
//  Created by Jorge Raul Ovalle Zuleta on 5/16/15.
//  Copyright (c) 2015 Olinguito. All rights reserved.
//

import UIKit
import Charts

class HomeVC: GenericVC, UIScrollViewDelegate, ArticleComponentDelegate, ChartViewDelegate{
    var progressContainer:UIView!
    var progressBar:UIProgressView!
    var articleScroll:UIScrollView!
    var max:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressContainer = UIView(frame: CGRectMake(0, navBar.frame.maxY, vW, 150))
        progressContainer.backgroundColor = UIColor(red:0.000, green:0.506, blue:0.612, alpha: 1)
        self.view.insertSubview(progressContainer, belowSubview: navBar)
        
        var bgImg = UIImageView(image: UIImage(named: "bgGraph"))
        progressContainer.addSubview(bgImg)
        
        var data = dataWithCount(36, range: 100)
        
        //[data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:7.f]];
        
        var chart = LineChartView()
        chart.frame = CGRectMake(0, 0, progressContainer.frame.width, progressContainer.frame.height)
        
        chart.backgroundColor = UIColor.clearColor()
        chart.delegate = self
        chart.descriptionText = ""
        chart.noDataTextDescription = "You need to provide data for the chart."
        chart.data = data
        chart.animate(xAxisDuration: 2.5)
        
        chart.drawGridBackgroundEnabled = false
        chart.dragEnabled = true
        chart.setScaleEnabled(true)
        chart.pinchZoomEnabled = true
        chart.setViewPortOffsets(left: 10, top: 20, right: 10, bottom: 20)
        
        chart.legend.enabled = false
        
        chart.leftAxis.enabled = false
        chart.rightAxis.enabled = false
        chart.xAxis.enabled = false
        
        progressContainer.addSubview(chart)
        
        var lblInfo = UILabel(frame: CGRectMake(12, 12, progressContainer.frame.width - 24, 14))
        lblInfo.textColor = UIColor.whiteColor()
        lblInfo.text = "Registro de actividad del último més"
        lblInfo.font = UIFont.fontRegular(13)
        progressContainer.addSubview(lblInfo)
        
        
        articleScroll = UIScrollView(frame: CGRectMake(0, progressContainer.frame.maxY, vW, vH - progressContainer.frame.height))
        self.view.addSubview(articleScroll)
        
        for(var i=0;i<4;i++){   
            var article = ArticleComponent(frame: CGRectMake(0, CGFloat(114*i)+CGFloat(10*i), vW, 114), data: nil)
            article.delegate = self
            max = article.frame.maxY
            articleScroll.addSubview(article)
        }
        
        articleScroll.contentSize = CGSize(width: vW, height: max + 40)
        
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
    
    
    func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: ChartHighlight) {
        
    }
    
    func dataWithCount(count:Int, range:CGFloat) -> LineChartData{
        var xVals = [String]()
        for (var i = 0; i < count; i++){
            xVals.append("\(i%12)")
        }
        var yVals = [ChartDataEntry]()
        for (var i = 0; i < count; i++){
            var val = CGFloat(arc4random())*range
            yVals.append(ChartDataEntry(value: Float(val), xIndex: i))
        }
        var set1 = LineChartDataSet(yVals: yVals, label: "")
        set1.lineWidth = 1.75
        set1.circleRadius = 3
        set1.setColor(UIColor(red:0.482, green:1.000, blue:1.000, alpha: 1))
        set1.setCircleColor(UIColor(red:0.482, green:1.000, blue:1.000, alpha: 1))
        set1.highlightColor = UIColor(red:0.482, green:1.000, blue:1.000, alpha: 1)
        set1.valueTextColor = UIColor.whiteColor()
        set1.drawValuesEnabled = false
        return LineChartData(xVals: xVals, dataSet: set1)
    }
}
