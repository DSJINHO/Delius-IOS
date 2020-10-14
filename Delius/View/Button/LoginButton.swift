//
//  LoginButton.swift
//  Delius
//
//  Created by 정윤환 on 2020/06/10.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class LoginButton:UIButton{
    var label:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .center
        l.text = "LoginView001".toLocal()
        l.backgroundColor = .black
        return l
    }()
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        setup()
    }
    private func setup(){
        
        self.addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        
    }
}
