//
//  BlockedUserView.swift
//  Delius
//
//  Created by user on 2020/10/05.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SuspendUserView:UIView{
    
    private let imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "c")
        v.contentMode = .scaleAspectFit
        v.tintColor = UIColor.MainColor()
        return v
    }()
    private let titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.blackType1()
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .center
        l.text = "이용중지 상태입니다"
        return l
    }()
    private let subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.blackType3()
        l.font = UIFont.DeliusSystemType1()
        l.textAlignment = .center
        l.text = "현재 이용을 중지한 상태입니다"
        l.numberOfLines = 2
        l.lineBreakMode = .byWordWrapping
        return l
    }()
    var requestBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = UIColor.MainColor()
        b.setTitle("프로필 수정하기", for: .normal)
        b.setTitleColor(UIColor.white, for: .normal)
        return b
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setup()
    }
    private func setup(){
        let window = UIApplication.shared.windows[0]
        let btmPadding = window.safeAreaInsets.bottom
        
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(imgView)
        imgView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imgView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -30).isActive = true
        imgView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        self.addSubview(requestBtn)
        requestBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -btmPadding - 20).isActive = true
        requestBtn.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 30).isActive = true
        requestBtn.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -30).isActive = true
        requestBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
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
