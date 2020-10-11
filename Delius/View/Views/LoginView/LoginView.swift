//
//  LoginView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 03/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class LoginView: UIView{
    
    var cancelBtn:UIButton={
        let b = UIButton()
        b.DeliusTeyp2(img: UIImage(named: "back")!, tint: .black)
        return b
    }()
    let titleImageView:UIView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "LoginLogo")
        return v
    }()
    
    var EmailEdt:LoginTF!
    var PasswordEdt:LoginTF!
    
    var loginBtn:LoginButton!
    var signupBtn:UIButton={
        let b = UIButton()
        b.DeliusType3(txt: "LoginView101".toLocal(), color: .MainGrayColor(), backColor: .clear)
        b.titleLabel!.font = UIFont.DeliusSystemType4()
        return b
    }()
    var findAccountBtn:UIButton={
        let b = UIButton()
        b.DeliusType3(txt: "LoginView102".toLocal(), color: .MainGrayColor(), backColor: .clear)
        b.titleLabel!.font = UIFont.DeliusSystemType4()
        return b
    }()
    var line:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = UIColor.MainGrayColor()
        l.alpha = 1
        return l
    }()
    
    private var nsL,nsO,nsG,nsI,nsN : NSLayoutConstraint!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        EmailEdt = LoginTF(placeHolder: "Email Address".localize(), frame: CGRect(x:0,y:0,width:frame.width-60,height:50))
        PasswordEdt = LoginTF(placeHolder: "Password".localize(), frame: CGRect(x:0,y:0,width:frame.width-60,height:50))
        loginBtn = LoginButton(frame: CGRect(x:0,y:0,width: frame.width-60,height:60))
        
        EmailEdt.textField.keyboardType = .emailAddress
        PasswordEdt.textField.isSecureTextEntry = true
        setup(frame: frame)
    }
    func setup(frame:CGRect){
        let width = frame.width
        
        self.addSubview(cancelBtn)
        cancelBtn.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        cancelBtn.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        cancelBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cancelBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        self.addSubview(titleImageView)
        titleImageView.topAnchor.constraint(equalTo: cancelBtn.bottomAnchor, constant: 30).isActive = true
        titleImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        titleImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        self.addSubview(EmailEdt)
        EmailEdt.topAnchor.constraint(equalTo: titleImageView.bottomAnchor,constant: 70).isActive = true
        EmailEdt.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        EmailEdt.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        EmailEdt.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.addSubview(PasswordEdt)
        PasswordEdt.topAnchor.constraint(equalTo: EmailEdt.bottomAnchor, constant: 20).isActive = true
        PasswordEdt.leftAnchor.constraint(equalTo: EmailEdt.leftAnchor).isActive = true
        PasswordEdt.rightAnchor.constraint(equalTo: EmailEdt.rightAnchor).isActive = true
        PasswordEdt.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.addSubview(loginBtn)
        loginBtn.leftAnchor.constraint(equalTo: PasswordEdt.leftAnchor).isActive = true
        loginBtn.rightAnchor.constraint(equalTo: PasswordEdt.rightAnchor).isActive = true
        loginBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginBtn.topAnchor.constraint(equalTo: PasswordEdt.bottomAnchor, constant: 40).isActive = true
        self.addSubview(signupBtn)
        signupBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        signupBtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
        signupBtn.centerXAnchor.constraint(equalTo: centerXAnchor,constant: -width/4).isActive = true
        signupBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        self.addSubview(findAccountBtn)
        findAccountBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        findAccountBtn.widthAnchor.constraint(equalToConstant: 90).isActive = true
        findAccountBtn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: width/4).isActive = true
        findAccountBtn.bottomAnchor.constraint(equalTo: signupBtn.bottomAnchor).isActive = true
        self.addSubview(line)
        line.centerYAnchor.constraint(equalTo: signupBtn.centerYAnchor).isActive = true
        line.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 20).isActive = true
        line.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    
}
