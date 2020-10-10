//
//  ExitGroupAlertView.swift
//  Delius
//
//  Created by user on 2020/08/26.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class ExitGroupAlertView:UIView{
    
    var shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.black
        v.alpha = 0
        return v
    }()
    
    let whiteView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 15
        v.clipsToBounds = true
        v.alpha = 0
        return v
    }()
    let imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "Exit")
        return v
    }()
    let titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.boldSystemFont(ofSize: 20)
        l.textAlignment = .center
        l.text = "그룹방 나가기"
        return l
    }()
    let subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.font = UIFont.systemFont(ofSize: 13)
        l.textAlignment = .center
        l.text = "해당 그룹에서 나가시겠습니까?"
        return l
    }()
    let btmLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor3()
        l.font = UIFont.systemFont(ofSize: 12)
        l.textAlignment = .center
        l.text = "수락시 그룹에 다시 참여할 수 없습니다"
        return l
    }()
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.lightGray
        return v
    }()
    var okBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setImage(UIImage(named: "okBtn"), for: .normal)
        b.imageView?.contentMode = .scaleAspectFit
        b.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return b
    }()
    var xBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setImage(UIImage(named: "xBtn"), for: .normal)
        b.imageView?.contentMode = .scaleAspectFit
        b.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return b
    }()
    
    var nsCenter:NSLayoutConstraint!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    
    private func setup(){
        self.addSubview(shadowView)
        shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        shadowView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        shadowView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        self.addSubview(whiteView)
        whiteView.heightAnchor.constraint(equalToConstant: 310).isActive = true
        nsCenter = whiteView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 200)
        nsCenter.isActive = true
        whiteView.leftAnchor.constraint(equalTo: leftAnchor,constant: 40).isActive = true
        whiteView.rightAnchor.constraint(equalTo: rightAnchor,constant: -40).isActive = true
        
        whiteView.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 30).isActive = true
        imgView.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        whiteView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 30).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        whiteView.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 10).isActive = true
        subLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -10).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        whiteView.addSubview(okBtn)
        okBtn.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor,constant: -10).isActive = true
        okBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        okBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        okBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 20).isActive = true
        
        whiteView.addSubview(xBtn)
        xBtn.topAnchor.constraint(equalTo: okBtn.topAnchor).isActive = true
        xBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -20).isActive = true
        xBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        xBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        whiteView.addSubview(lineView)
        lineView.bottomAnchor.constraint(equalTo: okBtn.topAnchor, constant: -10).isActive = true
        lineView.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        lineView.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        whiteView.addSubview(btmLabel)
        btmLabel.bottomAnchor.constraint(equalTo: lineView.topAnchor, constant: -10).isActive = true
        btmLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        btmLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        btmLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        
        // h  250
        
        
    }
    func openAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.nsCenter.constant = 0
            self.whiteView.alpha = 5
            self.shadowView.alpha = 0.3
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    func closeAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.nsCenter.constant = 200
            self.whiteView.alpha = -1
            self.shadowView.alpha = -1
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
