//
//  HorizontalGradationView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 02/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class WelcomeGradientView: UIView{
    
    var gradientLayer0: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.allGradientColor()[1].cgColor,UIColor.allGradientColor()[0].cgColor]
        layer.startPoint = CGPoint.zero
        layer.endPoint = CGPoint(x: 1, y: 0)
        return layer
    }()
    var gradientLayer1: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.allGradientColor()[0].cgColor,UIColor.allGradientColor()[1].cgColor]
        layer.startPoint = CGPoint.zero
        layer.endPoint = CGPoint(x: 1, y: 0)
        return layer
    }()
    var gradientLayer2: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.allGradientColor()[1].cgColor,UIColor.allGradientColor()[0].cgColor]
        layer.startPoint = CGPoint.zero
        layer.endPoint = CGPoint(x: 1, y: 0)
        return layer
    }()
    var gradientLayer3: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.allGradientColor()[0].cgColor,UIColor.allGradientColor()[1].cgColor]
        layer.startPoint = CGPoint.zero
        layer.endPoint = CGPoint(x: 1, y: 0)
        return layer
    }()
    var gradientLayer4: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.allGradientColor()[1].cgColor,UIColor.allGradientColor()[0].cgColor]
        layer.startPoint = CGPoint.zero
        layer.endPoint = CGPoint(x: 1, y: 0)
        return layer
    }()
    var gradientLayer5: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.allGradientColor()[1].cgColor,UIColor.allGradientColor()[0].cgColor]
        layer.startPoint = CGPoint.zero
        layer.endPoint = CGPoint(x: 1, y: 0)
        return layer
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup(frame: frame)
    }
    func setup(frame:CGRect){
        let w = frame.width
        gradientLayer0.frame = CGRect(x:-w,y:0,width: w,height: frame.height)
        gradientLayer1.frame = CGRect(x:0,y:0,width: w,height: frame.height)
        gradientLayer2.frame = CGRect(x:1*w,y:0,width: w,height: frame.height)
        gradientLayer3.frame = CGRect(x:2*w,y:0,width: w,height: frame.height)
        gradientLayer4.frame = CGRect(x:3*w,y:0,width: w,height: frame.height)
        gradientLayer5.frame = CGRect(x:4*w,y:0,width: w,height: frame.height)
        layer.sublayers = [gradientLayer0,gradientLayer1,gradientLayer2,gradientLayer3,gradientLayer4,gradientLayer5]
        
    }
    
}
