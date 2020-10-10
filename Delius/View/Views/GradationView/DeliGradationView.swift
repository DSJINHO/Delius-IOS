//
//  HorizontalGradationView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 02/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class DeliGradationView: UIView{
    
    var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.MainColor().cgColor,UIColor.MainColor().withAlphaComponent(0.6).cgColor]
        layer.startPoint = CGPoint.zero
        layer.endPoint = CGPoint(x: 0, y: 1)
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
        gradientLayer.frame = CGRect(x:0,y:0,width:frame.width,height:frame.height)
        layer.sublayers = [gradientLayer]
        
    }
    
}

