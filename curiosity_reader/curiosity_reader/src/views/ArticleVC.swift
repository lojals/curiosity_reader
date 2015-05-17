//
//  ArticleVC.swift
//  curiosity_reader
//
//  Created by Jorge Raul Ovalle Zuleta on 5/16/15.
//  Copyright (c) 2015 Olinguito. All rights reserved.
//

import UIKit

class ArticleVC: GenericVC,UIScrollViewDelegate {
    var lblTitle:UILabel!
    var lblAuthor:UILabel!
    var txtArticle:UITextView!
    var srcView:UIScrollView!
    let margin:CGFloat = 24
    
    var popUp:POPSpringAnimation!
    var popDown:POPSpringAnimation!
    
    var popUp2:POPSpringAnimation!
    var popDown2:POPSpringAnimation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        srcView = UIScrollView(frame: self.view.frame)
        srcView.delegate = self
        self.view.insertSubview(srcView, belowSubview: navBar)
        
        var widthScroll = (vW - (2 * margin))
        
        var str = "Estos eran los planes de George Lucas para los nuevos films de Star Wars"
        lblTitle = UILabel(frame: CGRectMake(margin, margin + navBar.frame.height , widthScroll, heightForView(str, font: UIFont.fontBold(30), width: widthScroll)))
        lblTitle.font = UIFont.fontBold(30)
        lblTitle.numberOfLines = 0
        lblTitle.text = str
        lblTitle.textColor = UIColor.blackColor()
        srcView.addSubview(lblTitle)
        
        var strAtt = NSMutableAttributedString(string: "Por GIZMODO", attributes: [NSFontAttributeName:UIFont.fontRegular(13)])
        strAtt.addAttribute(NSForegroundColorAttributeName, value: UIColor.blackColor(), range: NSRange(location:0,length:3))
        strAtt.addAttribute(NSForegroundColorAttributeName, value: UIColor.themeMain(), range: NSRange(location:4,length:(strAtt.length-4)))
        
        lblAuthor = UILabel(frame: CGRectMake(margin, lblTitle.frame.maxY + 17.5, widthScroll, 14))
        lblAuthor.attributedText = strAtt
        srcView.addSubview(lblAuthor)
        
