//
//  CrossGradationView.swift
//  Delius
//
//  Created by 정윤환 on 2020/06/10.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class CrossGradationView: UIView{
    
    var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.allGradientColor()[0].cgColor,UIColor.allGradientColor()[1].cgColor]
        layer.startPoint = CGPoint.zero
        layer.endPoint = CGPoint(x: 0.5, y: 1)
        return layer
    }()
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup(frame:frame)
    }
    private func setup(frame:CGRect){
        gradientLayer.frame = CGRect(x:0,y:0,width:frame.width,height:frame.height)
        self.layer.sublayers = [gradientLayer]
    }
    
}
