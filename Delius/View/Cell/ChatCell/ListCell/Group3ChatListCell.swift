//
//  Group3ChatListCell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/06.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Group3ChatListCell:UICollectionViewCell{
    
    var pictureView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 5
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        return v
    }()
    var imgView2:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 5
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        return v
    }()
    var imgView3:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 5
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        return v
    }()
    var backView1:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 5
        return v
    }()
    var backView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 5
        return v
    }()
    var backView3:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 5
        return v
    }()
    
    var nameLabel:UILabel={
        let l = UILabel()
        l.backgroundColor = UIColor.clear
        l.textColor = UIColor.black
        l.textAlignment = .left
        l.font = UIFont.boldSystemFont(ofSize: 17)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    var messageLabel:UILabel={
        let l = UILabel()
        l.backgroundColor = UIColor.clear
        l.textColor = UIColor.gray
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 13)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    var dateLabel:UILabel={
        let l = UILabel()
        l.textColor = UIColor.lightGray
        l.textAlignment = .right
        l.font = UIFont.systemFont(ofSize: 12)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    var badge:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.red
        v.layer.cornerRadius = 8
        v.isHidden = true
        return v
    }()
    
    required init?(coder:NSCoder){
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        setup()
    }
    private func setup(){
        
        let wd :CGFloat = 30
        addSubview(pictureView)
        pictureView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        pictureView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        pictureView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        pictureView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        pictureView.addSubview(backView2)
        backView2.bottomAnchor.constraint(equalTo: pictureView.bottomAnchor, constant: 2).isActive = true
        backView2.rightAnchor.constraint(equalTo: pictureView.rightAnchor, constant: 2).isActive = true
        backView2.heightAnchor.constraint(equalToConstant: wd).isActive = true
        backView2.widthAnchor.constraint(equalToConstant: wd).isActive = true
        pictureView.addSubview(backView3)
        backView3.bottomAnchor.constraint(equalTo: pictureView.bottomAnchor, constant: 2).isActive = true
        backView3.leftAnchor.constraint(equalTo: pictureView.leftAnchor, constant: -2).isActive = true
        backView3.heightAnchor.constraint(equalToConstant: wd).isActive = true
        backView3.widthAnchor.constraint(equalToConstant: wd).isActive = true
        pictureView.addSubview(backView1)
        backView1.topAnchor.constraint(equalTo: pictureView.topAnchor, constant: -2).isActive = true
        backView1.centerXAnchor.constraint(equalTo: pictureView.centerXAnchor).isActive = true
        backView1.widthAnchor.constraint(equalToConstant: wd).isActive = true
        backView1.heightAnchor.constraint(equalToConstant: wd).isActive = true
        backView1.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: backView1.topAnchor,constant:2).isActive = true
        imgView.leftAnchor.constraint(equalTo: backView1.leftAnchor,constant:2).isActive = true
        imgView.rightAnchor.constraint(equalTo: backView1.rightAnchor,constant:-2).isActive = true
        imgView.bottomAnchor.constraint(equalTo: backView1.bottomAnchor,constant:-2).isActive = true
        backView2.addSubview(imgView2)
        imgView2.topAnchor.constraint(equalTo: backView2.topAnchor,constant:2).isActive = true
        imgView2.leftAnchor.constraint(equalTo: backView2.leftAnchor,constant:2).isActive = true
        imgView2.rightAnchor.constraint(equalTo: backView2.rightAnchor,constant:-2).isActive = true
        imgView2.bottomAnchor.constraint(equalTo: backView2.bottomAnchor,constant:-2).isActive = true
        backView3.addSubview(imgView3)
        imgView3.topAnchor.constraint(equalTo: backView3.topAnchor,constant:2).isActive = true
        imgView3.leftAnchor.constraint(equalTo: backView3.leftAnchor,constant:2).isActive = true
        imgView3.rightAnchor.constraint(equalTo: backView3.rightAnchor,constant:-2).isActive = true
        imgView3.bottomAnchor.constraint(equalTo: backView3.bottomAnchor,constant:-2).isActive = true
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 95).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addSubview(messageLabel)
        messageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        messageLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addSubview(dateLabel)
        dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.addSubview(badge)
        badge.topAnchor.constraint(equalTo: topAnchor).isActive = true
        badge.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        badge.widthAnchor.constraint(equalToConstant: 16).isActive = true
        badge.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
}
