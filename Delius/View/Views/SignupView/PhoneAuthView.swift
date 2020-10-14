//
//  PhoneAuthView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 03/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
final class PhoneAuthView:UIView{
    var point:UILabel = {
        let l = UILabel()
        l.pointLabel()
        return l
    }()
    let sendView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let sendTitleLabel:UILabel={
        let l = UILabel()
        l.MainLabel(txt: "PhoneAuthView001".toLocal(), txtAlignment: .left, fnt: UIFont.DeliusBoldType5())
        return l
    }()
    let sendSubLabel:UILabel={
        let l = UILabel()
        l.MainLabel(txt: "PhoneAuthView002".toLocal(), txtAlignment: .left, fnt: UIFont.DeliusBoldType5())
        return l
    }()
    
    let sendSubLabel2:UILabel={
        let l = UILabel()
        l.MainLabel(txt: "PhoneAuthView004".toLocal(), txtAlignment: .left, fnt: UIFont.DeliusSystemType4())
        l.textColor = .MainBlackColor()
        return l
    }()
    var sendPhoneEdt:PhoneEdtTextField!
    var localPickerBtn:UIButton={
        let b = UIButton()
        b.DeliusType3(txt: "KR +82", color: .MainGrayColor(), backColor: .clear)
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
        l.MainLabel(txt: "PhoneAuthView102".toLocal(), txtAlignment: .left, fnt: UIFont.DeliusBoldType5())
        return l
    }()
    let verifyTitleLabel2:UILabel={
        let l = UILabel()
        l.MainLabel(txt: "PhoneAuthView103".toLocal(), txtAlignment: .left, fnt: UIFont.DeliusBoldType5())
        return l
    }()
    let verifySubLabel:UILabel={
        let l = UILabel()
        l.MainLabel(txt: "PhoneAuthView104".toLocal(), txtAlignment: .left, fnt: UIFont.DeliusBoldType6())
        return l
    }()
    let verifySubLabel2:UILabel={
        let l = UILabel()
        l.MainLabel(txt: "PhoneAuthView105".toLocal(), txtAlignment: .left, fnt: UIFont.DeliusBoldType6())
        return l
    }()
    var verifyEdtView:VerificationTextFieldView!
    
