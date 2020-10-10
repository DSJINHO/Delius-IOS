//
//  ErrorAlertView.swift
//  Delius
//
//  Created by user on 2020/09/24.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class ErrorAlertView:UIView{
    var shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.black
        v.alpha = 0
        return v
    }()
    var whiteView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 25
        v.clipsToBounds = true
        return v
    }()
    var titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.blackType1()
        l.textAlignment = .center
        l.font = UIFont.boldSystemFont(ofSize: 13)
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        return l
    }()
    var completeBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = UIColor.MainColor()
        b.setTitle("OK", for: .normal)
        b.setTitleColor(UIColor.white, for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        b.layer.cornerRadius = 25
        return b
    }()
    
    var nsCenter:NSLayoutConstraint!
    
    required init?(coder:NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
    }
    private func setup(){
        self.addSubview(shadowView)
        shadowView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        shadowView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        shadowView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.addSubview(whiteView)
        nsCenter = whiteView.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -100)
        nsCenter.isActive = true
        whiteView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        whiteView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        whiteView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: whiteView.topAnchor,constant: 30).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor,constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor,constant: -20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        whiteView.addSubview(completeBtn)
        completeBtn.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
        completeBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 30).isActive = true
        completeBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -30).isActive = true
        completeBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        whiteView.bottomAnchor.constraint(equalTo: completeBtn.bottomAnchor, constant: 20).isActive = true
        
    }
    func openAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.nsCenter.constant = 0
            self.shadowView.alpha = 0.4
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    func closeAnimation(completion:@escaping()->Void={}){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.nsCenter.constant = 100
            self.shadowView.alpha = 0
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
