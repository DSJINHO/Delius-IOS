//
//  CircleGradationView2.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 29/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class circleGradationView2:UIView{
    
    var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.welcomeGradientColor()[1].cgColor,UIColor.welcomeGradientColor()[2].cgColor]
        layer.startPoint = CGPoint(x:0,y:1)
        layer.endPoint = CGPoint(x: 1, y: 0)
        return layer
    }()
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = frame.width/2
        self.clipsToBounds = true
        setup()
        
    }
    private func setup(){
        gradientLayer.frame = frame
        self.layer.sublayers = [gradientLayer]
    }
}