        str = "Si George Lucas no hubiese vendido Lucasfilm y todo lo relacionado a su obra maestra, Star Wars, la historia habría sido bastante distinta. Para Lucas, la nueva trilogía iba a estar dirigida a los adolescentes, pero Disney al final decidió olvidarse de esas ideas. \r\nNo es ningún secreto que los episodios I, II y III de la saga de Star Wars no son los más queridos por los fanáticos de antaño de la saga. Estas películas están llenas de personajes molestos y un humor bastante infantil, por lo que incluso muchos se quieren olvidar de que existieron. De hecho, uno de ellos pareciera ser J.J. Abrams, el director de Episode VII: The Force Awakens, la nueva entrega de la saga.\r\nY esto es una gran noticia. Gracias a ello hemos visto, con mucha emoción, como The Force Awakens promete ser una obra digna de la saga, de continuar la historia de los Skywalker e introducir nuevos héroes y villanos en el universo originalmente creado por Lucas. Se vienen 6 nuevas películas (una nueva trilogía y tres spin-off), pero todo podría haber sido muy distinto si el responsable de su creación hubiese sido George Lucas.\r\nSegún un artículo en Vanity Fair, Lucas siempre quiso hacer la nueva trilogía, y en ella iba a incluir también a personajes viejos (Han Solo, Luke Skywalker, etc) y nuevos, cosa que Abrams está haciendo en el Episodio VII. La gran diferencia es que la versión de Lucas iba a estar protagonizada por adolescentes y dirigida a un público infantil o juvenil. Que Dios nos proteja."
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 33.0
        paragraphStyle.maximumLineHeight = 33.0
        paragraphStyle.minimumLineHeight = 33.0
        
        
        strAtt = NSMutableAttributedString(string: str, attributes: [NSFontAttributeName:UIFont.fontRegularSerif(19)])
        strAtt.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location:0,length:(strAtt.length)))
        
        txtArticle = UITextView(frame: CGRectMake(margin, lblAuthor.frame.maxY + 25, widthScroll, heightForViewWithAttributes(strAtt, width: widthScroll)))
        txtArticle.attributedText = strAtt
        txtArticle.editable = false
        txtArticle.scrollEnabled = false
        txtArticle.textColor = UIColor.blackColor()
        srcView.addSubview(txtArticle)
        
        str = "Finalizaste la primera etapa de tu reto diario, ahora debes crear y contestar preguntas para interactuar con otros usuarios"

        var div = UIImageView(image: UIImage(named:"div"))
        div.center = CGPoint(x: srcView.center.x, y: txtArticle.frame.maxY + 23)
        srcView.addSubview(div)
        
        var advise = UILabel(frame: CGRect(x: margin, y: div.frame.maxY + 33 , width: widthScroll, height: heightForView(str, font: UIFont.fontRegular(14), width: widthScroll)))
        advise.text = str
        advise.font = UIFont.fontRegular(14)
        advise.numberOfLines = 0
        advise.textColor = UIColor.themeGreyDark()
        srcView.addSubview(advise)
        
        var btnContinue = UIButton(frame: CGRectMake(margin, advise.frame.maxY + 15 , widthScroll, 45))
        btnContinue.backgroundColor = UIColor.themeMain()
        btnContinue.layer.cornerRadius = 2
        btnContinue.titleLabel?.font = UIFont.fontRegular(20)
        btnContinue.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btnContinue.setTitle("Continuar con preguntas", forState: UIControlState.Normal)
        srcView.addSubview(btnContinue)
        
        
        srcView.contentSize = CGSize(width: vW, height: btnContinue.frame.maxY + footerBar.frame.height + 30)
        
        popUp = POPSpringAnimation(propertyNamed: kPOPViewCenter)
        popUp.fromValue = NSValue(CGPoint: CGPoint(x: self.view.center.x, y: navBar.frame.height/2))
        popUp.toValue = NSValue(CGPoint: CGPoint(x: self.view.center.x, y: -navBar.frame.height/2))
        
        popDown = POPSpringAnimation(propertyNamed: kPOPViewCenter)
        popDown.fromValue = NSValue(CGPoint: CGPoint(x: self.view.center.x, y: -navBar.frame.height/2))
        popDown.toValue = NSValue(CGPoint: CGPoint(x: self.view.center.x, y: navBar.frame.height/2))
        
        popUp2 = POPSpringAnimation(propertyNamed: kPOPViewCenter)
        popUp2.fromValue = NSValue(CGPoint: CGPoint(x: self.view.center.x, y: vH - navBar.frame.height/2))
        popUp2.toValue = NSValue(CGPoint: CGPoint(x: self.view.center.x, y: vH + navBar.frame.height/2))
        
        popDown2 = POPSpringAnimation(propertyNamed: kPOPViewCenter)
        popDown2.fromValue = NSValue(CGPoint: CGPoint(x: self.view.center.x, y: vH + navBar.frame.height/2))
        popDown2.toValue = NSValue(CGPoint: CGPoint(x: self.view.center.x, y: vH - navBar.frame.height/2))
    }
    
    override func viewDidAppear(animated: Bool) {
        footerBar.setStep()
    }
    
    override func viewWillAppear(animated: Bool) {
        showNavBar(true)
        showFooterBar(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if(scrollView == srcView)
        {
            var percentScrolled = abs(ceil((scrollView.contentOffset.y/scrollView.contentSize.height)*100))
            println(percentScrolled)
            if(percentScrolled > 100){
                percentScrolled = 0;
            }
            if(percentScrolled > 90)
            {
                print("Mayor al 90%")
                navBar.pop_addAnimation(popUp, forKey: "UP")
                footerBar.pop_addAnimation(popUp2, forKey: "UP")
            }
        }
        
        var translation:CGPoint = scrollView.panGestureRecognizer.translationInView(scrollView.superview!)
        if(translation.y > 0)
        {
            if navBar.center.y != navBar.frame.height/2{
                navBar.pop_addAnimation(popDown, forKey: "DOWN")
                footerBar.pop_addAnimation(popDown2, forKey: "DOWN")
            }
        } else
        {
            if navBar.center.y != -navBar.frame.height/2{
                navBar.pop_addAnimation(popUp, forKey: "UP")
                footerBar.pop_addAnimation(popUp2, forKey: "UP")
            }
        }
    }

}
