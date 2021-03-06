//
//  GroupGradationView.swift
//  Delius
//
//  Created by 박진호 on 2020/07/10.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class GroupGradationView:UIView{
    
    var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.groupGradientColor()[0].cgColor,UIColor.groupGradientColor()[1].cgColor]
        layer.startPoint = CGPoint.zero
        layer.endPoint = CGPoint(x: 1, y: 0)
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
