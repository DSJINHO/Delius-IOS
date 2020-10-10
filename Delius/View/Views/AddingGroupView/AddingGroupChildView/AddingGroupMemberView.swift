//
//  AddingGroupMemberView.swift
//  Delius
//
//  Created by 박진호 on 2020/06/14.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class AddingGroupMemberView:UIView{
    let titleView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let titleImgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "AddGroupIcon2")
        v.contentMode = .scaleAspectFit
        return v
    }()
    let completeBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(UIColor.MainGrayColor(), for: .normal)
        b.titleLabel!.font = UIFont.boldSystemFont(ofSize: 17)
        b.contentHorizontalAlignment = .right
        b.setTitle("Complete".localize(), for: .normal)
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
    
    
    let memberLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .left
        l.text = "AddingGroupMemberView101".localize()
        return l
    }()
    let memberSubLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainGrayColor()
        l.font = UIFont.DeliusSystemType1()
        l.textAlignment = .left
        l.text = "AddingGroupMemberView102".localize()
        return l
    }()
    var twoBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.cornerRadius = 20
        b.backgroundColor = UIColor.MainLightGrayColor()
        b.setTitle("2", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel!.font = UIFont.DeliusBoldType1()
        return b
    }()
    var threeBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.cornerRadius = 20
        b.backgroundColor = UIColor.MainLightGrayColor()
        b.setTitle("3", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel!.font = UIFont.DeliusBoldType1()
        return b
    }()
    var fourBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.cornerRadius = 20
        b.backgroundColor = UIColor.MainLightGrayColor()
        b.setTitle("4", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel!.font = UIFont.DeliusBoldType1()
        return b
    }()
    
    var numberLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .left
        l.text = "AddingGroupMemberView201".localize()

        return l
    }()
    var numberSubLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainGrayColor()
        l.font = UIFont.DeliusSystemType1()
        l.textAlignment = .left
        l.text = "AddingGroupMemberView202".localize()
        return l
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
    var phoneView1:groupInvitePhoneView!
    var phoneView2:groupInvitePhoneView!
    var phoneView3:groupInvitePhoneView!
    
    
    var nsLeft:NSLayoutConstraint!
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        phoneView1 = groupInvitePhoneView(frame: CGRect(x:0,y:0,width:frame.width,height:70))
        phoneView2 = groupInvitePhoneView(frame: CGRect(x:0,y:0,width:frame.width,height:70))
        phoneView3 = groupInvitePhoneView(frame: CGRect(x:0,y:0,width:frame.width,height:70))
        
        phoneView1.isHidden = true
        phoneView2.isHidden = true
        phoneView3.isHidden = true
        
        setup(width: frame.width)
    }
    private func setup(width:CGFloat){
        self.addSubview(shadowView)
        shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shadowView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        shadowView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nsLeft = contentView.leftAnchor.constraint(equalTo: leftAnchor,constant: self.frame.width)
        nsLeft.isActive = true
        contentView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        contentView.addSubview(memberLabel)
        memberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        memberLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        memberLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        memberLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        contentView.addSubview(memberSubLabel)
        memberSubLabel.topAnchor.constraint(equalTo: memberLabel.bottomAnchor, constant: 5).isActive = true
        memberSubLabel.leftAnchor.constraint(equalTo: memberLabel.leftAnchor).isActive = true
        memberSubLabel.rightAnchor.constraint(equalTo: memberLabel.rightAnchor).isActive = true
        memberSubLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let btnWidth = ( width - 60  - 30) / 3
        contentView.addSubview(twoBtn)
        twoBtn.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        twoBtn.widthAnchor.constraint(equalToConstant: btnWidth).isActive = true
        twoBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        twoBtn.topAnchor.constraint(equalTo: memberSubLabel.bottomAnchor, constant: 30).isActive = true
        
        contentView.addSubview(threeBtn)
        threeBtn.topAnchor.constraint(equalTo: twoBtn.topAnchor).isActive = true
        threeBtn.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        threeBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        threeBtn.widthAnchor.constraint(equalToConstant: btnWidth).isActive = true
        
        contentView.addSubview(fourBtn)
        fourBtn.topAnchor.constraint(equalTo: twoBtn.topAnchor).isActive = true
        fourBtn.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        fourBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        fourBtn.widthAnchor.constraint(equalToConstant: btnWidth).isActive = true
        
        contentView.addSubview(numberLabel)
        numberLabel.topAnchor.constraint(equalTo: twoBtn.bottomAnchor, constant: 40).isActive = true
        numberLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        numberLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        contentView.addSubview(numberSubLabel)
        numberSubLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 5).isActive = true
        numberSubLabel.leftAnchor.constraint(equalTo: numberLabel.leftAnchor).isActive = true
        numberSubLabel.rightAnchor.constraint(equalTo: numberLabel.rightAnchor).isActive = true
        numberSubLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(phoneView1)
        phoneView1.topAnchor.constraint(equalTo: numberSubLabel.bottomAnchor, constant: 30).isActive = true
        phoneView1.heightAnchor.constraint(equalToConstant: 70).isActive = true
        phoneView1.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        phoneView1.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        contentView.addSubview(phoneView2)
        phoneView2.topAnchor.constraint(equalTo: phoneView1.bottomAnchor, constant: 10).isActive = true
        phoneView2.leftAnchor.constraint(equalTo: phoneView1.leftAnchor).isActive = true
        phoneView2.rightAnchor.constraint(equalTo: phoneView1.rightAnchor).isActive = true
        phoneView2.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        contentView.addSubview(phoneView3)
        phoneView3.topAnchor.constraint(equalTo: phoneView2.bottomAnchor, constant: 10).isActive = true
        phoneView3.leftAnchor.constraint(equalTo: phoneView1.leftAnchor).isActive = true
        phoneView3.rightAnchor.constraint(equalTo: phoneView1.rightAnchor).isActive = true
        phoneView3.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        let window = UIApplication.shared.windows[0]
        let btmPadding = window.safeAreaInsets.bottom
        contentView.addSubview(saveBtn)
        saveBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -btmPadding).isActive = true
        saveBtn.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        saveBtn.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        saveBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        
        
    }
    func openAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.shadowView.alpha = 0.4
            self.nsLeft.constant = 0
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    func closeAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.shadowView.alpha = 0
            self.nsLeft.constant = self.frame.width
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

