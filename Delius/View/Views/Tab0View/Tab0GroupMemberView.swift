//
//  Tab0GroupMemberView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 16/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Tab0GroupMemberView:UIView{
    var profileImageView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 40
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        return v
    }()
    var nameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor1()
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .left
        return l
    }()
    var subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor3()
        l.font = UIFont.DeliusSystemType1()
        l.textAlignment = .left
        return l
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(img:UIImage,name:String,age:String,job:String,frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.image = img
        nameLabel.text = name + "," + age
        subLabel.text = job
        setup(width:frame.width)
    }
    private func setup(width:CGFloat){
        self.addSubview(profileImageView)
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImageView.rightAnchor.constraint(equalTo: leftAnchor, constant: width/3 - 10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        self.addSubview(nameLabel)
        nameLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -5).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        self.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 5).isActive = true
        subLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
}
