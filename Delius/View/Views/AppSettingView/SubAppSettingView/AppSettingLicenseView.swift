//
//  AppSettingLicenseView.swift
//  Delius
//
//  Created by user on 2020/07/21.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class AppSettingLicenseView:UIView{
    
    var backView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .gray
        v.alpha = 0
        return v
    }()
    var whiteView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.alpha = 0
        return v
    }()
    let titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.black
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .center
        l.text = "License".localize()
        return l
    }()
    var completeBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("OK", for: .normal)
        b.titleLabel?.textAlignment = .center
        b.titleLabel?.font = UIFont.DeliusBoldType1()
        b.setTitleColor(UIColor.black, for: .normal)
        return b
    }()
    var upperLineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .gray
        v.alpha = 0.3
        return v
    }()
    var lowerLineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .gray
        v.alpha = 0.3
        return v
    }()
    var nsTop:NSLayoutConstraint!
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        setup(height:frame.height)
    }
    private func setup(height:CGFloat){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let btmPadding = window.safeAreaInsets.bottom
        
        self.addSubview(backView)
        backView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(whiteView)
        nsTop = whiteView.topAnchor.constraint(equalTo: topAnchor, constant: topPadding + 150)
        nsTop.isActive = true
        whiteView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        whiteView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: height - topPadding - btmPadding - 120).isActive = true
        
        whiteView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 30).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        
        
        whiteView.addSubview(upperLineView)
        upperLineView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 20).isActive = true
        upperLineView.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 20).isActive = true
        upperLineView.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -20).isActive = true
        upperLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        whiteView.addSubview(completeBtn)
        completeBtn.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor,constant: -30).isActive = true
        completeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        completeBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        completeBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        
        whiteView.addSubview(lowerLineView)
        lowerLineView.bottomAnchor.constraint(equalTo: completeBtn.topAnchor,constant: -20).isActive = true
        lowerLineView.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 20).isActive = true
        lowerLineView.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -20).isActive = true
        lowerLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    func openAnimation(){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let Animator = UIViewPropertyAnimator(duration: 0.25, curve: .easeOut, animations: {
            self.nsTop.constant = topPadding + 60
            self.backView.alpha = 0.7
            self.whiteView.alpha = 1
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    func closeAnimation(completion:@escaping()->Void){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let Animator = UIViewPropertyAnimator(duration: 0.25, curve: .easeOut, animations: {
            self.nsTop.constant = topPadding + 150
            self.backView.alpha = 0
            self.whiteView.alpha = 0
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                completion()
            }
        }
    }
    
}
