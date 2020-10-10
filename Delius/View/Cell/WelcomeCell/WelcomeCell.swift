//
//  WelcomeCell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 02/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class WelcomeCell:UICollectionViewCell {
    
    var titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        l.numberOfLines = 0
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.boldSystemFont(ofSize: 26)
        return l
    }()
    var subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 14)
        l.textColor = UIColor.MainBlackColor()
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        return l
    }()
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        return v
    }()
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupLayout(width:frame.width)
    }
    
    private func setupLayout(width:CGFloat){
        
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        subLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        
        
        addSubview(imgView)
        imgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20).isActive = true
        imgView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imgView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: width).isActive = true
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
    }
}
