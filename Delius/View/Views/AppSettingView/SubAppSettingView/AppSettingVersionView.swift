//
//  AppSettingVersionView.swift
//  Delius
//
//  Created by user on 2020/07/21.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class AppSettingVersionView:UIView{
    
    var backView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.gray
        v.alpha = 0
        return v
    }()
    var iconView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 15
        v.clipsToBounds = true
        return v
    }()
    let iconImgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "DeliusIcon")
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    var versionLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.font = UIFont.DeliusBoldType2()
        l.textAlignment = .center
        return l
    }()
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        
    }
    
    var nsTop1:NSLayoutConstraint!
    var nsTop2:NSLayoutConstraint!
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        setup()
    }
    
    private func setup(){
        
        versionLabel.text = "Ver 1.0.0"
        self.addSubview(backView)
        backView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(iconView)
        iconView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        nsTop1 = iconView.centerYAnchor.constraint(equalTo: centerYAnchor,constant: 0)
        nsTop1.isActive = true
        
        iconView.addSubview(iconImgView)
        iconImgView.topAnchor.constraint(equalTo: iconView.topAnchor, constant: 15).isActive = true
        iconImgView.leftAnchor.constraint(equalTo: iconView.leftAnchor, constant: 15).isActive = true
        iconImgView.rightAnchor.constraint(equalTo: iconView.rightAnchor, constant: -15).isActive = true
        iconImgView.bottomAnchor.constraint(equalTo: iconView.bottomAnchor, constant: -15).isActive = true
        
        self.addSubview(versionLabel)
        nsTop2 = versionLabel.topAnchor.constraint(equalTo: iconImgView.bottomAnchor, constant: 50)
        nsTop2.isActive = true
        versionLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        versionLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        versionLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        
    }
    func openAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.nsTop1.constant = -40
            self.nsTop2.constant = 20
            self.backView.alpha = 0.7
            self.iconView.alpha = 3
            self.versionLabel.alpha = 3
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    func closeAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.nsTop1.constant = 50
            self.nsTop2.constant = 50
            self.backView.alpha = 0
            self.iconView.alpha = 0
            self.versionLabel.alpha = 0
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
