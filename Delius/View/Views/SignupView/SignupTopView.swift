//
//  SignupTopView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 04/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
final class SignupTopView:UIView{
    
    var cancelBtn:IconButton1!
    var completeBtn:UIButton={
        let b = UIButton()
        b.DeliusType1(txt: "next".localize(), color: .MainBlackColor3(), backColor: .clear)
        b.titleLabel!.font = UIFont.DeliusSystemType2()
        b.alpha = 0
        return b
    }()
    
    let titleLabel1:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SignupView001".localize(), txtAlignment: .center, ft: UIFont.DeliusBoldType4(), txtColor: .white)
        return l
    }()
    let titleLabel2:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SignupView002".localize(), txtAlignment: .center, ft: UIFont.DeliusBoldType4(), txtColor: .white)
        l.alpha = 0
        return l
    }()
    let titleLabel3:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SignupView003".localize(), txtAlignment: .center, ft: UIFont.DeliusBoldType4(), txtColor: .white)
        l.alpha = 0
        return l
    }()
    let titleLabel4:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SignupView004".localize(), txtAlignment: .center, ft: UIFont.DeliusBoldType5(), txtColor: .white)
        l.alpha = 0
        return l
    }()
    var gradientView:MainGradientView!
    
    var nsLeft1,nsLeft2,nsLeft3,nsLeft4:NSLayoutConstraint!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(type:String,frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        cancelBtn = IconButton1(imgName: "LeftArrow", color: .white, frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        gradientView = MainGradientView(frame: CGRect(x:0,y:0,width:frame.width,height:frame.height))
        
        switch type{
        case "phone":
            setup(frame: frame, ns1: 0, ns2: frame.width, ns3: frame.width, ns4: frame.width)
        case "email":
            setup(frame: frame, ns1: -frame.width, ns2: 0, ns3: frame.width, ns4: frame.width)
            titleLabel2.alpha = 1
        case "profile":
            setup(frame: frame, ns1: -frame.width, ns2: -frame.width, ns3: 0, ns4: frame.width)
            titleLabel3.alpha = 1
        case "listener":
            setup(frame: frame, ns1: -frame.width, ns2: -frame.width, ns3: -frame.width, ns4: 0)
            titleLabel4.alpha = 1
        default:()
        }
    }
    private func setup(frame:CGRect,ns1:CGFloat,ns2:CGFloat,ns3:CGFloat,ns4:CGFloat){
        self.addSubview(gradientView)
        gradientView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        gradientView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        gradientView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        gradientView.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        
        self.addSubview(titleLabel1)
        titleLabel1.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLabel1.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        titleLabel1.heightAnchor.constraint(equalToConstant: 60).isActive = true
        nsLeft1 = titleLabel1.leftAnchor.constraint(equalTo: leftAnchor, constant: ns1)
        nsLeft1.isActive = true
        self.addSubview(titleLabel2)
        titleLabel2.bottomAnchor.constraint(equalTo: titleLabel1.bottomAnchor).isActive = true
        titleLabel2.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        titleLabel2.topAnchor.constraint(equalTo: titleLabel1.topAnchor).isActive = true
        nsLeft2 = titleLabel2.leftAnchor.constraint(equalTo: leftAnchor, constant: ns2)
        nsLeft2.isActive = true
        self.addSubview(titleLabel3)
        titleLabel3.bottomAnchor.constraint(equalTo: titleLabel1.bottomAnchor).isActive = true
        titleLabel3.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        titleLabel3.topAnchor.constraint(equalTo: titleLabel1.topAnchor).isActive = true
        nsLeft3 = titleLabel3.leftAnchor.constraint(equalTo: leftAnchor, constant: ns3)
        nsLeft3.isActive = true
        self.addSubview(titleLabel4)
        titleLabel4.bottomAnchor.constraint(equalTo: titleLabel1.bottomAnchor).isActive = true
        titleLabel4.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        titleLabel4.topAnchor.constraint(equalTo: titleLabel1.topAnchor).isActive = true
        nsLeft4 = titleLabel4.leftAnchor.constraint(equalTo: leftAnchor, constant: ns4)
        nsLeft4.isActive = true
        self.addSubview(cancelBtn)
        cancelBtn.centerYAnchor.constraint(equalTo: titleLabel1.centerYAnchor).isActive = true
        cancelBtn.widthAnchor.constraint(equalToConstant: 25).isActive = true
        cancelBtn.heightAnchor.constraint(equalToConstant: 25).isActive = true
        cancelBtn.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        self.addSubview(completeBtn)
        completeBtn.centerYAnchor.constraint(equalTo: cancelBtn.centerYAnchor).isActive = true
        completeBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        completeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        completeBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -25).isActive = true
    }
    func PhoneToEmailAnimation(wd:CGFloat){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.nsLeft1.constant = -wd
            self.titleLabel1.alpha = 0
            self.nsLeft2.constant = 0
            self.titleLabel2.alpha = 1
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    func phoneToProfileAnimation(wd:CGFloat){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.nsLeft1.constant = -wd
            self.titleLabel1.alpha = 0
            self.nsLeft3.constant = 0
            self.titleLabel3.alpha = 1
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    func emailToProfileAnimation(wd:CGFloat){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.nsLeft2.constant = -wd
            self.titleLabel2.alpha = 0
            self.nsLeft3.constant = 0
            self.titleLabel3.alpha = 1
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
}
