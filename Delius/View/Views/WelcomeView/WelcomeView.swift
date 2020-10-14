//
//  WelcomeView.swift
//  delius-signin
//
//  Created by user on 2020/09/10.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class WelcomeView:UIView {
    

    var phoneStart:UIButton = {
        let b = UIButton()
        b.BtnWhiteType(txt: "WelcomeView001".toLocal())
        return b
    }()
    var emailStart:UIButton = {
        let b = UIButton()
        b.BtnWhiteType(txt: "WelcomeView002".toLocal())
        return b
    }()
    var bottomLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.SubLabel(txt: "WelcomeView003".toLocal(), txtAlignment: .center, fnt: UIFont.DeliusSystemType3())
        return l
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
        setView()
    }
    
    private func setView(){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let btmPadding = window.safeAreaInsets.bottom
        
        
        self.addSubview(bottomLabel)
        bottomLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: -btmPadding - 50).isActive = true
        bottomLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        bottomLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        bottomLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
     
        self.addSubview(emailStart)
        emailStart.bottomAnchor.constraint(equalTo: bottomLabel.topAnchor, constant: -20).isActive = true
        emailStart.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        emailStart.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        emailStart.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.addSubview(phoneStart)
        phoneStart.bottomAnchor.constraint(equalTo: emailStart.topAnchor, constant: -10).isActive = true
        phoneStart.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        phoneStart.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        phoneStart.heightAnchor.constraint(equalToConstant: 50).isActive = true
        

    }
    
}
