//
//  BuyBoosterButton.swift
//  Delius
//
//  Created by 박진호 on 2020/06/18.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class BuyBoosterButton:UIButton{
    
    var buyBtnGradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.allGradientColor()[0].cgColor,UIColor.allGradientColor()[1].cgColor]
        layer.startPoint = CGPoint.zero
        layer.endPoint = CGPoint(x: 1, y: 0)
        return layer
    }()
    let imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "BuyBoosterBtn")
        v.tintColor = .white
        v.contentMode = .scaleAspectFit
        return v
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
        
        self.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imgView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
