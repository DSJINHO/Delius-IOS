//
//  Tab1SubView1.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 17/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
final class Tab1SubView1:UIView{
    
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    var nameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType1()
        l.textColor = UIColor.MainBlackColor1()
        l.textAlignment = .center
        return l
    }()
    var editButton:ProfileEditButton!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        editButton = ProfileEditButton(frame: CGRect(x:0,y:0,width:frame.width,height:30))
        imgView.layer.cornerRadius = frame.width/4
        setup(width:frame.width)
    }
    private func setup(width:CGFloat){
        self.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: width/2).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: width/2).isActive = true
        
        self.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 5).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(editButton)
        editButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        editButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        editButton.rightAnchor.constraint(equalTo: rightAnchor,constant: -20).isActive = true
        editButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        nameLabel.text = "정윤환,21"
        imgView.image = UIImage(named: "model1")
        
        
        
    }
}
