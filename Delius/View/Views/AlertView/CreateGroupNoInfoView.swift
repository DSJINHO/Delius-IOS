//
//  CreateGroupNoInfoView.swift
//  Delius
//
//  Created by user on 2020/09/11.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class CreateGroupNoInfoView:UIView{
    
    var shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.blackType1()
        v.alpha = 0
        return v
    }()
    var whiteView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 15
        v.alpha = 0
        return v
    }()
    var titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.blackType1()
        l.font = UIFont.boldSystemFont(ofSize: 13)
        l.textAlignment = .center
        l.text = "CreateGroupNoInfo001".localize()
        return l
    }()
    var closeBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("CloseBtn".localize(), for: .normal)
        b.setTitleColor(UIColor.blackType3(), for: .normal)
        b.titleLabel?.font = UIFont.DeliusBoldType2()
        return b
    }()
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.grayType3()
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
        
        self.addSubview(shadowView)
        shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shadowView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        shadowView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(whiteView)
        whiteView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        whiteView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        whiteView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        whiteView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 30).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -30).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        whiteView.addSubview(closeBtn)
        closeBtn.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor).isActive = true
        closeBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        closeBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        whiteView.addSubview(lineView)
        lineView.bottomAnchor.constraint(equalTo: closeBtn.topAnchor).isActive = true
        lineView.leftAnchor.constraint(lessThanOrEqualTo: whiteView.leftAnchor).isActive = true
        lineView.rightAnchor.constraint(lessThanOrEqualTo: whiteView.rightAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
    }
    
    func openAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.shadowView.alpha = 0.4
            self.whiteView.alpha = 2
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    func closeAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.shadowView.alpha = 0
            self.whiteView.alpha = -2
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
