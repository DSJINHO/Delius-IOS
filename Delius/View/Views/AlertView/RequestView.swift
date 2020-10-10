//
//  RequestView.swift
//  Delius
//
//  Created by user on 2020/10/05.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class RequestView:UIView{
    var backView:UIView={
        let v = UIView()
        return v
    }()
    private let imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "c")
        v.contentMode = .scaleAspectFit
        v.tintColor = UIColor.MainColor()
        return v
    }()
    private let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainColor()
        return v
    }()
    private let titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.blackType1()
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .center
        l.text = "프로필 심사중"
        return l
    }()
    private let subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.blackType3()
        l.font = UIFont.DeliusSystemType1()
        l.textAlignment = .center
        l.text = "회원님의 프로필을 심사중입니다\n심사는 상황에 따라 다소 시간이 걸립니다"
        return l
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
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        subLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        self.addSubview(lineView)
        lineView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -30).isActive = true
        lineView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        lineView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(imgView)
        imgView.bottomAnchor.constraint(equalTo: lineView.topAnchor, constant: -20).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imgView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func openAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn, animations: {
            self.alpha = 1
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    func closeAnimation(completion:@escaping()->Void={}){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.alpha = 0
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
