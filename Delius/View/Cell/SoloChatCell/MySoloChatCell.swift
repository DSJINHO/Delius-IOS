//
//  MySoloChatCell.swift
//  Delius
//
//  Created by 박진호 on 2020/07/04.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class MySoloChatCell:UICollectionViewCell{
    
    var tpLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor3()
        l.textAlignment = .right
        l.font = UIFont.DeliusSystemType2()
        return l
    }()
    
    var backView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainColor()
        v.layer.cornerRadius = 15
        return v
    }()
    var textLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.textAlignment = .right
        l.font = UIFont.DeliusSystemType2()
        l.lineBreakMode = .byWordWrapping
        l.numberOfLines = 0
        return l
    }()
    
    var nsLeft:NSLayoutConstraint!
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        setup()
    }
    
    private func setup(){
        self.addSubview(backView)
        backView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        nsLeft = backView.leftAnchor.constraint(equalTo: backView.rightAnchor, constant: -200)
        nsLeft.isActive = true
        backView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(textLabel)
        textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7).isActive = true
        textLabel.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -15).isActive = true
        textLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7).isActive = true
        
        self.addSubview(tpLabel)
        tpLabel.rightAnchor.constraint(equalTo: backView.leftAnchor, constant: -10).isActive = true
        tpLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        tpLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tpLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor).isActive = true
       
        
    }
}
