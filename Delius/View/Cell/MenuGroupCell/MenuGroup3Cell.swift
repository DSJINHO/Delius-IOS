//
//  MenuGroup2Cell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/04.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class MenuGroup3Cell:UICollectionViewCell{
    
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        v.layer.cornerRadius = 20
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.borderWidth = 2
        return v
    }()
    var backView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        return v
    }()
    var alphaView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.black
        v.alpha = 0.3
        return v
    }()
    var imgView2:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        v.layer.cornerRadius = 20
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.borderWidth = 2
        return v
    }()
    var imgView3:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        v.layer.cornerRadius = 20
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.borderWidth = 2
        return v
    }()
    var nameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.textAlignment = .left
        l.font = UIFont.DeliusBoldType4()
        return l
    }()
    var stateLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.textAlignment = .left
        l.font = UIFont.DeliusSystemType2()
        return l
    }()
    var memberNameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.font = UIFont.systemFont(ofSize: 13)
        l.textAlignment = .left
        return l
    }()
    var dateLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.font = UIFont.systemFont(ofSize: 13)
        l.textAlignment = .right
        return l
    }()
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.layer.cornerRadius = 10
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 4
        self.clipsToBounds = true
        setup()
    }
    private func setup(){
        self.addSubview(backView)
        backView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(alphaView)
        alphaView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        alphaView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        alphaView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        alphaView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        self.addSubview(stateLabel)
        stateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        stateLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        stateLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        stateLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        self.addSubview(memberNameLabel)
        memberNameLabel.topAnchor.constraint(equalTo: stateLabel.bottomAnchor, constant: 5).isActive = true
        memberNameLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        memberNameLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        memberNameLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        
        self.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: memberNameLabel.bottomAnchor,constant: 10).isActive = true
        imgView.leftAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: 10).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(imgView2)
        imgView2.topAnchor.constraint(equalTo: imgView.topAnchor).isActive = true
        imgView2.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: -10).isActive = true
        imgView2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imgView2.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(imgView3)
        imgView3.topAnchor.constraint(equalTo: imgView2.topAnchor).isActive = true
        imgView3.leftAnchor.constraint(equalTo: imgView2.rightAnchor,constant: -10).isActive = true
        imgView3.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imgView3.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(dateLabel)
        dateLabel.topAnchor.constraint(equalTo: imgView2.bottomAnchor).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        
        
    }
}

