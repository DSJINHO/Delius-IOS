//
//  PhoneAuthView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 03/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
final class PhoneAuthView:UIView{
    let sendView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let sendTitleLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "PhoneAuthView001".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType4(), txtColor: .MainGrayColor())
        return l
    }()
    let sendSubLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "PhoneAuthView002".localize(), txtAlignment: .left, ft: UIFont.DeliusSystemType2(), txtColor: .MainGrayColor())
        return l
    }()
    var sendPhoneEdt:LightBoderTextField!
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
    var localPickerBtn:UIButton={
        let b = UIButton()
        b.DeliusType3(txt: "+82", color: .MainGrayColor(), backColor: .clear)
        b.titleLabel!.font = UIFont.DeliusSystemType1()
        b.titleLabel!.textAlignment = .left
        return b
    }()
    var localImgView:UIImageView={
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.image = UIImage(named: "picker")
        i.clipsToBounds = true
        i.tintColor = UIColor.MainGrayColor()
        return i
    }()
    let verifyView:UIView={
        let v = UIView()
        v.alpha = 0
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let verifyTitleLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "PhoneAuthView102".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType4(), txtColor: .MainGrayColor())
        return l
    }()
    let verifySubLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "PhoneAuthView103".localize(), txtAlignment: .left, ft: UIFont.DeliusSystemType2(), txtColor: .MainGrayColor())
        return l
    }()
    var verifyEdtView:VerificationTextFieldView!
    
    var sendCompleteBtn:UIButton={
        let b = UIButton()
        b.DeliusType3(txt: "PhoneAuthView003".localize(), color: .white, backColor: UIColor.MainLightGrayColor())
        b.layer.cornerRadius = 15
        b.clipsToBounds = true
        return b
    }()
    
    var localPickerView:LocalPhoneNumPickerView!
    let shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainAlphaView()
        v.alpha = 0
        return v
    }()
    
    var nsTop1,nsTop2:NSLayoutConstraint!
    var nsBtm:NSLayoutConstraint!
    var tapGesture:UITapGestureRecognizer!
    
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        localPickerView = LocalPhoneNumPickerView(frame: CGRect(x:0,y:0,width: frame.width,height:250))
        sendPhoneEdt = LightBoderTextField(ph_txt: "01012345678", color: .black, frame: CGRect(x:0,y:0,width: frame.width - 60,height:50))
        sendPhoneEdt.keyboardType = .numberPad
        let verifyHeight = frame.width/4
        verifyEdtView = VerificationTextFieldView(frame: CGRect(x:0,y:0,width:frame.width,height:100))
        //sendCompleteBtn = RoundButton(txt: "PhoneAuthView003".localize(), color: .MainColor(), frame: CGRect(x:0,y:0,width: frame.width-60,height:verifyHeight))
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapFunc(_:)))
        shadowView.addGestureRecognizer(tapGesture)
        
        setup(frame: frame, verifyHeight: verifyHeight)
    }
    private func setup(frame:CGRect,verifyHeight edtHeight:CGFloat){
        self.addSubview(sendView)
        nsTop1 = sendView.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        nsTop1.isActive = true
        sendView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        sendView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        sendView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        self.addSubview(verifyView)
        nsTop2 = verifyView.topAnchor.constraint(equalTo: topAnchor, constant: 50)
        nsTop2.isActive = true
        verifyView.leftAnchor.constraint(equalTo: sendView.leftAnchor).isActive = true
        verifyView.rightAnchor.constraint(equalTo: sendView.rightAnchor).isActive = true
        verifyView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        let sendTitleLabel_str = "PhoneAuthView001".localize()
        let sendTitleLabel_height = sendTitleLabel_str.StringHeight(withConstrainedWidth: frame.width - 60, font: UIFont.DeliusBoldType1())
        
        sendView.addSubview(sendTitleLabel)
        sendTitleLabel.topAnchor.constraint(equalTo: sendView.topAnchor).isActive = true
        sendTitleLabel.heightAnchor.constraint(equalToConstant: sendTitleLabel_height).isActive = true
        sendTitleLabel.leftAnchor.constraint(equalTo: sendView.leftAnchor, constant: 30).isActive = true
        sendTitleLabel.rightAnchor.constraint(equalTo: sendView.rightAnchor, constant: -30).isActive = true
        
        let sendSubLabel_str = "PhoneAuthView002".localize()
        let sendSubLabel_height = sendSubLabel_str.StringHeight(withConstrainedWidth: frame.width - 60, font: UIFont.DeliusSystemType2())
        
        sendView.addSubview(sendSubLabel)
        sendSubLabel.topAnchor.constraint(equalTo: sendTitleLabel.bottomAnchor, constant: 10).isActive = true
        sendSubLabel.leftAnchor.constraint(equalTo: sendTitleLabel.leftAnchor).isActive = true
        sendSubLabel.rightAnchor.constraint(equalTo: sendTitleLabel.rightAnchor).isActive = true
        sendSubLabel.heightAnchor.constraint(equalToConstant: sendSubLabel_height).isActive = true
        sendView.addSubview(localPickerBtn)
        localPickerBtn.topAnchor.constraint(equalTo: sendSubLabel.bottomAnchor, constant: 30).isActive = true
        localPickerBtn.leftAnchor.constraint(equalTo: sendView.leftAnchor, constant: 18).isActive = true
        localPickerBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        localPickerBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        sendView.addSubview(sendCompleteBtn)
        sendCompleteBtn.centerYAnchor.constraint(equalTo: localPickerBtn.centerYAnchor).isActive = true
        sendCompleteBtn.widthAnchor.constraint(equalToConstant: 60).isActive = true
        sendCompleteBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        sendCompleteBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        sendView.addSubview(localImgView)
        localImgView.leftAnchor.constraint(equalTo: localPickerBtn.rightAnchor).isActive = true
        localImgView.centerYAnchor.constraint(equalTo: localPickerBtn.centerYAnchor).isActive = true
        localImgView.widthAnchor.constraint(equalToConstant: 5).isActive = true
        localImgView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        sendView.addSubview(lineView)
        lineView.centerYAnchor.constraint(equalTo: localPickerBtn.centerYAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: localPickerBtn.rightAnchor, constant: 15).isActive = true
        lineView.rightAnchor.constraint(equalTo: sendCompleteBtn.leftAnchor, constant: -10).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        sendView.addSubview(sendPhoneEdt)
        sendPhoneEdt.centerYAnchor.constraint(equalTo: localPickerBtn.centerYAnchor).isActive = true
        sendPhoneEdt.leftAnchor.constraint(equalTo: localPickerBtn.rightAnchor, constant: 30).isActive = true
        sendPhoneEdt.rightAnchor.constraint(equalTo: sendCompleteBtn.leftAnchor, constant: -10).isActive = true
        sendPhoneEdt.bottomAnchor.constraint(equalTo: localPickerBtn.bottomAnchor).isActive = true
        
        let verifyTitleLabel_str = "PhoneAuthView102".localize()
        let verifyTitleLabel_height = verifyTitleLabel_str.StringHeight(withConstrainedWidth: frame.width-60, font: UIFont.DeliusBoldType1())
        verifyView.addSubview(verifyTitleLabel)
        verifyTitleLabel.topAnchor.constraint(equalTo: verifyView.topAnchor).isActive = true
        verifyTitleLabel.leftAnchor.constraint(equalTo: verifyView.leftAnchor,constant: 30).isActive = true
        verifyTitleLabel.rightAnchor.constraint(equalTo: verifyView.rightAnchor, constant: -30).isActive = true
        verifyTitleLabel.heightAnchor.constraint(equalToConstant: verifyTitleLabel_height).isActive = true
        
        let verifySubLabel_str = "PhoneAuthView103".localize()
        let verifySubLabel_height = verifySubLabel_str.StringHeight(withConstrainedWidth: frame.width - 60, font: UIFont.DeliusSystemType2())
        verifyView.addSubview(verifySubLabel)
        verifySubLabel.topAnchor.constraint(equalTo: verifyTitleLabel.bottomAnchor, constant: 10).isActive = true
        verifySubLabel.leftAnchor.constraint(equalTo: verifyTitleLabel.leftAnchor).isActive = true
        verifySubLabel.rightAnchor.constraint(equalTo: verifyTitleLabel.rightAnchor).isActive = true
        verifySubLabel.heightAnchor.constraint(equalToConstant: verifySubLabel_height).isActive = true
        
        verifyView.addSubview(verifyEdtView)
        verifyEdtView.topAnchor.constraint(equalTo: verifySubLabel.bottomAnchor, constant: 30).isActive = true
        verifyEdtView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        verifyEdtView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        verifyEdtView.heightAnchor.constraint(equalToConstant: edtHeight).isActive = true
        
        self.addSubview(shadowView)
        shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shadowView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        shadowView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        self.addSubview(localPickerView)
        nsBtm = localPickerView.topAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        nsBtm.isActive = true
        localPickerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        localPickerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        localPickerView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
    }
    @objc func tapFunc(_ sender:UITapGestureRecognizer){
        pickerViewAnimation(reverse: true)
    }
    func Animation(reverse:Bool,completion:@escaping()->Void){
        let animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn, animations: {
            if reverse{
                self.nsTop1.constant = 20
                self.sendView.alpha = 1
                self.nsTop2.constant = 40
                self.verifyView.alpha = 0
            }else{
                self.nsTop1.constant = 0
                self.sendView.alpha = 0
                self.nsTop2.constant = 20
                self.verifyView.alpha = 1
            }
            self.layoutIfNeeded()
        })
        animator.startAnimation()
        animator.addCompletion{position in
            if position == .end{
                completion()
            }
        }
    }
    func pickerViewAnimation(reverse:Bool){
        let Animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn, animations: {
            if reverse{
                self.shadowView.alpha = 0
                self.nsBtm.constant = 0
            }else{
                self.shadowView.alpha = 1
                self.nsBtm.constant = -250
            }
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                if reverse{
                    self.sendPhoneEdt.becomeFirstResponder()
                }
            }
        }
    }
    
}
