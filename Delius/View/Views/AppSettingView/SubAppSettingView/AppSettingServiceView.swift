//
//  AppSettingServiceView.swift
//  Delius
//
//  Created by user on 2020/07/21.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class AppSettingServiceView:UIView{
    
    let termHintLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.textAlignment = .left
        l.font = UIFont.DeliusSystemType2()
        l.text = "SettingServiceInfoView100".localize()
        return l
    }()
    let termLineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainBlackAlpha()
        return v
    }()
    var serviceTermView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let serviceTermLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SettingServiceInfoView101".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType2(), txtColor: .MainBlackColor1())
        return l
    }()
    let serviceTermRightArrow:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.MainBlackColor3()
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "RightArrow")
        return v
    }()
    
    var privacyTermView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let privacyTermLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SettingServiceInfoView102".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType2(), txtColor: .MainBlackColor1())
        return l
    }()
    let privacyTermRightArrow:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.MainBlackColor3()
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "RightArrow")
        return v
    }()
    
    var locationTermView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let locationTermLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SettingServiceInfoView103".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType2(), txtColor: .MainBlackColor1())
        return l
    }()
    let locationTermRightArrow:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.MainBlackColor3()
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "RightArrow")
        return v
    }()
    
    
    let licenseHintLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.textAlignment = .left
        l.font = UIFont.DeliusSystemType2()
        l.text = "SettingServiceInfoView200".localize()
        return l
    }()
    let licenseLineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainBlackAlpha()
        return v
    }()
    var licenseTermView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let licenseTermLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SettingServiceInfoView201".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType2(), txtColor: .MainBlackColor1())
        return l
    }()
    let licenseTermRightArrow:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.MainBlackColor3()
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "RightArrow")
        return v
    }()
    
    let companyHintLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.textAlignment = .left
        l.font = UIFont.DeliusSystemType2()
        l.text = "SettingServiceInfoView300".localize()
        return l
    }()
    let companyLineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainBlackAlpha()
        return v
    }()
    var companyView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let companyLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SettingServiceInfoView301".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType2(), txtColor: .MainBlackColor1())
        return l
    }()
    let companyRightArrow:UIImageView={
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
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    private func setup(){
        let h :CGFloat = 50
        self.addSubview(termHintLabel)
        termHintLabel.topAnchor.constraint(equalTo: topAnchor,constant: 20).isActive = true
        termHintLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        termHintLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        termHintLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        self.addSubview(termLineView)
        termLineView.topAnchor.constraint(equalTo: termHintLabel.bottomAnchor).isActive = true
        termLineView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        termLineView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        termLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.addSubview(serviceTermView)
        serviceTermView.topAnchor.constraint(equalTo: termLineView.bottomAnchor).isActive = true
        serviceTermView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        serviceTermView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        serviceTermView.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        serviceTermView.addSubview(serviceTermRightArrow)
        serviceTermRightArrow.centerYAnchor.constraint(equalTo: serviceTermView.centerYAnchor).isActive = true
        serviceTermRightArrow.rightAnchor.constraint(equalTo: serviceTermView.rightAnchor, constant: -30).isActive = true
        serviceTermRightArrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
        serviceTermRightArrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        serviceTermView.addSubview(serviceTermLabel)
        serviceTermLabel.leftAnchor.constraint(equalTo: serviceTermView.leftAnchor, constant: 30).isActive = true
        serviceTermLabel.rightAnchor.constraint(equalTo: serviceTermRightArrow.leftAnchor, constant: -20).isActive = true
        serviceTermLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        serviceTermLabel.centerYAnchor.constraint(equalTo: serviceTermView.centerYAnchor).isActive = true
        
        self.addSubview(privacyTermView)
        privacyTermView.topAnchor.constraint(equalTo: serviceTermView.bottomAnchor).isActive = true
        privacyTermView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        privacyTermView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        privacyTermView.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        privacyTermView.addSubview(privacyTermRightArrow)
        privacyTermRightArrow.centerYAnchor.constraint(equalTo: privacyTermView.centerYAnchor).isActive = true
        privacyTermRightArrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
        privacyTermRightArrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
        privacyTermRightArrow.rightAnchor.constraint(equalTo: privacyTermView.rightAnchor, constant: -30).isActive = true
        
        privacyTermView.addSubview(privacyTermLabel)
        privacyTermLabel.centerYAnchor.constraint(equalTo: privacyTermView.centerYAnchor).isActive = true
        privacyTermLabel.leftAnchor.constraint(equalTo: privacyTermView.leftAnchor, constant: 30).isActive = true
        privacyTermLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        privacyTermLabel.rightAnchor.constraint(equalTo: privacyTermRightArrow.leftAnchor, constant: -20).isActive = true
        
        self.addSubview(locationTermView)
        locationTermView.topAnchor.constraint(equalTo: privacyTermView.bottomAnchor).isActive = true
        locationTermView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        locationTermView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        locationTermView.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        locationTermView.addSubview(locationTermRightArrow)
        locationTermRightArrow.centerYAnchor.constraint(equalTo: locationTermView.centerYAnchor).isActive = true
        locationTermRightArrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
        locationTermRightArrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
        locationTermRightArrow.rightAnchor.constraint(equalTo: locationTermView.rightAnchor, constant: -30).isActive = true
        
        locationTermView.addSubview(locationTermLabel)
        locationTermLabel.centerYAnchor.constraint(equalTo: locationTermView.centerYAnchor).isActive = true
        locationTermLabel.leftAnchor.constraint(equalTo: locationTermView.leftAnchor, constant: 30).isActive = true
        locationTermLabel.rightAnchor.constraint(equalTo: locationTermRightArrow.leftAnchor, constant: -20).isActive = true
        locationTermLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(licenseHintLabel)
        licenseHintLabel.topAnchor.constraint(equalTo: locationTermLabel.bottomAnchor, constant: 20).isActive = true
        licenseHintLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        licenseHintLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        licenseHintLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        self.addSubview(licenseLineView)
        licenseLineView.topAnchor.constraint(equalTo: licenseHintLabel.bottomAnchor).isActive = true
        licenseLineView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        licenseLineView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        licenseLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.addSubview(licenseTermView)
        licenseTermView.topAnchor.constraint(equalTo: licenseLineView.bottomAnchor).isActive = true
        licenseTermView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        licenseTermView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        licenseTermView.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        licenseTermView.addSubview(licenseTermRightArrow)
        licenseTermRightArrow.rightAnchor.constraint(equalTo: licenseTermView.rightAnchor, constant: -30).isActive = true
        licenseTermRightArrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
        licenseTermRightArrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
        licenseTermRightArrow.centerYAnchor.constraint(equalTo: licenseTermView.centerYAnchor).isActive = true
        
        licenseTermView.addSubview(licenseTermLabel)
        licenseTermLabel.leftAnchor.constraint(equalTo: licenseTermView.leftAnchor, constant: 30).isActive = true
        licenseTermLabel.rightAnchor.constraint(equalTo: licenseTermRightArrow.leftAnchor, constant: -20).isActive = true
        licenseTermLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        licenseTermLabel.centerYAnchor.constraint(equalTo: licenseTermView.centerYAnchor).isActive = true
        
        
        self.addSubview(companyHintLabel)
        companyHintLabel.topAnchor.constraint(equalTo: licenseTermView.bottomAnchor, constant: 20).isActive = true
        companyHintLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        companyHintLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        companyHintLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        self.addSubview(companyLineView)
        companyLineView.topAnchor.constraint(equalTo: companyHintLabel.bottomAnchor).isActive = true
        companyLineView.leftAnchor.constraint(equalTo: leftAnchor,constant: 30).isActive = true
        companyLineView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        companyLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.addSubview(companyView)
        companyView.topAnchor.constraint(equalTo: companyLineView.bottomAnchor).isActive = true
        companyView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        companyView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        companyView.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        companyView.addSubview(companyRightArrow)
        companyRightArrow.centerYAnchor.constraint(equalTo: companyView.centerYAnchor).isActive = true
        companyRightArrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
        companyRightArrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
        companyRightArrow.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        
        companyView.addSubview(companyLabel)
        companyLabel.centerYAnchor.constraint(equalTo: companyView.centerYAnchor).isActive = true
        companyLabel.leftAnchor.constraint(equalTo: companyView.leftAnchor, constant: 30).isActive = true
        companyLabel.rightAnchor.constraint(equalTo: companyRightArrow.leftAnchor, constant: -20).isActive = true
        companyLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
}
