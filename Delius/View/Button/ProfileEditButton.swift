//
//  ProfileEditButton.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 17/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class ProfileEditButton:UIButton{
    
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "edit")
        v.tintColor = UIColor.MainBlackColor2()
        v.contentMode = .scaleAspectFit
        return v
    }()
    var textLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.font = UIFont.DeliusSystemType2()
        l.text = "ProfileEdit".localize()
        l.textAlignment = .center
        return l
    }()
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.layer.cornerRadius = 3
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.MainBlackColor2().cgColor
        self.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = frame.width/4
        setup()
    }
    private func setup(){
        self.addSubview(imgView)
        imgView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imgView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.addSubview(textLabel)
        textLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        textLabel.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 10).isActive = true
    }
}
