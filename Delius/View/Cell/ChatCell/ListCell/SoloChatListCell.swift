//
//  SoloChatListCell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/06.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SoloChatListCell:UICollectionViewCell{
    
    
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 5
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
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
        addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imgView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: imgView.topAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 15).isActive = true
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
        badge.centerYAnchor.constraint(equalTo: imgView.topAnchor).isActive = true
        badge.centerXAnchor.constraint(equalTo: imgView.leftAnchor).isActive = true
        badge.widthAnchor.constraint(equalToConstant: 16).isActive = true
        badge.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
    }
    
    override func prepareForReuse() {
        nameLabel.text = nil
        messageLabel.text = nil
    }
}
