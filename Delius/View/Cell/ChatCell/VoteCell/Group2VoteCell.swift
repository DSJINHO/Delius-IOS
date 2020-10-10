//
//  Group2VoteCell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/08.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Group2VoteCell:UICollectionViewCell{
    let imgContainer:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let backView1:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOpacity = 0.5
        v.layer.shadowOffset = CGSize(width: 2, height: 2)
        v.layer.masksToBounds = false
        return v
    }()
    let backView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOpacity = 0.5
        v.layer.shadowOffset = CGSize(width: 2, height: 2)
        v.layer.masksToBounds = false
        return v
    }()
    
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
    
    var titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.boldSystemFont(ofSize: 22)
        l.textAlignment = .left
        l.textColor = UIColor.MainBlackColor()
        return l
    }()
    var subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusSystemType2()
        l.textAlignment = .left
        l.textColor = UIColor.MainGrayColor()
        return l
    }()
    let voteLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.lightGray
        l.font = UIFont.boldSystemFont(ofSize: 14)
        l.textAlignment = .right
        l.text = "투표중"
        return l
    }()
    var countLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.lightGray
        l.font = UIFont.boldSystemFont(ofSize: 35)
        l.textAlignment = .right
        return l
    }()
    let percentLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.lightGray
        l.font = UIFont.boldSystemFont(ofSize: 14)
        l.textAlignment = .right
        l.text = "%"
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
        let diameter = ( self.frame.width - 60 ) / 4
        backView1.layer.cornerRadius = diameter/2
        backView2.layer.cornerRadius = diameter/2
        imgView1.layer.cornerRadius = diameter/2 - 4
        imgView2.layer.cornerRadius = diameter/2 - 4
        setup(d:diameter)
    }
    private func setup(d:CGFloat){
        self.addSubview(backView1)
        backView1.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        backView1.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        backView1.heightAnchor.constraint(equalToConstant: d).isActive = true
        backView1.widthAnchor.constraint(equalToConstant: d).isActive = true
        
        self.addSubview(backView2)
        backView2.topAnchor.constraint(equalTo: backView1.topAnchor).isActive = true
        backView2.leftAnchor.constraint(equalTo: backView1.rightAnchor, constant: -10).isActive = true
        backView2.heightAnchor.constraint(equalToConstant: d).isActive = true
        backView2.widthAnchor.constraint(equalToConstant: d).isActive = true
        
        backView1.addSubview(imgView1)
        imgView1.topAnchor.constraint(equalTo: backView1.topAnchor,constant: 4).isActive = true
        imgView1.leftAnchor.constraint(equalTo: backView1.leftAnchor,constant: 4).isActive = true
        imgView1.rightAnchor.constraint(equalTo: backView1.rightAnchor,constant: -4).isActive = true
        imgView1.bottomAnchor.constraint(equalTo: backView1.bottomAnchor,constant: -4).isActive = true
        
        backView2.addSubview(imgView2)
        imgView2.topAnchor.constraint(equalTo: backView2.topAnchor,constant: 4).isActive = true
        imgView2.leftAnchor.constraint(equalTo: backView2.leftAnchor,constant: 4).isActive = true
        imgView2.rightAnchor.constraint(equalTo: backView2.rightAnchor,constant: -4).isActive = true
        imgView2.bottomAnchor.constraint(equalTo: backView2.bottomAnchor,constant: -4).isActive = true
        
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: imgView1.bottomAnchor, constant: 13).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        
        self.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        subLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        self.addSubview(percentLabel)
        percentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        percentLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        percentLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        percentLabel.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        self.addSubview(countLabel)
        countLabel.bottomAnchor.constraint(equalTo: percentLabel.bottomAnchor).isActive = true
        countLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        countLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        countLabel.rightAnchor.constraint(equalTo: percentLabel.leftAnchor).isActive = true
        
        self.addSubview(voteLabel)
        voteLabel.bottomAnchor.constraint(equalTo: countLabel.bottomAnchor).isActive = true
        voteLabel.rightAnchor.constraint(equalTo: countLabel.leftAnchor, constant: -10).isActive = true
        voteLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        voteLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        
        countLabel.text = "33"
    }
}