    var sendCompleteBtn:UIButton={
        let b = UIButton()
        b.BtnWhiteType(txt: "PhoneAuthView003".toLocal())
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
    var lineView:UIView = {
        let l = UIView()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = .clear
        l.layer.borderColor = UIColor.MainGrayColor().cgColor
        l.layer.borderWidth = 1
        return l
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
        sendPhoneEdt = PhoneEdtTextField(placeHolder: "010 1234 5678", frame: CGRect(x:0,y:0,width: frame.width - 60,height:40))
        sendPhoneEdt.textField.keyboardType = .numberPad
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
        nsTop2 = verifyView.topAnchor.constraint(equalTo: topAnchor)
        nsTop2.isActive = true
        verifyView.leftAnchor.constraint(equalTo: sendView.leftAnchor).isActive = true
        verifyView.rightAnchor.constraint(equalTo: sendView.rightAnchor).isActive = true
        verifyView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        let sendTitleLabel_str = "PhoneAuthView001".toLocal()
        let sendTitleLabel_height = sendTitleLabel_str.StringHeight(withConstrainedWidth: frame.width - 50, font: UIFont.DeliusBoldType1())
        
        sendView.addSubview(sendTitleLabel)
        sendTitleLabel.topAnchor.constraint(equalTo: sendView.topAnchor).isActive = true
        sendTitleLabel.heightAnchor.constraint(equalToConstant: sendTitleLabel_height).isActive = true
        sendTitleLabel.leftAnchor.constraint(equalTo: sendView.leftAnchor, constant: 40).isActive = true
        sendTitleLabel.rightAnchor.constraint(equalTo: sendView.rightAnchor, constant: -40).isActive = true
        self.addSubview(point)
        point.topAnchor.constraint(equalTo: sendTitleLabel.topAnchor, constant: 0 ).isActive = true
        point.rightAnchor.constraint(equalTo: sendTitleLabel.leftAnchor, constant: 15).isActive = true
        point.widthAnchor.constraint(equalToConstant: 30).isActive = true
        point.heightAnchor.constraint(equalToConstant: 5).isActive = true

        
        sendView.addSubview(sendSubLabel)
        sendSubLabel.topAnchor.constraint(equalTo: sendTitleLabel.bottomAnchor, constant: 10).isActive = true
        sendSubLabel.leftAnchor.constraint(equalTo: sendTitleLabel.leftAnchor).isActive = true
        sendSubLabel.rightAnchor.constraint(equalTo: sendTitleLabel.rightAnchor).isActive = true
        sendSubLabel.heightAnchor.constraint(equalToConstant: sendTitleLabel_height).isActive = true
        
        sendView.addSubview(sendSubLabel2)
        sendSubLabel2.topAnchor.constraint(equalTo: sendSubLabel.bottomAnchor, constant: 20).isActive = true
        sendSubLabel2.leftAnchor.constraint(equalTo: sendTitleLabel.leftAnchor).isActive = true
        sendSubLabel2.rightAnchor.constraint(equalTo: sendTitleLabel.rightAnchor).isActive = true
        sendSubLabel2.heightAnchor.constraint(equalToConstant: sendTitleLabel_height).isActive = true
        
        
        sendView.addSubview(localPickerBtn)
        localPickerBtn.topAnchor.constraint(equalTo: sendSubLabel2.bottomAnchor, constant: 60).isActive = true
        localPickerBtn.leftAnchor.constraint(equalTo: sendView.leftAnchor, constant: 40).isActive = true
        localPickerBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        localPickerBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        sendView.addSubview(lineView)
        lineView.topAnchor.constraint(equalTo: localPickerBtn.bottomAnchor, constant: 0).isActive = true
        lineView.leftAnchor.constraint(equalTo: localPickerBtn.leftAnchor).isActive = true
        
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        sendView.addSubview(sendCompleteBtn)
        sendCompleteBtn.topAnchor.constraint(equalTo: localPickerBtn.bottomAnchor, constant: 30).isActive = true
        sendCompleteBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        sendCompleteBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        sendCompleteBtn.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        sendView.addSubview(localImgView)
        localImgView.leftAnchor.constraint(equalTo: localPickerBtn.rightAnchor, constant: 10).isActive = true
        localImgView.centerYAnchor.constraint(equalTo: localPickerBtn.centerYAnchor).isActive = true
        localImgView.widthAnchor.constraint(equalToConstant: 5).isActive = true
        localImgView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        lineView.rightAnchor.constraint(equalTo: localImgView.rightAnchor).isActive = true
        
        sendView.addSubview(sendPhoneEdt)
        sendPhoneEdt.topAnchor.constraint(equalTo: localPickerBtn.topAnchor,constant: 10).isActive = true
        sendPhoneEdt.leftAnchor.constraint(equalTo: localPickerBtn.rightAnchor, constant: 40).isActive = true
        sendPhoneEdt.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        sendPhoneEdt.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let verifyTitleLabel_str = "PhoneAuthView102".toLocal()
        let verifyTitleLabel_height = verifyTitleLabel_str.StringHeight(withConstrainedWidth: frame.width-60, font: UIFont.DeliusBoldType5())
        verifyView.addSubview(verifyTitleLabel)
        verifyTitleLabel.topAnchor.constraint(equalTo: sendView.topAnchor).isActive = true
        verifyTitleLabel.leftAnchor.constraint(equalTo: sendView.leftAnchor,constant: 40).isActive = true
        verifyTitleLabel.rightAnchor.constraint(equalTo: sendView.rightAnchor, constant: -40).isActive = true
        verifyTitleLabel.heightAnchor.constraint(equalToConstant: verifyTitleLabel_height).isActive = true
        
        verifyView.addSubview(verifyTitleLabel2)
        verifyTitleLabel2.topAnchor.constraint(equalTo: verifyTitleLabel.bottomAnchor, constant: 10).isActive = true
        verifyTitleLabel2.leftAnchor.constraint(equalTo: verifyTitleLabel.leftAnchor).isActive = true
        verifyTitleLabel2.rightAnchor.constraint(equalTo: verifyTitleLabel.rightAnchor).isActive = true
        verifyTitleLabel2.heightAnchor.constraint(equalToConstant: verifyTitleLabel_height).isActive = true
        

        verifyView.addSubview(verifySubLabel)
        verifySubLabel.topAnchor.constraint(equalTo: verifyTitleLabel2.bottomAnchor, constant: 30).isActive = true
        verifySubLabel.leftAnchor.constraint(equalTo: verifyTitleLabel2.leftAnchor).isActive = true
        verifySubLabel.rightAnchor.constraint(equalTo: verifyTitleLabel2.rightAnchor).isActive = true
        verifySubLabel.heightAnchor.constraint(equalToConstant: verifyTitleLabel_height).isActive = true
        
        verifyView.addSubview(verifySubLabel2)
        verifySubLabel2.topAnchor.constraint(equalTo: verifySubLabel.bottomAnchor).isActive = true
        verifySubLabel2.leftAnchor.constraint(equalTo: verifySubLabel.leftAnchor).isActive = true
        verifySubLabel2.rightAnchor.constraint(equalTo: verifySubLabel.rightAnchor).isActive = true
        verifySubLabel2.heightAnchor.constraint(equalToConstant: verifyTitleLabel_height).isActive = true
        
        verifyView.addSubview(verifyEdtView)
        verifyEdtView.topAnchor.constraint(equalTo: verifySubLabel2.bottomAnchor, constant: 50).isActive = true
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
                self.nsTop2.constant = 20
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
