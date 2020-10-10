//
//  SetAppInfoView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 27/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SetAppInfoView:UIView{
    
    let hintLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.textAlignment = .left
        l.font = UIFont.DeliusSystemType2()
        l.text = "SettingAppInfoView001".localize()
        return l
    }()
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainBlackAlpha()
        return v
    }()
    var versionView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let versionLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SettingAppInfoView101".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType2(), txtColor: .MainBlackColor1())
        return l
    }()
    let versionRightArrow:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.MainBlackColor3()
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "RightArrow")
        return v
    }()
    
    var noticeView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let noticeLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SettingAppInfoView201".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType2(), txtColor: .MainBlackColor1())
        return l
    }()
    let noticeRightArrow:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.MainBlackColor2()
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "RightArrow")
        return v
    }()
    
    var centerView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let centerLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SettingAppInfoView301".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType2(), txtColor: .MainBlackColor1())
        return l
    }()
    let centerRightArrow:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.MainBlackColor2()
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "RightArrow")
        return v
    }()
    
    var serviceView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let serviceLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SettingAppInfoView401".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType2(), txtColor: .MainBlackColor1())
        return l
    }()
    let serviceRightArrow:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.MainBlackColor2()
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "RightArrow")
        return v
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
        let h :CGFloat = 50
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
        
        self.addSubview(versionView)
        versionView.topAnchor.constraint(equalTo: lineView.bottomAnchor).isActive = true
        versionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        versionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        versionView.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        self.addSubview(noticeView)
        noticeView.topAnchor.constraint(equalTo: versionView.bottomAnchor).isActive = true
        noticeView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        noticeView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        noticeView.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        self.addSubview(centerView)
        centerView.topAnchor.constraint(equalTo: noticeView.bottomAnchor).isActive = true
        centerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        centerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        centerView.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        self.addSubview(serviceView)
        serviceView.topAnchor.constraint(equalTo: centerView.bottomAnchor).isActive = true
        serviceView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        serviceView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        serviceView.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        versionView.addSubview(versionRightArrow)
        versionRightArrow.centerYAnchor.constraint(equalTo: versionView.centerYAnchor).isActive = true
        versionRightArrow.rightAnchor.constraint(equalTo: versionView.rightAnchor, constant: -30).isActive = true
        versionRightArrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
        versionRightArrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        versionView.addSubview(versionLabel)
        versionLabel.centerYAnchor.constraint(equalTo: versionView.centerYAnchor).isActive = true
        versionLabel.leftAnchor.constraint(equalTo: versionView.leftAnchor, constant: 30).isActive = true
        versionLabel.rightAnchor.constraint(equalTo: versionRightArrow.leftAnchor, constant: -20).isActive = true
        versionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        noticeView.addSubview(noticeRightArrow)
        noticeRightArrow.centerYAnchor.constraint(equalTo: noticeView.centerYAnchor).isActive = true
        noticeRightArrow.rightAnchor.constraint(equalTo: noticeView.rightAnchor, constant: -30).isActive = true
        noticeRightArrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
        noticeRightArrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        noticeView.addSubview(noticeLabel)
        noticeLabel.centerYAnchor.constraint(equalTo: noticeView.centerYAnchor).isActive = true
        noticeLabel.leftAnchor.constraint(equalTo: noticeView.leftAnchor, constant: 30).isActive = true
        noticeLabel.rightAnchor.constraint(equalTo: noticeRightArrow.leftAnchor, constant: -20).isActive = true
        noticeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        centerView.addSubview(centerRightArrow)
        centerRightArrow.centerYAnchor.constraint(equalTo: centerView.centerYAnchor).isActive = true
        centerRightArrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
        centerRightArrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
        centerRightArrow.rightAnchor.constraint(equalTo: centerView.rightAnchor, constant: -30).isActive = true
        
        centerView.addSubview(centerLabel)
        centerLabel.centerYAnchor.constraint(equalTo: centerView.centerYAnchor).isActive = true
        centerLabel.leftAnchor.constraint(equalTo: centerView.leftAnchor, constant: 30).isActive = true
        centerLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        centerLabel.rightAnchor.constraint(equalTo: centerRightArrow.leftAnchor, constant: -20).isActive = true
        
        serviceView.addSubview(serviceRightArrow)
        serviceRightArrow.centerYAnchor.constraint(equalTo: serviceView.centerYAnchor).isActive = true
        serviceRightArrow.rightAnchor.constraint(equalTo: serviceView.rightAnchor, constant: -30).isActive = true
        serviceRightArrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
        serviceRightArrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        serviceView.addSubview(serviceLabel)
        serviceLabel.centerYAnchor.constraint(equalTo: serviceView.centerYAnchor).isActive = true
        serviceLabel.leftAnchor.constraint(equalTo: serviceView.leftAnchor, constant: 30).isActive = true
        serviceLabel.rightAnchor.constraint(equalTo: serviceRightArrow.leftAnchor, constant: -20).isActive = true
        serviceLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
}
