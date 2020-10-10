//
//  Tab1SubView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 17/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Tab1SubView2:UIButton{
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        return v
    }()
    var label:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor1()
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .left
        return l
    }()
    var countLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor1()
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .right
        return l
    }()
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        
    }
    init(imgName:String,labelText:String,Color:UIColor,frame: CGRect) {
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named: imgName)
        label.text = labelText
        imgView.tintColor = Color
        setup()
    }
    private func setup(){
        self.addSubview(imgView)
        imgView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imgView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        self.addSubview(countLabel)
        countLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        countLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        countLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        countLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.addSubview(label)
        label.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 10).isActive = true
        label.rightAnchor.constraint(equalTo: countLabel.leftAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
}
