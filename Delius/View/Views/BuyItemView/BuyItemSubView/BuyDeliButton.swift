//
//  BuyDeliButton.swift
//  Delius
//
//  Created by 박진호 on 2020/06/17.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class BuyDeliButton:UIButton{
    var buyBtnGradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.allGradientColor()[0].cgColor,UIColor.allGradientColor()[1].cgColor]
        layer.startPoint = CGPoint.zero
        layer.endPoint = CGPoint(x: 1, y: 0)
        return layer
    }()
    let txtLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .center
        l.textColor = .white
        l.text = "Buy".localize()
        return l
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
        buyBtnGradientLayer.frame = CGRect(x:0,y:0,width:frame.width,height:frame.height)
        self.layer.sublayers = [buyBtnGradientLayer]
        self.addSubview(txtLabel)
        txtLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        txtLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        txtLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        txtLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
