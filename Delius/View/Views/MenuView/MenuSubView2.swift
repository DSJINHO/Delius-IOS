//
//  MenuSubView2.swift
//  Delius
//
//  Created by 정윤환 on 2020/06/10.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class MenuSubView2:UIButton{
    
    var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.allGradientColor()[0].cgColor,UIColor.allGradientColor()[1].cgColor]
        layer.startPoint = CGPoint.zero
        layer.endPoint = CGPoint(x: 1, y: 0)
        return layer
    }()
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.clipsToBounds = true
        v.tintColor = .white
        return v
    }()
    var txtLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .center
        l.text = "MenuView301".localize()
        l.baselineAdjustment = .alignBaselines
        return l
    }()
    let subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.font = UIFont.DeliusSystemType3()
        l.textAlignment = .center
        l.text = "MenuView3011".localize()
        return l
    }()
    required init?(coder:NSCoder){
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = frame.height/6
        self.clipsToBounds = true
        gradientLayer.frame = CGRect(x:0,y:0,width: frame.width,height: frame.height)
        layer.sublayers = [gradientLayer]
        imgView.image = UIImage(named: "BuyPlus")
        setup()
    }
    private func setup(){
        let textWidth = "MenuView0301".localize().StringWidth(withConstrainedHeight: 30, font: UIFont.DeliusBoldType2())
        self.addSubview(txtLabel)
        txtLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 10).isActive = true
        txtLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        txtLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        txtLabel.widthAnchor.constraint(equalToConstant: textWidth+15).isActive = true
        
        self.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: txtLabel.bottomAnchor, constant: 5).isActive = true
        subLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        self.addSubview(imgView)
        imgView.centerYAnchor.constraint(equalTo: txtLabel.centerYAnchor).isActive = true
        imgView.rightAnchor.constraint(equalTo: txtLabel.leftAnchor, constant: -5).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
}
