//
//  AddingGroupExtreView.swift
//  Delius
//
//  Created by 박진호 on 2020/06/15.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class AddingGroupExtraView:UIView{
    
    let titleView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let titleImgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "AddGroupIcon6")
        v.contentMode = .scaleAspectFit
        return v
    }()
    var completeBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Complete".localize(), for: .normal)
        b.setTitleColor(UIColor.MainBlackColor1(), for: .normal)
        b.titleLabel!.font = UIFont.DeliusBoldType1()
        b.contentHorizontalAlignment = .right
        return b
    }()
    var shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.blackType1()
        v.alpha = 0
        return v
    }()
    let contentView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        return v
    }()
    let extraLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor1()
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .left
        l.text = "AddingGroupExtraView101".localize()
        return l
    }()
    let subExtraLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor1()
        l.font = UIFont.DeliusSystemType1()
        l.textAlignment = .left
        l.text = "AddingGroupExtraView102".localize()
        return l
    }()
    var extraEdt:UITextField={
        let f = UITextField()
        f.translatesAutoresizingMaskIntoConstraints = false
        f.textColor = UIColor.MainBlackColor1()
        f.textAlignment = .left
        f.font = UIFont.DeliusBoldType1()
        return f
    }()
    let extraByteLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor1()
        l.font = UIFont.DeliusSystemType1()
        l.textAlignment = .right
        l.text = "0/20"
        return l
    }()
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainBlackColor1()
        return v
    }()
    var saveBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = UIColor.MainColor()
        b.setTitle("Complete".localize(), for: .normal)
        b.setTitleColor(UIColor.white, for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return b
    }()
    
    var nsLeft:NSLayoutConstraint!
    var nsBtm:NSLayoutConstraint!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    private func setup(){
        
        self.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nsLeft = contentView.leftAnchor.constraint(equalTo: leftAnchor, constant: self.frame.width)
        nsLeft.isActive = true
        contentView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        contentView.addSubview(extraLabel)
        extraLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10).isActive = true
        extraLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        extraLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        extraLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        contentView.addSubview(subExtraLabel)
        subExtraLabel.topAnchor.constraint(equalTo: extraLabel.bottomAnchor, constant: 5).isActive = true
        subExtraLabel.leftAnchor.constraint(equalTo: extraLabel.leftAnchor).isActive = true
        subExtraLabel.rightAnchor.constraint(equalTo: extraLabel.rightAnchor).isActive = true
        subExtraLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(extraEdt)
        extraEdt.topAnchor.constraint(equalTo: subExtraLabel.bottomAnchor, constant: 30).isActive = true
        extraEdt.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 30).isActive = true
        extraEdt.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        extraEdt.bottomAnchor.constraint(equalTo: extraEdt.topAnchor, constant: 30).isActive = true
        
        contentView.addSubview(extraByteLabel)
        extraByteLabel.topAnchor.constraint(equalTo: extraEdt.bottomAnchor, constant: 20).isActive = true
        extraByteLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        extraByteLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        extraByteLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(lineView)
        lineView.topAnchor.constraint(equalTo: extraEdt.bottomAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: extraEdt.leftAnchor).isActive = true
        lineView.rightAnchor.constraint(equalTo: extraEdt.rightAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        let window = UIApplication.shared.windows[0]
        let btmPadding = window.safeAreaInsets.bottom
        contentView.addSubview(saveBtn)
        saveBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        saveBtn.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        saveBtn.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        nsBtm = saveBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -btmPadding)
        nsBtm.isActive = true
        
        
    }
    func openAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.nsLeft.constant = 0
            self.shadowView.alpha = 0.4
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    func closeAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.nsLeft.constant = self.frame.width
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
