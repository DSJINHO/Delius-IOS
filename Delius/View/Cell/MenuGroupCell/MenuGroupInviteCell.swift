//
//  MenuGroupInviteCell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/06.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class MenuGroupInviteCell:UICollectionViewCell{
    
    
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        return v
    }()
    var titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.textAlignment = .left
        l.font = UIFont.boldSystemFont(ofSize: 22)
        l.text = String("그룹방 초대")
        return l
    }()
    var subtitleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .MainLightGrayColor()
        l.textAlignment = .center
        l.font = UIFont.DeliusSystemType2()
        l.text = String("탭하여 그룹 초대를 수락해주세요.")
        return l
    }()
    var nameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.textAlignment = .left
        l.font = UIFont.boldSystemFont(ofSize: 17)
        return l
    }()
    let shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.black
        v.alpha = 0.3
        return v
    }()
    var dateLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.textAlignment = .right
        l.font = UIFont.systemFont(ofSize: 12)
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
        setup(width:frame.width)
    }
    private func setup(width:CGFloat){
        
        self.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imgView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(shadowView)
        shadowView.topAnchor.constraint(equalTo: imgView.topAnchor).isActive = true
        shadowView.leftAnchor.constraint(equalTo: imgView.leftAnchor).isActive = true
        shadowView.rightAnchor.constraint(equalTo: imgView.rightAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: imgView.bottomAnchor).isActive = true
        
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor,constant: -20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        self.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.addSubview(dateLabel)
        dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        
        
        
        
        
    }
}
