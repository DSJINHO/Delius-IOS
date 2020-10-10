//
//  SetAccountView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 27/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SetAccountView:UIView{
    
    let hintLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.textAlignment = .left
        l.font = UIFont.DeliusSystemType2()
        l.text = "SettingAccountView001".localize()
        return l
    }()
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainBlackAlpha()
        return v
    }()
    var emailView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let emailLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SettingAccountView101".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType2(), txtColor: .MainBlackColor1())
        return l
    }()
    var userEmailLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor3()
        l.font = UIFont.DeliusSystemType2()
        l.textAlignment = .right
        return l
    }()
    
    var phoneView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let phoneLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SettingAccountView201".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType2(), txtColor: .MainBlackColor1())
        return l
    }()
    var userPhoneLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor3()
        l.font = UIFont.DeliusSystemType2()
        l.textAlignment = .right
        return l
    }()
    var statusView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let statusLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SettingAccountView301".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType2(), txtColor: .MainBlackColor1())
        return l
    }()
    var userStatusLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor3()
        l.font = UIFont.DeliusSystemType2()
        l.textAlignment = .right
        return l
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    private func setup(){
        let h : CGFloat = 50
        self.addSubview(hintLabel)
        hintLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        hintLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        hintLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        hintLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        self.addSubview(lineView)
        lineView.topAnchor.constraint(equalTo: hintLabel.bottomAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        lineView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.addSubview(emailView)
        emailView.topAnchor.constraint(equalTo: lineView.bottomAnchor).isActive = true
        emailView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        emailView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        emailView.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        self.addSubview(phoneView)
        phoneView.topAnchor.constraint(equalTo: emailView.bottomAnchor).isActive = true
        phoneView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        phoneView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        phoneView.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        self.addSubview(statusView)
        statusView.topAnchor.constraint(equalTo: phoneView.bottomAnchor).isActive = true
        statusView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        statusView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        statusView.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        emailView.addSubview(emailLabel)
        emailLabel.centerYAnchor.constraint(equalTo: emailView.centerYAnchor).isActive = true
        emailLabel.leftAnchor.constraint(equalTo: emailView.leftAnchor, constant: 30).isActive = true
        emailLabel.rightAnchor.constraint(equalTo: emailView.centerXAnchor).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        emailView.addSubview(userEmailLabel)
        userEmailLabel.centerYAnchor.constraint(equalTo: emailLabel.centerYAnchor).isActive = true
        userEmailLabel.rightAnchor.constraint(equalTo: emailView.rightAnchor, constant: -30).isActive = true
        userEmailLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userEmailLabel.leftAnchor.constraint(equalTo: emailView.centerXAnchor).isActive = true
        
        phoneView.addSubview(phoneLabel)
        phoneLabel.centerYAnchor.constraint(equalTo: phoneView.centerYAnchor).isActive = true
        phoneLabel.leftAnchor.constraint(equalTo: phoneView.leftAnchor, constant: 30).isActive = true
        phoneLabel.rightAnchor.constraint(equalTo: phoneView.centerXAnchor).isActive = true
        phoneLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        phoneView.addSubview(userPhoneLabel)
        userPhoneLabel.centerYAnchor.constraint(equalTo: phoneLabel.centerYAnchor).isActive = true
        userPhoneLabel.rightAnchor.constraint(equalTo: phoneView.rightAnchor, constant: -30).isActive = true
        userPhoneLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userPhoneLabel.leftAnchor.constraint(equalTo: phoneView.centerXAnchor).isActive = true
        
        statusView.addSubview(statusLabel)
        statusLabel.centerYAnchor.constraint(equalTo: statusView.centerYAnchor).isActive = true
        statusLabel.leftAnchor.constraint(equalTo: statusView.leftAnchor, constant: 30).isActive = true
        statusLabel.rightAnchor.constraint(equalTo: statusView.centerXAnchor).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        statusView.addSubview(userStatusLabel)
        userStatusLabel.centerYAnchor.constraint(equalTo: statusLabel.centerYAnchor).isActive = true
        userStatusLabel.rightAnchor.constraint(equalTo: statusView.rightAnchor, constant: -30).isActive = true
        userStatusLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userStatusLabel.leftAnchor.constraint(equalTo: statusView.centerXAnchor).isActive = true
        
        
    }

}
