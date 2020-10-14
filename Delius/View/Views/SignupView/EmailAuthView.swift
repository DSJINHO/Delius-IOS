//
//  EmailAuthView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 03/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//
import UIKit
final class EmailAuthView:UIView{
    var point:UILabel = {
        let l = UILabel()
        l.pointLabel()
        return l
    }()
    let emailView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let emailTitleLabel:UILabel={
        let l = UILabel()
        l.MainLabel(txt: "EmailAuthView001".toLocal(), txtAlignment: .left, fnt: UIFont.DeliusBoldType5())
        return l
    }()
    let emailTitleLabel2:UILabel={
        let l = UILabel()
        l.MainLabel(txt: "EmailAuthView002".toLocal(), txtAlignment: .left, fnt: UIFont.DeliusBoldType5())
        return l
    }()
    let emailSubLabel:UILabel={
        let l = UILabel()
        l.MainLabel(txt: "EmailAuthView003".toLocal(), txtAlignment: .left, fnt: UIFont.DeliusBoldType4())
        return l
    }()
    let emailSubLabel2:UILabel={
        let l = UILabel()
        l.MainLabel(txt: "EmailAuthView004".toLocal(), txtAlignment: .left, fnt: UIFont.DeliusBoldType4())
        return l
    }()
    
    let passwordView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let passwordTitleLabel:UILabel={
        let l = UILabel()
        l.MainLabel(txt: "PasswordAuthView001".toLocal(), txtAlignment: .left, fnt: UIFont.DeliusBoldType5())
        return l
    }()
    let passwordTitleLabel2:UILabel={
        let l = UILabel()
        l.MainLabel(txt: "PasswordAuthView002".toLocal(), txtAlignment: .left, fnt: UIFont.DeliusBoldType5())
        return l
    }()
    let passwordSubLabel:UILabel={
        let l = UILabel()
        l.MainLabel(txt: "PasswordAuthView003".toLocal(), txtAlignment: .left, fnt: UIFont.DeliusBoldType4())
        return l
    }()
    let passwordSubLabel2:UILabel={
        let l = UILabel()
        l.MainLabel(txt: "PasswordAuthView004".toLocal(), txtAlignment: .left, fnt: UIFont.DeliusBoldType4())
        return l
    }()
    var nsLeft1,nsRight1:NSLayoutConstraint!
    var emailTextField,passwordTextField:LoginTF!

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        let subRect = CGRect(x:0,y:0,width:frame.width,height:50)
        emailTextField = LoginTF(placeHolder: "", frame: subRect)
        passwordTextField = LoginTF(placeHolder: "", frame: subRect)
        setup(frame:frame)
    }
    private func setup(frame:CGRect){
        self.addSubview(emailView)
        emailView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        nsLeft1 = emailView.leftAnchor.constraint(equalTo: leftAnchor)
        nsLeft1.isActive = true
        nsRight1 = emailView.rightAnchor.constraint(equalTo: rightAnchor)
        nsRight1.isActive = true
        emailView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        self.addSubview(passwordView)
//        passwordView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
//        nsLeft1 = passwordView.leftAnchor.constraint(equalTo: leftAnchor)
//        nsLeft1.isActive = true
//        nsRight1 = passwordView.rightAnchor.constraint(equalTo: rightAnchor)
//        nsRight1.isActive = true
//        passwordView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        let title_str = "EmailAuthView001".toLocal()
        let title_height = title_str.StringHeight(withConstrainedWidth: frame.width - 60, font: UIFont.DeliusBoldType5())
        emailView.addSubview(emailTitleLabel)
        emailTitleLabel.topAnchor.constraint(equalTo: emailView.topAnchor).isActive = true
        emailTitleLabel.heightAnchor.constraint(equalToConstant: title_height).isActive = true
        emailTitleLabel.leftAnchor.constraint(equalTo: emailView.leftAnchor, constant: 40).isActive = true
        emailTitleLabel.rightAnchor.constraint(equalTo: emailView.rightAnchor, constant: -30).isActive = true
        emailView.addSubview(point)
        point.topAnchor.constraint(equalTo: emailTitleLabel.topAnchor, constant: 0 ).isActive = true
        point.rightAnchor.constraint(equalTo: emailTitleLabel.leftAnchor, constant: 15).isActive = true
        point.widthAnchor.constraint(equalToConstant: 30).isActive = true
        point.heightAnchor.constraint(equalToConstant: 5).isActive = true

        
        emailView.addSubview(emailTitleLabel2)
        emailTitleLabel2.topAnchor.constraint(equalTo: emailTitleLabel.bottomAnchor).isActive = true
        emailTitleLabel2.heightAnchor.constraint(equalToConstant: title_height).isActive = true
        emailTitleLabel2.leftAnchor.constraint(equalTo: emailView.leftAnchor, constant: 40).isActive = true
        emailTitleLabel2.rightAnchor.constraint(equalTo: emailView.rightAnchor, constant: -40).isActive = true
        let sub_str = "EmailAuthView002".toLocal()
        let sub_height = sub_str.StringHeight(withConstrainedWidth: frame.width - 60, font: UIFont.DeliusBoldType4())
        emailView.addSubview(emailSubLabel)
        emailSubLabel.topAnchor.constraint(equalTo: emailTitleLabel2.bottomAnchor).isActive = true
        emailSubLabel.heightAnchor.constraint(equalToConstant: sub_height).isActive = true
        emailSubLabel.leftAnchor.constraint(equalTo: emailView.leftAnchor, constant: 40).isActive = true
        emailSubLabel.rightAnchor.constraint(equalTo: emailView.rightAnchor, constant: -40).isActive = true
        
        emailView.addSubview(emailSubLabel2)
        emailSubLabel2.topAnchor.constraint(equalTo: emailSubLabel.bottomAnchor).isActive = true
        emailSubLabel2.heightAnchor.constraint(equalToConstant: sub_height).isActive = true
        emailSubLabel2.leftAnchor.constraint(equalTo: emailView.leftAnchor, constant: 40).isActive = true
        emailSubLabel2.rightAnchor.constraint(equalTo: emailView.rightAnchor, constant: -40).isActive = true
        
        emailView.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: emailSubLabel2.bottomAnchor, constant: 50).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: emailView.leftAnchor, constant: 40).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: emailView.rightAnchor, constant: -40).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
