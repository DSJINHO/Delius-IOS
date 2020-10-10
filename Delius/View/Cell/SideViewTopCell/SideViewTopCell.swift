//
//  SideViewTopCell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/03.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SideViewTopCell:UICollectionViewCell{
    override var isSelected: Bool{
        didSet{
            switch isSelected{
            case true:nameLabel.textColor = UIColor.black
            case false:nameLabel.textColor = UIColor.MainLightGrayColor()
            }
        }
    }
    
    var nameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainLightGrayColor()
        l.textAlignment = .left
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
        self.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
