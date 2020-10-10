//
//  LoginTextField.swift
//  Delius
//
//  Created by 정윤환 on 2020/06/10.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class LoginTextField:UIView{
    var textField:UITextField={
        let f = UITextField()
        f.translatesAutoresizingMaskIntoConstraints = false
        f.textColor = UIColor.MainGrayColor()
        f.textAlignment = .left
        f.font = UIFont.DeliusSystemType1()
        return f
    }()
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    init(placeHolder:String,frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = frame.height/2
        self.backgroundColor = UIColor.clear
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.MainLightGrayColor().cgColor
        self.clipsToBounds = true
        
        textField.placeholder = placeHolder
        setup()
    }
    private func setup(){
        self.addSubview(textField)
        textField.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textField.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        textField.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
}
