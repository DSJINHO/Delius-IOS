//
//  PurchaseDeliCell.swift
//  Delius
//
//  Created by user on 2020/08/29.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class PurchaseLikeCell:UICollectionViewCell{
    var circleView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 40
        v.layer.shadowColor = UIColor.MainBlackColor().cgColor
        v.layer.shadowOffset = CGSize(width: 5, height: 5)
        v.layer.shadowRadius = 5
        v.layer.shadowOpacity = 0.5
        return v
    }()
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        return v
    }()
    var titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.boldSystemFont(ofSize: 21)
        l.textAlignment = .center
        return l
    }()
    var subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.gray
        l.font = UIFont.systemFont(ofSize: 14)
        l.textAlignment = .center
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        return l
    }()
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        setup()
    }
    private func setup(){
        self.addSubview(circleView)
        circleView.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        circleView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        circleView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        circleView.addSubview(imgView)
        imgView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor).isActive = true
        imgView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor,constant: -30).isActive = true
        
        self.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        subLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        subLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}


