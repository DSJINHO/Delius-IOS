//
//  PartnerSoloChatCell.swift
//  Delius
//
//  Created by 박진호 on 2020/07/04.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class PartnerSoloChatCell:UICollectionViewCell{
    var profileImgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 20
        return v
    }()
    var nameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.textAlignment = .left
        l.font = UIFont.DeliusSystemType2()
        return l
    }()
    var tpLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor3()
        l.textAlignment = .left
        l.font = UIFont.DeliusSystemType2()
        return l
    }()
    
    var backView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.grayType3().withAlphaComponent(0.2)
        v.layer.cornerRadius = 15
        return v
    }()
    var textLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.textAlignment = .left
        l.font = UIFont.DeliusSystemType2()
        l.lineBreakMode = .byWordWrapping
        l.numberOfLines = 0
        return l
    }()
    
    var nsRight:NSLayoutConstraint!
    
    var nsTop1:NSLayoutConstraint?
    var nsTop2:NSLayoutConstraint?
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        setup()
    }
    private func setup(){
        self.addSubview(profileImgView)
        profileImgView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        profileImgView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileImgView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        profileImgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        self.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: topAnchor,constant: 4).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: profileImgView.rightAnchor, constant: 5).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.addSubview(backView)
        nsTop1 = backView.topAnchor.constraint(equalTo: topAnchor)
        nsTop1?.isActive = true
        nsTop2 = backView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 3)
        nsTop2?.isActive = true
        backView.leftAnchor.constraint(equalTo: profileImgView.rightAnchor,constant: 5).isActive = true
        nsRight = backView.rightAnchor.constraint(equalTo: backView.leftAnchor, constant: 200)
        nsRight.isActive = true
        backView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(textLabel)
        textLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 7).isActive = true
        textLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 15).isActive = true
        textLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -7).isActive = true
        
        self.addSubview(tpLabel)
        tpLabel.leftAnchor.constraint(equalTo: backView.rightAnchor, constant: 10).isActive = true
        tpLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tpLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        tpLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor).isActive = true
       
        
    }
}
