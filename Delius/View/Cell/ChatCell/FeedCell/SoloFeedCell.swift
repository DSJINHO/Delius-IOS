//
//  SoloFeedCell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/07.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SoloFeedCell:UICollectionViewCell{
    
//    private var circleGradient:CAGradientLayer={
//        let layer = CAGradientLayer()
//        if #available(iOS 12.0, *) {
//            layer.type = .conic
//        } else {
//            layer.type = .radial
//            // Fallback on earlier versions
//        }
//        layer.startPoint = CGPoint(x: 0.5, y: 0.5)
//        layer.endPoint = CGPoint(x:1,y:0.5)
//        layer.colors = [UIColor.MainColor().cgColor,UIColor.white.cgColor]
//        return layer
//    }()
    var circleView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "SoloCircle")
        v.contentMode = .scaleAspectFit
        v.clipsToBounds = true
        return v
    }()
    
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    var titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.DeliusBoldType2()
        l.textAlignment = .center
        return l
    }()
    var logoView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.clipsToBounds = true
        v.backgroundColor = .white
        v.layer.cornerRadius = 15
        return v
    }()
    var logoImg:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "NotiDeli")
        v.contentMode = .scaleAspectFit
        v.backgroundColor = .clear
        v.clipsToBounds = true
        return v
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.backgroundColor = .white
        let circleTrem:CGFloat = 18
        let term:CGFloat = 25
        let imgDiameter:CGFloat = frame.width - 2*term
        imgView.layer.cornerRadius = imgDiameter/2
        
        setup(imgDiameter:imgDiameter,term:term,width:frame.width,circleTrem:circleTrem)
    }
    private func setup(imgDiameter imgD:CGFloat,term t:CGFloat,width:CGFloat,circleTrem c:CGFloat){
        
        self.addSubview(circleView)
        circleView.topAnchor.constraint(equalTo: topAnchor, constant: c).isActive = true
        circleView.leftAnchor.constraint(equalTo: leftAnchor, constant: c).isActive = true
        circleView.rightAnchor.constraint(equalTo: rightAnchor, constant: -c).isActive = true
        circleView.heightAnchor.constraint(equalToConstant: imgD+14).isActive = true
        
        self.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: topAnchor, constant: t).isActive = true
        imgView.leftAnchor.constraint(equalTo: leftAnchor, constant: t).isActive = true
        imgView.rightAnchor.constraint(equalTo: rightAnchor, constant: -t).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: imgD).isActive = true

        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 15).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true

        self.addSubview(logoView)
        logoView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        logoView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: imgD/2.8).isActive = true
        logoView.centerYAnchor.constraint(equalTo: imgView.centerYAnchor, constant: imgD/2.8).isActive = true
        
        self.addSubview(logoImg)
        logoImg.widthAnchor.constraint(equalToConstant: 20).isActive = true
        logoImg.heightAnchor.constraint(equalToConstant: 20).isActive = true
        logoImg.centerXAnchor.constraint(equalTo: logoView.centerXAnchor).isActive = true
        logoImg.centerYAnchor.constraint(equalTo: logoView.centerYAnchor).isActive = true
    }
}