//
//        passwordView.addSubview(passwordTitleLabel)
//        passwordTitleLabel.topAnchor.constraint(equalTo: passwordView.topAnchor).isActive = true
//        passwordTitleLabel.heightAnchor.constraint(equalToConstant: title_height).isActive = true
//        passwordTitleLabel.leftAnchor.constraint(equalTo: passwordView.leftAnchor, constant: 40).isActive = true
//        passwordTitleLabel.rightAnchor.constraint(equalTo: passwordView.rightAnchor, constant: -40).isActive = true
//        passwordView.addSubview(point)
//        point.topAnchor.constraint(equalTo: passwordTitleLabel.topAnchor, constant: 0 ).isActive = true
//        point.rightAnchor.constraint(equalTo: passwordTitleLabel.leftAnchor, constant: 15).isActive = true
//        point.widthAnchor.constraint(equalToConstant: 30).isActive = true
//        point.heightAnchor.constraint(equalToConstant: 5).isActive = true
//
//
//        passwordView.addSubview(passwordTitleLabel2)
//        passwordTitleLabel2.topAnchor.constraint(equalTo: passwordTitleLabel.bottomAnchor).isActive = true
//        passwordTitleLabel2.heightAnchor.constraint(equalToConstant: title_height).isActive = true
//        passwordTitleLabel2.leftAnchor.constraint(equalTo: passwordView.leftAnchor, constant: 40).isActive = true
//        passwordTitleLabel2.rightAnchor.constraint(equalTo: passwordView.rightAnchor, constant: -40).isActive = true
//
//        passwordView.addSubview(passwordSubLabel)
//        passwordSubLabel.topAnchor.constraint(equalTo: passwordTitleLabel2.bottomAnchor).isActive = true
//        passwordSubLabel.heightAnchor.constraint(equalToConstant: sub_height).isActive = true
//        passwordSubLabel.leftAnchor.constraint(equalTo: passwordView.leftAnchor, constant: 40).isActive = true
//        passwordSubLabel.rightAnchor.constraint(equalTo: passwordView.rightAnchor, constant: -40).isActive = true
//
//        passwordView.addSubview(passwordSubLabel2)
//        passwordSubLabel2.topAnchor.constraint(equalTo: passwordSubLabel.bottomAnchor).isActive = true
//        passwordSubLabel2.heightAnchor.constraint(equalToConstant: sub_height).isActive = true
//        passwordSubLabel2.leftAnchor.constraint(equalTo: passwordView.leftAnchor, constant: 40).isActive = true
//        passwordSubLabel2.rightAnchor.constraint(equalTo: passwordView.rightAnchor, constant: -40).isActive = true
//
        emailView.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: emailView.leftAnchor, constant: 40).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: emailView.rightAnchor, constant: -40).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
       

        
    }
}
