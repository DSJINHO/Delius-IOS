//
//  MenuGroup2Cell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/04.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class MenuGroupCancelCell:UICollectionViewCell{
    
    var backView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        return v
    }()
    var whiteView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        return v
    }()
    
    var alphaView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.black
        v.alpha = 0.3
        return v
    }()
    var titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.textAlignment = .left
        l.font = UIFont.DeliusBoldType4()
        l.text = "그룹방 생성중 누가 거절해서 깨짐"
        return l
    }()
    var nameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.boldSystemFont(ofSize: 15)
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
        
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        self.addSubview(whiteView)
        whiteView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        whiteView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        whiteView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        whiteView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: whiteView.topAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 20).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -20).isActive = true
        
        
        
    }
}




