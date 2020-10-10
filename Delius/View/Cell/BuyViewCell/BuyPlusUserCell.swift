//
//  BuyPlusUserCell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/05.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class BuyPlusUserCell:UICollectionViewCell{
    
    
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        return v
    }()
    var titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.font = UIFont.DeliusBoldType5()
        l.textAlignment = .center
        l.lineBreakMode = .byWordWrapping
        l.baselineAdjustment = .alignBaselines
        l.numberOfLines = 2
        return l
    }()
    required init?(coder:NSCoder){
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        setup(width:frame.width)
    }
    private func setup(width:CGFloat){
        let heightTerm = frame.height/15
        
        self.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: heightTerm).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        self.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: -10).isActive = true
        imgView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imgView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: width).isActive = true

    }
}
