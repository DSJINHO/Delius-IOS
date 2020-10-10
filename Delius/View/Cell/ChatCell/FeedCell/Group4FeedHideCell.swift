//
//  Group2FeedHideCell.swift
//  Delius
//
//  Created by user on 2020/08/18.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Group4FeedHideCell:UICollectionViewCell{
    
    var imgView1:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        return v
    }()
    var imgView2:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        return v
    }()
    var imgView3:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        return v
    }()
    var imgView4:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        return v
    }()
    
    var logoView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.borderWidth = 2
        v.layer.cornerRadius = 15
        return v
    }()
    var logoImgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.tintColor = UIColor.white
        v.image = UIImage(named: "HideLike")
        return v
    }()
    
    var nameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .center
        l.text = "다른 그룹이 라이크를 보냈습니다"
        return l
    }()
    var countLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .left
        return l
    }()
    
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        
        setup(d: frame.width/4)
    }
    private func setup(d:CGFloat){
        self.addSubview(imgView1)
        imgView1.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView1.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imgView1.widthAnchor.constraint(equalToConstant: d).isActive = true
        imgView1.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(imgView2)
        imgView2.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView2.widthAnchor.constraint(equalToConstant: d).isActive = true
        imgView2.leftAnchor.constraint(equalTo: imgView1.rightAnchor).isActive = true
        imgView2.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(imgView3)
        imgView3.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView3.widthAnchor.constraint(equalToConstant: d).isActive = true
        imgView3.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imgView3.leftAnchor.constraint(equalTo: imgView2.rightAnchor).isActive = true
        
        self.addSubview(imgView4)
        imgView4.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView4.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imgView4.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imgView4.widthAnchor.constraint(equalToConstant: d).isActive = true
        
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView1 = UIVisualEffectView(effect: blurEffect)
        blurEffectView1.translatesAutoresizingMaskIntoConstraints = false
        self.imgView1.addSubview(blurEffectView1)
        blurEffectView1.topAnchor.constraint(equalTo: imgView1.topAnchor).isActive = true
        blurEffectView1.leftAnchor.constraint(equalTo: imgView1.leftAnchor).isActive = true
        blurEffectView1.rightAnchor.constraint(equalTo: imgView1.rightAnchor).isActive = true
        blurEffectView1.bottomAnchor.constraint(equalTo: imgView1.bottomAnchor).isActive = true
        
        let blurEffectView2 = UIVisualEffectView(effect: blurEffect)
        blurEffectView2.translatesAutoresizingMaskIntoConstraints = false
        self.imgView2.addSubview(blurEffectView2)
        blurEffectView2.topAnchor.constraint(equalTo: imgView2.topAnchor).isActive = true
        blurEffectView2.leftAnchor.constraint(equalTo: imgView2.leftAnchor).isActive = true
        blurEffectView2.rightAnchor.constraint(equalTo: imgView2.rightAnchor).isActive = true
        blurEffectView2.bottomAnchor.constraint(equalTo: imgView2.bottomAnchor).isActive = true
        
        
        let blurEffectView3 = UIVisualEffectView(effect: blurEffect)
        blurEffectView3.translatesAutoresizingMaskIntoConstraints = false
        self.imgView3.addSubview(blurEffectView3)
        blurEffectView3.topAnchor.constraint(equalTo: imgView3.topAnchor).isActive = true
        blurEffectView3.leftAnchor.constraint(equalTo: imgView3.leftAnchor).isActive = true
        blurEffectView3.rightAnchor.constraint(equalTo: imgView3.rightAnchor).isActive = true
        blurEffectView3.bottomAnchor.constraint(equalTo: imgView3.bottomAnchor).isActive = true
        
        
        let blurEffectView4 = UIVisualEffectView(effect: blurEffect)
        blurEffectView4.translatesAutoresizingMaskIntoConstraints = false
        self.imgView4.addSubview(blurEffectView4)
        blurEffectView4.topAnchor.constraint(equalTo: imgView4.topAnchor).isActive = true
        blurEffectView4.bottomAnchor.constraint(equalTo: imgView4.bottomAnchor).isActive = true
        blurEffectView4.leftAnchor.constraint(equalTo: imgView4.leftAnchor).isActive = true
        blurEffectView4.rightAnchor.constraint(equalTo: imgView4.rightAnchor).isActive = true
        
        let gradationView = MainGradientView(frame: self.frame)
        gradationView.alpha = 0.4
        self.addSubview(gradationView)
        gradationView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        gradationView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        gradationView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        gradationView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        self.addSubview(logoView)
        logoView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logoView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        logoView.addSubview(logoImgView)
        logoImgView.centerXAnchor.constraint(equalTo: logoView.centerXAnchor).isActive = true
        logoImgView.centerYAnchor.constraint(equalTo: logoView.centerYAnchor).isActive = true
        logoImgView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        logoImgView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.addSubview(countLabel)
        countLabel.centerYAnchor.constraint(equalTo: logoView.centerYAnchor).isActive = true
        countLabel.leftAnchor.constraint(equalTo: logoView.rightAnchor, constant: 20).isActive = true
        countLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        countLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        
        self.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: logoView.bottomAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        
    }
    
    
}


