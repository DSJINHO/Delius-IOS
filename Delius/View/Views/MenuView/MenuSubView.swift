//
//  MenuSubView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/05.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class MenuSubView:UIButton{
    
    var txtLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainGrayColor()
        l.font = UIFont.DeliusSystemType4()
        l.textAlignment = .left
        return l
    }()
    var rightArrow:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named:"RightArrow")
        v.contentMode = .scaleAspectFit
        v.tintColor = UIColor.MainGrayColor()
        return v
    }()
    required init?(coder:NSCoder){
        super.init(coder:coder)
    }
    init(txt:String,frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        txtLabel.text = txt
        setup()
    }
    private func setup(){
        
        self.addSubview(rightArrow)
        rightArrow.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        rightArrow.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        rightArrow.heightAnchor.constraint(equalToConstant: 15).isActive = true
        rightArrow.widthAnchor.constraint(equalToConstant: 15).isActive = true
        self.addSubview(txtLabel)
        txtLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        txtLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        txtLabel.rightAnchor.constraint(equalTo: rightArrow.leftAnchor, constant: -10).isActive = true
        txtLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
