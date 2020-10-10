//
//  SoloFeedHideCell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/09.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SoloFeedHideCell:UICollectionViewCell{
    
    
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
        l.textColor = UIColor.white
        l.font = UIFont.DeliusBoldType2()
        l.textAlignment = .center
        l.text = "누군가의 라이크"
        return l
    }()
    var logoImg:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "HideLike")
        v.contentMode = .scaleAspectFit
        v.tintColor = UIColor.white
        v.backgroundColor = .clear
        v.clipsToBounds = true
        return v
    }()
    var countLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.font = UIFont.boldSystemFont(ofSize: 20)
        l.textAlignment = .left
        return l
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


        
        self.addSubview(logoImg)
        logoImg.centerXAnchor.constraint(equalTo: imgView.centerXAnchor).isActive = true
        logoImg.centerYAnchor.constraint(equalTo: imgView.centerYAnchor).isActive = true
        logoImg.widthAnchor.constraint(equalToConstant: 30).isActive = true
        logoImg.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(countLabel)
        countLabel.bottomAnchor.constraint(equalTo: logoImg.topAnchor).isActive = true
        countLabel.leftAnchor.constraint(equalTo: logoImg.rightAnchor).isActive = true
        countLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        countLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        self.imgView.addSubview(blurEffectView)
        blurEffectView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        blurEffectView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        blurEffectView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        blurEffectView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        let gradationView = MainGradientView(frame: self.frame)
        gradationView.alpha = 0.4
        self.addSubview(gradationView)
        gradationView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        gradationView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        gradationView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        gradationView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        self.addSubview(logoImg)
        logoImg.centerXAnchor.constraint(equalTo: imgView.centerXAnchor).isActive = true
        logoImg.centerYAnchor.constraint(equalTo: imgView.centerYAnchor).isActive = true
        logoImg.widthAnchor.constraint(equalToConstant: 30).isActive = true
        logoImg.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(countLabel)
        countLabel.bottomAnchor.constraint(equalTo: logoImg.topAnchor).isActive = true
        countLabel.leftAnchor.constraint(equalTo: logoImg.rightAnchor).isActive = true
        countLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        countLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
    }
}
