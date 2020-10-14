//
//  LoginTF.swift
//  Delius
//
//  Created by user on 2020/10/11.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

class VerifyTextField:UIView {
    var textField:UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textColor = UIColor.MainGrayColor()
        tf.textAlignment = .center
        tf.font = UIFont.DeliusSystemType5()
        return tf
    }()
    var underline:UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = UIColor.MainGrayColor().cgColor
        v.layer.borderWidth = 1
        return v
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame:CGRect){
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        let size = frame.width - 8
        textField.backgroundColor = UIColor.clear
        textField.keyboardType = .numberPad
        setView()
    }
    private func setView(){
        self.addSubview(textField)
        textField.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textField.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.addSubview(underline)
        underline.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10).isActive = true
        underline.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        underline.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        underline.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
