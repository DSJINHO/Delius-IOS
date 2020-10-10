//
//  SetUserBlockView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 27/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SetUserBlockView:UIView{
    let hintLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.textAlignment = .left
        l.font = UIFont.DeliusSystemType2()
        l.text = "SettingBlockView001"
        return l
    }()
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainBlackAlpha()
        return v
    }()
    var blockView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let blockLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SettingBlockView101", txtAlignment: .left, ft: UIFont.DeliusBoldType2(), txtColor: .MainBlackColor1())
        return l
    }()
    let rightArrow:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.MainBlackColor3()
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "RightArrow")
        return v
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
        
        self.addSubview(blockView)
        blockView.topAnchor.constraint(equalTo: lineView.bottomAnchor).isActive = true
        blockView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        blockView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        blockView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        blockView.addSubview(rightArrow)
        rightArrow.centerYAnchor.constraint(equalTo: blockView.centerYAnchor).isActive = true
        rightArrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
        rightArrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
        rightArrow.rightAnchor.constraint(equalTo: blockView.rightAnchor, constant: -30).isActive = true
        
        blockView.addSubview(blockLabel)
        blockLabel.centerYAnchor.constraint(equalTo: blockView.centerYAnchor).isActive = true
        blockLabel.leftAnchor.constraint(equalTo: blockView.leftAnchor, constant: 30).isActive = true
        blockLabel.rightAnchor.constraint(equalTo: rightArrow.leftAnchor, constant: -20).isActive = true
        blockLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
