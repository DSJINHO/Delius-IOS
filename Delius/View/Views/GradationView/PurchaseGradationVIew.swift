//
//  HorizontalGradationView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 02/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class PurchaseGradationView: UIView{
    
    var gradientLayer: CAGradientLayer!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    init (frame:CGRect,startColor:UIColor,endColor:UIColor){
        super.init(frame:frame)
        gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor,endColor.cgColor]
        gradientLayer.startPoint =  CGPoint.zero
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        
        let w = frame.width
        gradientLayer.frame = CGRect(x:0,y:0,width:frame.width,height:frame.height)
        gradientLayer.cornerRadius = 25
        layer.sublayers = [gradientLayer]
    }
    
}




