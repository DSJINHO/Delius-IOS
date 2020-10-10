//
//  setLanguageView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 27/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SetLanguageView:UIView{
    let hintLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.textAlignment = .left
        l.font = UIFont.DeliusSystemType2()
        l.text = "SettingLanguageView001".localize()
        return l
    }()
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainBlackAlpha()
        return v
    }()
    var languageView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let languageLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SettingLanguageView101".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType2(), txtColor: .MainBlackColor1())
        return l
    }()
    let userLanguageLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor3()
        l.font = UIFont.DeliusSystemType2()
        l.textAlignment = .right
        return l
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    private func setup(){
        let h:CGFloat =  50
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
        
        self.addSubview(languageView)
        languageView.topAnchor.constraint(equalTo: lineView.bottomAnchor).isActive = true
        languageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        languageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        languageView.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        self.addSubview(languageLabel)
        languageLabel.leftAnchor.constraint(equalTo: languageView.leftAnchor, constant: 30).isActive = true
        languageLabel.rightAnchor.constraint(equalTo: languageView.centerXAnchor).isActive = true
        languageLabel.centerYAnchor.constraint(equalTo: languageView.centerYAnchor).isActive = true
        languageLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(userLanguageLabel)
        userLanguageLabel.centerYAnchor.constraint(equalTo: languageView.centerYAnchor).isActive = true
        userLanguageLabel.rightAnchor.constraint(equalTo: languageView.rightAnchor, constant: -30).isActive = true
        userLanguageLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userLanguageLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
