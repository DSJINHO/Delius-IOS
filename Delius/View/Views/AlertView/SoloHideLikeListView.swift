//
//  SoloHideLikeListView.swift
//  Delius
//
//  Created by user on 2020/08/27.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SoloHideLikeListView:UIView{
    var shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainBlackColor()
        v.alpha = 0
        return v
    }()
    var whiteView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.alpha = 0
        v.layer.cornerRadius = 15
        v.clipsToBounds = true
        return v
    }()
    var gradationView:MainGradientView!
    let circleView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.borderWidth = 1
        v.layer.cornerRadius = 40
        return v
    }()
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 38
        v.image = UIImage(named: "model1")
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        return v
    }()
    let nameView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 5
        v.clipsToBounds = true
        v.backgroundColor = UIColor.white
        return v
    }()
    let likeBackView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 13
        return v
    }()
    let likeImgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "LockLike")
        return v
    }()
    
    let titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.boldSystemFont(ofSize: 20)
        l.textAlignment = .center
        l.text = "나를 좋아한 사람보기"
        return l
    }()
    let subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.lightGray
        l.font = UIFont.systemFont(ofSize: 14)
        l.textAlignment = .center
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.text = "'딜리어스 플러스'회원으로 업그레이드하고 나를 좋아한 사람들을 보세요"
        return l
    }()
    let purchaseBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = UIColor.MainColor()
        b.setTitle("딜리어스 플러스", for: .normal)
        b.setTitleColor(UIColor.white, for: .normal)
        return b
    }()
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.lightGray
        return v
    }()
    var closeBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(UIColor.MainBlackColor(), for: .normal)
        b.setTitle("닫기", for: .normal)
        b.titleLabel?.font = UIFont.DeliusBoldType1()
        return b
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
        nsCenter = whiteView.centerYAnchor.constraint(equalTo: centerYAnchor)
        nsCenter.isActive = true
        whiteView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        whiteView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        
        gradationView = MainGradientView(frame: CGRect(x: 0, y: 0, width: 100, height: 140))
        gradationView.layer.cornerRadius = 8
        gradationView.clipsToBounds = true
        whiteView.addSubview(gradationView)
        gradationView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 30).isActive = true
        gradationView.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        gradationView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        gradationView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        gradationView.addSubview(circleView)
        circleView.topAnchor.constraint(equalTo: gradationView.topAnchor, constant: 10).isActive = true
        circleView.leftAnchor.constraint(equalTo: gradationView.leftAnchor, constant: 10).isActive = true
        circleView.rightAnchor.constraint(equalTo: gradationView.rightAnchor, constant: -10).isActive = true
        circleView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        circleView.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: circleView.topAnchor, constant: 2).isActive = true
        imgView.leftAnchor.constraint(equalTo: circleView.leftAnchor, constant: 2).isActive = true
        imgView.rightAnchor.constraint(equalTo: circleView.rightAnchor, constant: -2).isActive = true
        imgView.bottomAnchor.constraint(equalTo: circleView.bottomAnchor, constant: -2).isActive = true
        

        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let bView = UIVisualEffectView(effect: blurEffect)
        bView.translatesAutoresizingMaskIntoConstraints = false
        self.imgView.addSubview(bView)
        bView.topAnchor.constraint(equalTo: imgView.topAnchor).isActive = true
        bView.leftAnchor.constraint(equalTo: imgView.leftAnchor).isActive = true
        bView.rightAnchor.constraint(equalTo: imgView.rightAnchor).isActive = true
        bView.bottomAnchor.constraint(equalTo: imgView.bottomAnchor).isActive = true
        
        gradationView.addSubview(likeBackView)
        likeBackView.bottomAnchor.constraint(equalTo: circleView.bottomAnchor).isActive = true
        likeBackView.rightAnchor.constraint(equalTo: circleView.rightAnchor).isActive = true
        likeBackView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        likeBackView.widthAnchor.constraint(equalToConstant: 26).isActive = true
        
        likeBackView.addSubview(likeImgView)
        likeImgView.centerXAnchor.constraint(equalTo: likeBackView.centerXAnchor).isActive = true
        likeImgView.centerYAnchor.constraint(equalTo: likeBackView.centerYAnchor).isActive = true
        likeImgView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        likeImgView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        gradationView.addSubview(nameView)
        nameView.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 10).isActive = true
        nameView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        nameView.centerXAnchor.constraint(equalTo: gradationView.centerXAnchor).isActive = true
        nameView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        whiteView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: gradationView.bottomAnchor, constant: 30).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        whiteView.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        subLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        whiteView.addSubview(purchaseBtn)
        purchaseBtn.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 20).isActive = true
        purchaseBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 30).isActive = true
        purchaseBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -30).isActive = true
        purchaseBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        whiteView.addSubview(lineView)
        lineView.topAnchor.constraint(equalTo: purchaseBtn.bottomAnchor, constant: 20).isActive = true
        lineView.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        lineView.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        whiteView.addSubview(closeBtn)
        closeBtn.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 10).isActive = true
        closeBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        closeBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        whiteView.bottomAnchor.constraint(equalTo: closeBtn.bottomAnchor, constant: 10).isActive = true
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
