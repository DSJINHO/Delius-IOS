//
//  EditUserProfileView.swift
//  Delius
//
//  Created by 박진호 on 2020/07/07.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class EditUserProfileView:UIView{
    var gradationView:MainGradientView!
    let topView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainColor()
        return v
    }()
    var shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.gray
        v.alpha = 0
        return v
    }()
    var backBtn:IconButton1!
    let titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.font = UIFont.DeliusBoldType2()
        l.textAlignment = .center
        return l
    }()
    var completeBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Complete".localize(), for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.contentHorizontalAlignment = .center
        b.titleLabel?.font = UIFont.DeliusBoldType2()
        return b
    }()
    
    var scrollView:UIScrollView={
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var imgView:ProfileEditImagesView!
    var statusView:ProfileEditStringView!
    var jobView:ProfileEditStringView!
    var info1View:ProfileEditInfoView!
    var info2View:ProfileEditInfoView!
    var info3View:ProfileEditInfoView!
    var info4View:ProfileEditInfoView!
    var extraView:ProfileEditStringView!
    
    var info1BtmView:ProfileInfoBottomView!
    var info2BtmView:ProfileInfoBottomView!
    var info3BtmView:ProfileInfoBottomView!
    var info4BtmView:ProfileInfoBottomView!
    
    var nsInfo1,nsInfo2,nsInfo3,nsInfo4:NSLayoutConstraint!
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    init(frame:CGRect,x:String){
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        backBtn = IconButton1(imgName: "LeftArrow", color: .white, frame: CGRect(x:0,y:0,width:30,height: 30))
        
        let subFrame = CGRect(x:0,y:0,width:frame.width,height:90)
        let btmFrame = CGRect(x:0,y:0,width:frame.width,height:250)
        imgView = ProfileEditImagesView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.width/2))
        statusView = ProfileEditStringView(txt:"상태메시지",frame: subFrame)
        jobView = ProfileEditStringView(txt:"직업",frame: subFrame)
        info1View = ProfileEditInfoView(txt:"매력",frame: subFrame)
        info2View = ProfileEditInfoView(txt:"관심사",frame: subFrame)
        info3View = ProfileEditInfoView(txt:"이상형",frame: subFrame)
        info4View = ProfileEditInfoView(txt:"연애",frame: subFrame)
        extraView = ProfileEditStringView(txt:"소개",frame: subFrame)
        
        info1BtmView = ProfileInfoBottomView(type: 0, frame: btmFrame)
        info2BtmView = ProfileInfoBottomView(type: 1, frame: btmFrame)
        info3BtmView = ProfileInfoBottomView(type: 2, frame: btmFrame)
        info4BtmView = ProfileInfoBottomView(type: 3, frame: btmFrame)
        
        setup(width:frame.width)
        
        
    }
    private func setup(width:CGFloat){
        
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        
        self.addSubview(topView)
        topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 60 + topPadding).isActive = true
        
        gradationView = MainGradientView(frame: CGRect(x:0,y:0,width:frame.width,height: topPadding + 60))
        topView.addSubview(gradationView)
        gradationView.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        gradationView.leftAnchor.constraint(equalTo: topView.leftAnchor).isActive = true
        gradationView.rightAnchor.constraint(equalTo: topView.rightAnchor).isActive = true
        gradationView.bottomAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        
        topView.addSubview(backBtn)
        backBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backBtn.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 25).isActive = true
        backBtn.centerYAnchor.constraint(equalTo: topView.bottomAnchor, constant: -30).isActive = true
        
        
        topView.addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: topView.bottomAnchor, constant: -30).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        
        topView.addSubview(completeBtn)
        completeBtn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        completeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        completeBtn.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -20).isActive = true
        completeBtn.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor).isActive = true
        
        
        let frameHeight : CGFloat = 90
        
        scrollView.contentSize = CGSize(width: 0, height: frameHeight*9 + 100 + frame.width/2)
        self.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        scrollView.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        imgView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: width/2).isActive = true
        scrollView.addSubview(statusView)
        statusView.topAnchor.constraint(equalTo: imgView.bottomAnchor).isActive = true
        statusView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        statusView.widthAnchor.constraint(equalToConstant:  width).isActive = true
        statusView.heightAnchor.constraint(equalToConstant: frameHeight).isActive = true
        scrollView.addSubview(jobView)
        jobView.topAnchor.constraint(equalTo: statusView.bottomAnchor).isActive = true
        jobView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        jobView.widthAnchor.constraint(equalToConstant: width).isActive = true
        jobView.heightAnchor.constraint(equalToConstant: frameHeight).isActive = true
        scrollView.addSubview(info1View)
        info1View.topAnchor.constraint(equalTo: jobView.bottomAnchor).isActive = true
        info1View.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        info1View.widthAnchor.constraint(equalToConstant: width).isActive = true
        info1View.heightAnchor.constraint(equalToConstant: frameHeight).isActive = true
        scrollView.addSubview(info2View)
        info2View.topAnchor.constraint(equalTo: info1View.bottomAnchor).isActive = true
        info2View.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        info2View.widthAnchor.constraint(equalToConstant: width).isActive = true
        info2View.heightAnchor.constraint(equalToConstant: frameHeight).isActive = true
        scrollView.addSubview(info3View)
        info3View.topAnchor.constraint(equalTo: info2View.bottomAnchor).isActive = true
        info3View.widthAnchor.constraint(equalToConstant: width).isActive = true
        info3View.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        info3View.heightAnchor.constraint(equalToConstant: frameHeight).isActive = true
        scrollView.addSubview(info4View)
        info4View.topAnchor.constraint(equalTo: info3View.bottomAnchor).isActive = true
        info4View.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        info4View.widthAnchor.constraint(equalToConstant: width).isActive = true
        info4View.heightAnchor.constraint(equalToConstant: frameHeight).isActive = true
        scrollView.addSubview(extraView)
        extraView.topAnchor.constraint(equalTo: info4View.bottomAnchor).isActive = true
        extraView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        extraView.widthAnchor.constraint(equalToConstant: width).isActive = true
        extraView.heightAnchor.constraint(equalToConstant: frameHeight).isActive = true
        
        let btmHeight : CGFloat = 250
        
        self.addSubview(shadowView)
        shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shadowView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        shadowView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(info1BtmView)
        info1BtmView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        info1BtmView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        info1BtmView.heightAnchor.constraint(equalToConstant: btmHeight).isActive = true
        nsInfo1 = info1BtmView.topAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        nsInfo1.isActive = true
        
        self.addSubview(info2BtmView)
        nsInfo2 = info2BtmView.topAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        nsInfo2.isActive = true
        info2BtmView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        info2BtmView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        info2BtmView.heightAnchor.constraint(equalToConstant: btmHeight).isActive = true
        
        self.addSubview(info3BtmView)
        info3BtmView.heightAnchor.constraint(equalToConstant: btmHeight).isActive = true
        info3BtmView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        info3BtmView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        nsInfo3 = info3BtmView.topAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        nsInfo3.isActive = true
        
        self.addSubview(info4BtmView)
        nsInfo4 = info4BtmView.topAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        nsInfo4.isActive = true
        info4BtmView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        info4BtmView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        info4BtmView.heightAnchor.constraint(equalToConstant: btmHeight).isActive = true
        
        
        
        
        titleLabel.text = "프로필 수정"
    }
    
    
    func info1ViewAnimation(reverse:Bool,completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            if reverse{
                self.shadowView.alpha = 0
                self.nsInfo1.constant = 0
            }else{
                self.shadowView.alpha = 0.4
                self.nsInfo1.constant = -250
            }
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                completion()
            }
        }
        
    }
    func info2ViewAnimation(reverse:Bool,completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            if reverse{
                self.shadowView.alpha = 0
                self.nsInfo2.constant = 0
            }else{
                self.shadowView.alpha = 0.4
                self.nsInfo2.constant = -250
            }
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                completion()
            }
        }
        
    }
    func info3ViewAnimation(reverse:Bool,completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            if reverse{
                self.shadowView.alpha = 0
                self.nsInfo3.constant = 0
            }else{
                self.shadowView.alpha = 0.4
                self.nsInfo3.constant = -250
            }
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                completion()
            }
        }
        
    }
    func info4ViewAnimation(reverse:Bool,completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            if reverse{
                self.shadowView.alpha = 0
                self.nsInfo4.constant = 0
            }else{
                self.shadowView.alpha = 0.4
                self.nsInfo4.constant = -250
            }
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
