//
//  SoloMatchView.swift
//  Delius
//
//  Created by user on 2020/08/28.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Group3MatchView:UIView{
    
    var shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainBlackColor()
        v.alpha = 0
        return v
    }()
    var backImgView1:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.alpha = 0
        v.clipsToBounds = true
        return v
    }()
    var backImgView2:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.alpha = 0
        v.clipsToBounds = true
        return v
    }()
    var backImgView3:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.alpha = 0
        return v
    }()
    var tImgView1:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.white
        v.contentMode = .scaleAspectFill
        v.image = UIImage(named: "GroupMatchG")
        v.alpha = 0
        return v
    }()
    var tImgView2:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.white
        v.contentMode = .scaleAspectFill
        v.image = UIImage(named: "GroupMatchR")
        v.alpha = 0
        return v
    }()
    var tImgView3:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.white
        v.contentMode = .scaleAspectFill
        v.image = UIImage(named: "GroupMatchO")
        v.alpha = 0
        return v
    }()
    
    var tImgView4:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.white
        v.contentMode = .scaleAspectFill
        v.image = UIImage(named: "GroupMatchU")
        v.alpha = 0
        return v
    }()
    var tImgView5:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.white
        v.contentMode = .scaleAspectFill
        v.image = UIImage(named: "GroupMatchP")
        v.alpha = 0
        return v
    }()
    var blurView:UIVisualEffectView!
    var bImgView1:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.white
        v.contentMode = .scaleAspectFill
        v.image = UIImage(named: "MatchM")
        v.alpha = 0
        return v
    }()
    var bImgView2:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.white
        v.contentMode = .scaleAspectFill
        v.image = UIImage(named: "MatchA")
        v.alpha = 0
        return v
    }()
    var bImgView3:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.white
        v.contentMode = .scaleAspectFill
        v.image = UIImage(named: "MatchT")
        v.alpha = 0
        return v
    }()
    var bImgView4:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.white
        v.contentMode = .scaleAspectFill
        v.image = UIImage(named: "MatchC")
        v.alpha = 0
        return v
    }()
    var bImgView5:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = UIColor.white
        v.contentMode = .scaleAspectFill
        v.image = UIImage(named: "MatchH")
        v.alpha = 0
        return v
    }()
    let lineView:UIView={
        let v = UIView()
        return v
    }()
    var whiteView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        return v
    }()
    var closeBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("건너뛰기", for: .normal)
        b.setTitleColor(UIColor.lightGray, for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return b
    }()
    
    var nsT1,nsT2,nsT3,nsT4,nsT5:NSLayoutConstraint!
    var nsB1,nsB2,nsB3,nsB4,nsB5:NSLayoutConstraint!
    var nsWhite:NSLayoutConstraint!
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        

        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        blurView = UIVisualEffectView(effect: blurEffect)
        
        
        setup()
    }
    private func setup(){
        let window = UIApplication.shared.windows[0]
        let btmPadding = window.safeAreaInsets.bottom
        
        let height = self.frame.height/3
        self.addSubview(backImgView1)
        backImgView1.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backImgView1.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backImgView1.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backImgView1.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        self.addSubview(backImgView2)
        backImgView2.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        backImgView2.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backImgView2.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backImgView2.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        self.addSubview(backImgView3)
        backImgView3.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backImgView3.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backImgView3.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backImgView3.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        
        
        self.addSubview(shadowView)
        shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shadowView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        shadowView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        blurView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.addSubview(blurView)
        blurView.topAnchor.constraint(equalTo: shadowView.topAnchor).isActive = true
        blurView.leftAnchor.constraint(equalTo: shadowView.leftAnchor).isActive = true
        blurView.rightAnchor.constraint(equalTo: shadowView.rightAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor).isActive = true
        
        self.addSubview(tImgView1)
        tImgView1.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -btmPadding - 180).isActive = true
        tImgView1.widthAnchor.constraint(equalToConstant: 20).isActive = true
        tImgView1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nsT1 = tImgView1.leftAnchor.constraint(equalTo: leftAnchor, constant: 30)
        nsT1.isActive = true
        
        self.addSubview(tImgView2)
        tImgView2.bottomAnchor.constraint(equalTo: tImgView1.bottomAnchor).isActive = true
        tImgView2.widthAnchor.constraint(equalToConstant: 20).isActive = true
        tImgView2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nsT2 = tImgView2.leftAnchor.constraint(equalTo: leftAnchor, constant: 30)
        nsT2.isActive = true
        
        self.addSubview(tImgView3)
        tImgView3.bottomAnchor.constraint(equalTo: tImgView1.bottomAnchor).isActive = true
        tImgView3.widthAnchor.constraint(equalToConstant: 20).isActive = true
        tImgView3.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nsT3 = tImgView3.leftAnchor.constraint(equalTo: leftAnchor, constant: 30)
        nsT3.isActive = true
        
        self.addSubview(tImgView4)
        tImgView4.bottomAnchor.constraint(equalTo: tImgView1.bottomAnchor).isActive = true
        tImgView4.heightAnchor.constraint(equalToConstant: 20).isActive = true
        tImgView4.widthAnchor.constraint(equalToConstant: 20).isActive = true
        nsT4 = tImgView4.leftAnchor.constraint(equalTo: leftAnchor, constant: 30)
        nsT4.isActive = true
        
        self.addSubview(tImgView5)
        tImgView5.topAnchor.constraint(equalTo: tImgView1.topAnchor).isActive = true
        tImgView5.widthAnchor.constraint(equalToConstant: 20).isActive = true
        tImgView5.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nsT5 = tImgView5.leftAnchor.constraint(equalTo: leftAnchor, constant: 30)
        nsT5.isActive = true
        
        self.addSubview(bImgView1)
        bImgView1.topAnchor.constraint(equalTo: tImgView1.bottomAnchor, constant: 20).isActive = true
        bImgView1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        bImgView1.widthAnchor.constraint(equalToConstant: 48).isActive = true
        nsB1 = bImgView1.leftAnchor.constraint(equalTo: leftAnchor, constant: 30)
        nsB1.isActive = true
        
        self.addSubview(bImgView2)
        bImgView2.topAnchor.constraint(equalTo: bImgView1.topAnchor).isActive = true
        bImgView2.widthAnchor.constraint(equalToConstant: 40).isActive = true
        bImgView2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nsB2 = bImgView2.leftAnchor.constraint(equalTo: leftAnchor, constant: 30)
        nsB2.isActive = true
        
        self.addSubview(bImgView3)
        bImgView3.topAnchor.constraint(equalTo: bImgView1.topAnchor).isActive = true
        bImgView3.widthAnchor.constraint(equalToConstant: 30).isActive = true
        bImgView3.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nsB3 = bImgView3.leftAnchor.constraint(equalTo: leftAnchor, constant: 30)
        nsB3.isActive = true
        
        self.addSubview(bImgView4)
        bImgView4.topAnchor.constraint(equalTo: bImgView1.topAnchor).isActive = true
        bImgView4.widthAnchor.constraint(equalToConstant: 38).isActive = true
        bImgView4.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nsB4 = bImgView4.leftAnchor.constraint(equalTo: leftAnchor,constant: 30)
        nsB4.isActive = true
        
        self.addSubview(bImgView5)
        bImgView5.topAnchor.constraint(equalTo: bImgView1.topAnchor).isActive = true
        bImgView5.widthAnchor.constraint(equalToConstant: 36).isActive = true
        bImgView5.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nsB5 = bImgView5.leftAnchor.constraint(equalTo: leftAnchor, constant: 30)
        nsB5.isActive = true
        
        self.addSubview(whiteView)
        nsWhite = whiteView.topAnchor.constraint(equalTo: bottomAnchor)
        nsWhite.isActive = true
        whiteView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        whiteView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: btmPadding + 100).isActive = true
        
        whiteView.addSubview(closeBtn)
        closeBtn.centerYAnchor.constraint(equalTo: whiteView.topAnchor, constant: 40).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeBtn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        closeBtn.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        
    }
    func openAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 1, curve: .easeIn, animations: {
            self.shadowView.alpha = 0.6
            self.backImgView1.alpha = 0.3
            self.backImgView2.alpha = 0.3
            self.backImgView3.alpha = 0.3
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                self.matchAnimation()
            }
        }
    }
    func matchAnimation(){
        let window = UIApplication.shared.windows[0]
        let btmPadding = window.safeAreaInsets.bottom
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.blurView.alpha = 0
            self.backImgView1.alpha = 1
            self.backImgView2.alpha = 1
            self.backImgView3.alpha = 1
            self.nsT5.constant = 30 + 263 * 2 / 5
            self.tImgView5.alpha = 1
            self.nsWhite.constant = -80 - btmPadding
            self.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseOut, animations: {
            self.nsT4.constant = 30 + 199 * 2 / 5
            self.tImgView4.alpha = 1
            self.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.2, delay: 0.2, options: .curveEaseOut, animations: {
            self.nsT3.constant = 30 + 131 * 2 / 5
            self.tImgView3.alpha = 1
            self.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.2, delay: 0.3, options: .curveEaseOut, animations: {
            self.nsT2.constant = 30 + 66 * 2 / 5
            self.tImgView2.alpha = 1
            self.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.2, delay: 0.4, options: .curveEaseOut, animations: {
            self.nsT1.constant = 30
            self.tImgView1.alpha = 1
            self.layoutIfNeeded()
        })
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.nsB5.constant = 30 + 235 * 2 / 3
            self.bImgView5.alpha = 1
            self.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseOut, animations: {
            self.nsB4.constant = 30 + 178 * 2 / 3
            self.bImgView4.alpha = 1
            self.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.2, delay: 0.2, options: .curveEaseOut, animations: {
            self.nsB3.constant = 30 + 126 * 2 / 3
            self.bImgView3.alpha = 1
            self.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.2, delay: 0.3, options: .curveEaseOut, animations: {
            self.nsB2.constant = 30 + 48
            self.bImgView2.alpha = 1
            self.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.2, delay: 0.4, options: .curveEaseOut, animations: {
            self.nsB1.constant = 30
            self.bImgView1.alpha = 1
            self.layoutIfNeeded()
        })
    }
    func closeAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.shadowView.alpha = 0
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                completion()
            }
        }
    }
}

