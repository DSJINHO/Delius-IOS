//
//  FindAccountView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 25/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
final class FindAccountView:UIView{
    let titleView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.gradientColor()[2]
        return v
    }()
    let titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType1()
        l.textColor = UIColor.white
        l.textAlignment = .center
        l.text = "FindAccountView001".localize()
        return l
    }()
    let emailLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType1()
        l.textColor = UIColor.white
        l.textAlignment = .center
        l.text = "FindAccountView002".localize()
        l.alpha = 0
        return l
    }()
    let pwLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType1()
        l.textColor = UIColor.white
        l.textAlignment = .center
        l.text = "FindAccountView003".localize()
        l.alpha = 0
        return l
    }()
    var cancelBtn:IconButton1!
    var backBtn:IconButton1!
    
    var findEmailView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let findEmailLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType2()
        l.textAlignment = .left
        l.textColor = UIColor.black
        l.text = "FindAccountView002".localize()
        return l
    }()
    let rightArrow1:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.tintColor = UIColor.black
        v.image = UIImage(named: "RightArrow")
        return v
    }()
    var findPWView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let findPWLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType2()
        l.textAlignment = .left
        l.textColor = UIColor.black
        l.text = "FindAccountView003".localize()
        return l
    }()
    let rightArrow2:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.black
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "RightArrow")
        return v
    }()
    
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainAlphaView()
        return v
    }()
    
    
    
    var nsTitle,nsEmail,nsPW:NSLayoutConstraint!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        cancelBtn = IconButton1(imgName: "c", color: .white, frame: CGRect(x:0,y:0,width:30,height:30))
        backBtn = IconButton1(imgName: "LeftArrow", color: .white, frame: CGRect(x:0,y:0,width:30,height:30))
        backBtn.alpha = 0
        setup()
    }
    private func setup(){
        
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        
        self.addSubview(titleView)
        titleView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: topPadding + 60).isActive = true
        
        titleView.addSubview(titleLabel)
        titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor, constant: -15).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nsTitle = titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor,constant:0)
        nsTitle.isActive = true
        
        titleView.addSubview(emailLabel)
        emailLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        emailLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nsEmail = emailLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor, constant: 120)
        nsEmail.isActive = true
        
        titleView.addSubview(pwLabel)
        pwLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        pwLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        pwLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nsPW = pwLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor,constant: 120)
        nsPW.isActive = true
        titleView.addSubview(cancelBtn)
        cancelBtn.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        cancelBtn.rightAnchor.constraint(equalTo: titleView.rightAnchor, constant: -20).isActive = true
        cancelBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cancelBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        titleView.addSubview(backBtn)
        backBtn.leftAnchor.constraint(equalTo: titleView.leftAnchor, constant: 20).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backBtn.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        
        self.addSubview(findEmailView)
        findEmailView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 40).isActive = true
        findEmailView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        findEmailView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        findEmailView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        findEmailView.addSubview(rightArrow1)
        rightArrow1.rightAnchor.constraint(equalTo: findEmailView.rightAnchor, constant: -20).isActive = true
        rightArrow1.widthAnchor.constraint(equalToConstant: 20).isActive = true
        rightArrow1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        rightArrow1.centerYAnchor.constraint(equalTo: findEmailView.centerYAnchor).isActive = true
        
        findEmailView.addSubview(findEmailLabel)
        findEmailLabel.centerYAnchor.constraint(equalTo: findEmailView.centerYAnchor).isActive = true
        findEmailLabel.leftAnchor.constraint(equalTo: findEmailView.leftAnchor, constant: 30).isActive = true
        findEmailLabel.rightAnchor.constraint(equalTo: rightArrow1.leftAnchor, constant: -20).isActive = true
        findEmailLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(lineView)
        lineView.topAnchor.constraint(equalTo: findEmailView.bottomAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        lineView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.addSubview(findPWView)
        findPWView.topAnchor.constraint(equalTo: lineView.bottomAnchor).isActive = true
        findPWView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        findPWView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        findPWView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        findPWView.addSubview(rightArrow2)
        rightArrow2.centerYAnchor.constraint(equalTo: findPWView.centerYAnchor).isActive = true
        rightArrow2.rightAnchor.constraint(equalTo: findPWView.rightAnchor, constant: -20).isActive = true
        rightArrow2.widthAnchor.constraint(equalToConstant: 20).isActive = true
        rightArrow2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        findPWView.addSubview(findPWLabel)
        findPWLabel.centerYAnchor.constraint(equalTo: findPWView.centerYAnchor).isActive = true
        findPWLabel.leftAnchor.constraint(equalTo: findPWView.leftAnchor, constant: 30).isActive = true
        findPWLabel.rightAnchor.constraint(equalTo: rightArrow2.leftAnchor, constant: -20).isActive = true
        findPWLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
