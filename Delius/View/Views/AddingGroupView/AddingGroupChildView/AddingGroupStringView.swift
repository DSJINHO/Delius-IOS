//
//  AddingGroupStringView.swift
//  Delius
//
//  Created by 박진호 on 2020/06/14.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class AddingGroupStringView:UIView{
    let titleView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let titleImgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "AddGroupIcon1")
        v.contentMode = .scaleAspectFit
        return v
    }()
    var completeBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Complete".localize(), for: .normal)
        b.setTitleColor(UIColor.MainGrayColor(), for: .normal)
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
    let nameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .left
        l.text = "AddingGroupStringView101".localize()
        return l
    }()
    let subNameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor1()
        l.font = UIFont.DeliusSystemType1()
        l.textAlignment = .left
        l.text = "AddingGroupStringView102".localize()
        return l
    }()
    var nameEdt:UITextField={
        let f = UITextField()
        f.translatesAutoresizingMaskIntoConstraints = false
        f.textColor = UIColor.MainBlackColor1()
        f.textAlignment = .left
        f.font = UIFont.DeliusBoldType1()
        return f
    }()
    let nameByteLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor1()
        l.font = UIFont.DeliusSystemType1()
        l.textAlignment = .right
        l.text = "0/20"
        return l
    }()
    
    let statusLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .left
        l.text = "AddingGroupStringView201".localize()
        return l
    }()
    let subStatusLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainGrayColor()
        l.font = UIFont.DeliusSystemType1()
        l.textAlignment = .left
        l.text = "AddingGroupStringView202".localize()
        return l
    }()
    var statusEdt:UITextField={
        let f = UITextField()
        f.translatesAutoresizingMaskIntoConstraints = false
        f.textColor = UIColor.MainBlackColor1()
        f.textAlignment = .left
        f.font = UIFont.DeliusBoldType1()
        return f
    }()
    let statusByteLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor1()
        l.font = UIFont.DeliusSystemType1()
        l.textAlignment = .right
        l.text = "0/40"
        return l
    }()
    
    
    let lineView1:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainBlackColor3()
        return v
    }()
    let lineView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainBlackColor3()
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
    
    
    var errorLabel1:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.red
        l.font = UIFont.systemFont(ofSize: 11)
        l.textAlignment = .left
        l.isHidden = true
        l.text = "CreateGroupStringError1".localize()
        return l
    }()
    var errorLabel2:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.red
        l.font = UIFont.systemFont(ofSize: 11)
        l.textAlignment = .left
        l.isHidden = true
        l.text = "CreateGroupStringError2".localize()
        return l
    }()
    var nsLeft:NSLayoutConstraint!
    var nsBtm:NSLayoutConstraint!
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame: CGRect) {
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
        
        self.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nsLeft = contentView.leftAnchor.constraint(equalTo: leftAnchor, constant: self.frame.width)
        nsLeft.isActive = true
        contentView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        contentView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        contentView.addSubview(subNameLabel)
        subNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        subNameLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        subNameLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        subNameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        contentView.addSubview(nameEdt)
        nameEdt.topAnchor.constraint(equalTo: subNameLabel.bottomAnchor, constant: 20).isActive = true
        nameEdt.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        nameEdt.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        nameEdt.bottomAnchor.constraint(equalTo: nameEdt.topAnchor, constant: 30).isActive = true
        
        contentView.addSubview(nameByteLabel)
        nameByteLabel.topAnchor.constraint(equalTo: nameEdt.bottomAnchor, constant: 10).isActive = true
        nameByteLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        nameByteLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        nameByteLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(errorLabel1)
        errorLabel1.centerYAnchor.constraint(equalTo: nameByteLabel.centerYAnchor).isActive = true
        errorLabel1.leftAnchor.constraint(equalTo: nameEdt.leftAnchor).isActive = true
        errorLabel1.rightAnchor.constraint(equalTo: nameByteLabel.leftAnchor,constant: -10).isActive = true
        errorLabel1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(statusLabel)
        statusLabel.topAnchor.constraint(equalTo: nameByteLabel.bottomAnchor, constant: 30).isActive = true
        statusLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        statusLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        contentView.addSubview(subStatusLabel)
        subStatusLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 5).isActive = true
        subStatusLabel.leftAnchor.constraint(equalTo: statusLabel.leftAnchor).isActive = true
        subStatusLabel.rightAnchor.constraint(equalTo: statusLabel.rightAnchor).isActive = true
        subStatusLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(statusEdt)
        statusEdt.topAnchor.constraint(equalTo: subStatusLabel.bottomAnchor,constant: 20).isActive = true
        statusEdt.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        statusEdt.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        statusEdt.bottomAnchor.constraint(equalTo: statusEdt.topAnchor, constant: 30).isActive = true
        
        contentView.addSubview(statusByteLabel)
        statusByteLabel.topAnchor.constraint(equalTo: statusEdt.bottomAnchor, constant: 10).isActive = true
        statusByteLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        statusByteLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        statusByteLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(errorLabel2)
        errorLabel2.centerYAnchor.constraint(equalTo: statusByteLabel.centerYAnchor).isActive = true
        errorLabel2.leftAnchor.constraint(equalTo: statusEdt.leftAnchor).isActive = true
        errorLabel2.rightAnchor.constraint(equalTo: statusByteLabel.leftAnchor,constant: -10).isActive = true
        errorLabel2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        contentView.addSubview(lineView1)
        lineView1.topAnchor.constraint(equalTo: nameEdt.bottomAnchor).isActive = true
        lineView1.leftAnchor.constraint(equalTo: nameEdt.leftAnchor).isActive = true
        lineView1.rightAnchor.constraint(equalTo: nameEdt.rightAnchor).isActive = true
        lineView1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        contentView.addSubview(lineView2)
        lineView2.topAnchor.constraint(equalTo: statusEdt.bottomAnchor).isActive = true
        lineView2.leftAnchor.constraint(equalTo: statusEdt.leftAnchor).isActive = true
        lineView2.rightAnchor.constraint(equalTo: statusEdt.rightAnchor).isActive = true
        lineView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        let window = UIApplication.shared.windows[0]
        let btmPadding = window.safeAreaInsets.bottom
        contentView.addSubview(saveBtn)
        nsBtm = saveBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -btmPadding - 30)
        nsBtm.isActive = true
        saveBtn.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        saveBtn.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        saveBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
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
