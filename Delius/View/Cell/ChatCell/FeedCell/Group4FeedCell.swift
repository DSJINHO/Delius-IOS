//
//  Group2FeedCell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/08.
//  Copyright © 2020 정윤환. All rights reserved.
//
import UIKit
class Group4FeedCell:UICollectionViewCell{
    
    var imgView1:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    var imgView2:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    var imgView3:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    var imgView4:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    
    var logoView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 15
        v.clipsToBounds = true
        return v
    }()
    var logoImgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    var titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType4()
        l.textAlignment = .center
        l.textColor = UIColor.MainBlackColor()
        return l
    }()
    var subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusSystemType2()
        l.textAlignment = .center
        l.textColor = UIColor.MainGrayColor()
        return l
    }()
    
    required init?(coder:NSCoder){
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.backgroundColor = .white
        
        
        setup(d:frame.width/4)
    }
    private func setup(d:CGFloat){
        self.addSubview(imgView1)
        imgView1.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView1.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imgView1.widthAnchor.constraint(equalToConstant: d).isActive = true
        imgView1.heightAnchor.constraint(equalToConstant: d).isActive = true
        
        self.addSubview(imgView2)
        imgView2.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView2.widthAnchor.constraint(equalToConstant: d).isActive = true
        imgView2.heightAnchor.constraint(equalToConstant: d).isActive = true
        imgView2.leftAnchor.constraint(equalTo: imgView1.rightAnchor).isActive = true
        
        self.addSubview(imgView3)
        imgView3.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView3.leftAnchor.constraint(equalTo: imgView2.rightAnchor).isActive = true
        imgView3.widthAnchor.constraint(equalToConstant: d).isActive = true
        imgView3.heightAnchor.constraint(equalToConstant: d).isActive = true
        
        self.addSubview(imgView4)
        imgView4.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView4.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imgView4.heightAnchor.constraint(equalToConstant: d).isActive = true
        imgView4.widthAnchor.constraint(equalToConstant: d).isActive = true
        
        self.addSubview(logoView)
        logoView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logoView.centerYAnchor.constraint(equalTo: imgView1.bottomAnchor).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        logoView.addSubview(logoImgView)
        logoImgView.centerXAnchor.constraint(equalTo: logoView.centerXAnchor).isActive = true
        logoImgView.centerYAnchor.constraint(equalTo: logoView.centerYAnchor).isActive = true
        logoImgView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        logoImgView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: logoView.bottomAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        self.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        subLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        subLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
    }
}