class groupInvitePhoneView:UIView{
    
    var contactBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(UIColor.MainLightGrayColor(), for: .normal)
        b.titleLabel!.font = UIFont.DeliusBoldType7()
        b.titleLabel!.textAlignment = .right
        return b
    }()
    var localBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(UIColor.MainGrayColor(), for: .normal)
        b.titleLabel!.font = UIFont.DeliusBoldType6()
        b.titleLabel!.textAlignment = .left
        return b
    }()
    let hyperLine:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainGrayColor()
        return v
    }()
    var phoneEdt:UITextField={
        let f = UITextField()
        f.translatesAutoresizingMaskIntoConstraints = false
        f.font = UIFont.DeliusBoldType6()
        f.textColor = UIColor.MainGrayColor()
        return f
    }()
    let phoneLineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.init(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        v.layer.cornerRadius = 1
        return v
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    
    func setup(){
        setText()
        // This values are based on that entire view height is 70
        
        
        self.addSubview(localBtn)
        localBtn.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        //localBtn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        localBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        localBtn.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        
        self.addSubview(phoneEdt)
        phoneEdt.topAnchor.constraint(equalTo: localBtn.topAnchor).isActive = true
        phoneEdt.leftAnchor.constraint(equalTo: centerXAnchor, constant: -80).isActive = true
        phoneEdt.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        phoneEdt.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(hyperLine)
        hyperLine.centerYAnchor.constraint(equalTo: localBtn.centerYAnchor).isActive = true
        hyperLine.widthAnchor.constraint(equalToConstant: 2).isActive = true
        hyperLine.heightAnchor.constraint(equalToConstant: 13).isActive = true
        hyperLine.rightAnchor.constraint(equalTo: phoneEdt.leftAnchor, constant: -20).isActive = true
        
        phoneEdt.addSubview(phoneLineView)
        phoneLineView.bottomAnchor.constraint(equalTo: phoneEdt.bottomAnchor, constant: 1).isActive = true
        phoneLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        phoneLineView.leftAnchor.constraint(equalTo: phoneEdt.leftAnchor).isActive = true
        phoneLineView.rightAnchor.constraint(equalTo: phoneEdt.rightAnchor).isActive = true
        
        self.addSubview(contactBtn)
        contactBtn.topAnchor.constraint(equalTo: phoneLineView.bottomAnchor, constant: 10).isActive = true
        contactBtn.rightAnchor.constraint(equalTo: phoneLineView.rightAnchor).isActive = true
        contactBtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //phoneEdt.addSubview(contactBtnLineView)
        //contactBtnLineView.bottomAnchor.constraint(equalTo: contactBtn.bottomAnchor).isActive = true
        //contactBtnLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        //contactBtnLineView.leftAnchor.constraint(equalTo: contactBtn.leftAnchor).isActive = true
        //contactBtnLineView.rightAnchor.constraint(equalTo: contactBtn.rightAnchor).isActive = true
        
    }
    
    private func setText(){
        //inviteLabel.text = "번호입력"
        localBtn.setTitle("KR 82", for: .normal)
        contactBtn.setTitle("AddingGroupMemberView301".localize(), for: .normal)
       
    }
}
