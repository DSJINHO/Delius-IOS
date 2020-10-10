//
//  ProfileEditStringView.swift
//  Delius
//
//  Created by 박진호 on 2020/07/07.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class ProfileEditStringView:UIView{
    var titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor1()
        l.font = UIFont.DeliusBoldType2()
        l.textAlignment = .left
        return l
    }()
    var textField:UITextField={
        let f = UITextField()
        f.translatesAutoresizingMaskIntoConstraints = false
        f.textColor = UIColor.MainBlackColor2()
        f.font = UIFont.DeliusBoldType1()
        f.textAlignment = .left
        return f
    }()
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.clear
        v.layer.cornerRadius = 15
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.MainLightGrayColor().cgColor
        v.clipsToBounds = true
        return v
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(txt:String,frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = txt
        setup()
    }
    private func setup(){
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor,constant: 30).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(lineView)
        lineView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        lineView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        lineView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(textField)
        textField.centerYAnchor.constraint(equalTo: lineView.centerYAnchor).isActive = true
        textField.leftAnchor.constraint(equalTo: titleLabel.leftAnchor,constant: 15).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
}
