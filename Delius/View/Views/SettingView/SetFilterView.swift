//
//  SetFilterView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 27/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

class SetfilterView:UIView{
    
    let hintLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.textAlignment = .left
        l.font = UIFont.DeliusSystemType2()
        l.text = "SettingFilterView001"
        return l
    }()
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainBlackAlpha()
        return v
    }()
    var soloView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let soloLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SettingFilterView101", txtAlignment: .left, ft: UIFont.DeliusBoldType2(), txtColor: .MainBlackColor1())
        return l
    }()
    let rightArrow1:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.MainBlackColor3()
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "RightArrow")
        return v
    }()
    
    var groupView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let groupLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SettingFilterView201", txtAlignment: .left, ft: UIFont.DeliusBoldType2(), txtColor: .MainBlackColor1())
        return l
    }()
    let rightArrow2:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.MainBlackColor3()
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "RightArrow")
        return v
    }()
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
    }
    private func setup(){
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
        
        self.addSubview(soloView)
        soloView.topAnchor.constraint(equalTo: lineView.bottomAnchor).isActive = true
        soloView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        soloView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        soloView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.addSubview(groupView)
        groupView.topAnchor.constraint(equalTo: soloView.bottomAnchor).isActive = true
        groupView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        groupView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        groupView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        soloView.addSubview(rightArrow1)
        rightArrow1.widthAnchor.constraint(equalToConstant: 20).isActive = true
        rightArrow1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        rightArrow1.rightAnchor.constraint(equalTo: soloView.rightAnchor, constant: -30).isActive = true
        rightArrow1.centerYAnchor.constraint(equalTo: soloView.centerYAnchor).isActive = true
        
        soloView.addSubview(soloLabel)
        soloLabel.centerYAnchor.constraint(equalTo: soloView.centerYAnchor).isActive = true
        soloLabel.leftAnchor.constraint(equalTo: soloView.leftAnchor, constant: 30).isActive = true
        soloLabel.rightAnchor.constraint(equalTo: rightArrow1.leftAnchor, constant: -20).isActive = true
        soloLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        groupView.addSubview(rightArrow2)
        rightArrow2.centerYAnchor.constraint(equalTo: groupView.centerYAnchor).isActive = true
        rightArrow2.rightAnchor.constraint(equalTo: groupView.rightAnchor, constant: -30).isActive = true
        rightArrow2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        rightArrow2.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        groupView.addSubview(groupLabel)
        groupLabel.centerYAnchor.constraint(equalTo: groupView.centerYAnchor).isActive = true
        groupLabel.leftAnchor.constraint(equalTo: groupView.leftAnchor, constant: 30).isActive = true
        groupLabel.rightAnchor.constraint(equalTo: rightArrow2.leftAnchor, constant: -20).isActive = true
        groupLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
}
