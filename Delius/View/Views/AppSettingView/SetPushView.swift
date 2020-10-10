//
//  SetPushView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 27/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SetPushView:UIView{
    let hintLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.textAlignment = .left
        l.font = UIFont.DeliusSystemType2()
        l.text = "SettingPushView001".localize()
        return l
    }()
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainBlackAlpha()
        return v
    }()
    var serviceView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let serviceLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SettingPushView101".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType2(), txtColor: .MainBlackColor1())
        return l
    }()
    var serviceSwitch:UISwitch={
        let s = UISwitch()
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    var deliusView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let deliusLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SettingPushView201".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType2(), txtColor: .MainBlackColor1())
        return l
    }()
    var deliusSwitch:UISwitch={
        let s = UISwitch()
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
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
        lineView.leftAnchor.constraint(equalTo: leftAnchor,constant: 30).isActive = true
        lineView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.addSubview(serviceView)
        serviceView.topAnchor.constraint(equalTo: lineView.bottomAnchor).isActive = true
        serviceView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        serviceView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        serviceView.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        self.addSubview(deliusView)
        deliusView.topAnchor.constraint(equalTo: serviceView.bottomAnchor).isActive = true
        deliusView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        deliusView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        deliusView.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        serviceView.addSubview(serviceSwitch)
        serviceSwitch.centerYAnchor.constraint(equalTo: serviceView.centerYAnchor).isActive = true
        serviceSwitch.rightAnchor.constraint(equalTo: serviceView.rightAnchor, constant: -30).isActive = true
        serviceSwitch.widthAnchor.constraint(equalToConstant: 60).isActive = true
        serviceSwitch.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        serviceView.addSubview(serviceLabel)
        serviceLabel.centerYAnchor.constraint(equalTo: serviceView.centerYAnchor).isActive = true
        serviceLabel.leftAnchor.constraint(equalTo: serviceView.leftAnchor, constant: 30).isActive = true
        serviceLabel.rightAnchor.constraint(equalTo: serviceSwitch.leftAnchor, constant: -20).isActive = true
        serviceLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        deliusView.addSubview(deliusSwitch)
        deliusSwitch.rightAnchor.constraint(equalTo: deliusView.rightAnchor, constant: -30).isActive = true
        deliusSwitch.heightAnchor.constraint(equalToConstant: 30).isActive = true
        deliusSwitch.widthAnchor.constraint(equalToConstant: 60).isActive = true
        deliusSwitch.centerYAnchor.constraint(equalTo: deliusView.centerYAnchor).isActive = true
        
        deliusView.addSubview(deliusLabel)
        deliusLabel.centerYAnchor.constraint(equalTo: deliusView.centerYAnchor).isActive = true
        deliusLabel.leftAnchor.constraint(equalTo: deliusView.leftAnchor, constant: 30).isActive = true
        deliusLabel.rightAnchor.constraint(equalTo: deliusSwitch.leftAnchor, constant: -20).isActive = true
        deliusLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
