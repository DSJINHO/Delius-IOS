//
//  GroupWaitingView.swift
//  Delius
//
//  Created by user on 2020/08/07.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class GroupWaitingView:UIView{
    
    var shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.gray
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
    var label:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.black
        l.textAlignment = .center
        l.font = UIFont.DeliusBoldType1()
        l.text = "초대 기다리는 중"
        return l
    }()
    var nsCenter:NSLayoutConstraint!
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    private func setup(){
        self.addSubview(shadowView)
        shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shadowView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        shadowView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(whiteView)
        nsCenter = whiteView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        nsCenter.isActive = true
        whiteView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        whiteView.rightAnchor.constraint(equalTo: rightAnchor,constant: -40).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        whiteView.addSubview(label)
        label.topAnchor.constraint(equalTo: whiteView.topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
    }
    func OpenAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.nsCenter.constant = -100
            self.whiteView.alpha = 1
            self.shadowView.alpha = 0.4
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        
        
    }
    func CloseAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.nsCenter.constant = 0
            self.whiteView.alpha = 0
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
