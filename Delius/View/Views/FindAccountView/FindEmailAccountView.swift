//
//  FindEmailAccountView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 25/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class FindEmailAccountView:UIView{
    
    let titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType1()
        l.textColor = UIColor.MainBlackColor1()
        l.textAlignment = .left
        l.text = "FindAccountView101".localize()
        return l
    }()
    let subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusSystemType2()
        l.textAlignment = .left
        l.text = "FindAccountView102".localize()
        l.textColor = UIColor.MainBlackColor2()
        return l
    }()
    var pickerBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("kr +82", for: .normal)
        b.setTitleColor(UIColor.MainBlackColor1(), for: .normal)
        return b
    }()
    var phoneNumField:UnderBarTextField!
    var sendBtn:UIButton={
        let b = UIButton()
        b.DeliusType1(txt: "FindAccountView103".localize(), color: .white, backColor: UIColor.gradientColor()[2])
        return b
    }()
    var verifyNumField:UnderBarTextField!
    var verifyBtn:UIButton={
        let b = UIButton()
        b.DeliusType1(txt: "FindAccountView104".localize(), color: .white, backColor: UIColor.gradientColor()[2])
        b.alpha = 0
        return b
    }()
    
    var answerView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.isHidden = true
        return v
    }()
    let answerTitleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .left
        l.text = "FindAccountView105".localize()
        l.textColor = UIColor.MainBlackColor1()
        return l
    }()
    var answerLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType2()
        l.textAlignment = .left
        l.textColor = UIColor.MainBlackColor1()
        return l
    }()
    
    required init?(coder:NSCoder){
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        let fieldRect = CGRect(x:0,y:0,width:frame.width-180,height:40)
        phoneNumField = UnderBarTextField(ph_txt: "01012345678", color: UIColor.MainBlackColor1(), frame: fieldRect)
        verifyNumField = UnderBarTextField(ph_txt: "FindAccountView106".localize(), color: .MainBlackColor2(), frame: fieldRect)
        verifyNumField.alpha = 0
        setup()
    }
    private func setup(){
        
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor,constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        subLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: -30).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(pickerBtn)
        pickerBtn.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        pickerBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pickerBtn.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 20).isActive = true
        pickerBtn.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.addSubview(sendBtn)
        sendBtn.centerYAnchor.constraint(equalTo: pickerBtn.centerYAnchor).isActive = true
        sendBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        sendBtn.widthAnchor.constraint(equalToConstant: 60).isActive = true
        sendBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(phoneNumField)
        phoneNumField.topAnchor.constraint(equalTo: pickerBtn.topAnchor).isActive = true
        phoneNumField.leftAnchor.constraint(equalTo: pickerBtn.rightAnchor, constant: 20).isActive = true
        phoneNumField.rightAnchor.constraint(equalTo: sendBtn.leftAnchor, constant: -20).isActive = true
        phoneNumField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(verifyBtn)
        verifyBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        verifyBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        verifyBtn.topAnchor.constraint(equalTo: sendBtn.bottomAnchor, constant: 15).isActive = true
        verifyBtn.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.addSubview(verifyNumField)
        verifyNumField.centerYAnchor.constraint(equalTo: verifyBtn.centerYAnchor).isActive = true
        verifyNumField.rightAnchor.constraint(equalTo: verifyBtn.leftAnchor, constant: -20).isActive = true
        verifyNumField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        verifyNumField.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.addSubview(answerView)
        answerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        answerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        answerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        answerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        answerView.addSubview(answerTitleLabel)
        answerTitleLabel.topAnchor.constraint(equalTo: answerView.topAnchor, constant: 30).isActive = true
        answerTitleLabel.leftAnchor.constraint(equalTo: answerView.leftAnchor, constant: 30).isActive = true
        answerTitleLabel.rightAnchor.constraint(equalTo: answerView.rightAnchor, constant: -30).isActive = true
        answerTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        answerView.addSubview(answerLabel)
        answerLabel.topAnchor.constraint(equalTo: answerTitleLabel.bottomAnchor, constant: 15).isActive = true
        answerLabel.leftAnchor.constraint(equalTo: answerTitleLabel.leftAnchor, constant: 10).isActive = true
        answerLabel.rightAnchor.constraint(equalTo: answerTitleLabel.rightAnchor).isActive = true
        answerLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        answerLabel.text = "legogo92@naver.com"
    }
}
