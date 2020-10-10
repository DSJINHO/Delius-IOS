//
//  AppSettingView.swift
//  Delius
//
//  Created by user on 2020/07/18.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class AppSettingView:UIView{
    
    var gradientView:MainGradientView!
    var contentView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        return v
    }()
    
    let topView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "설정"
        l.textColor = UIColor.white
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .center
        return l
    }()
    var titleLabel2:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .center
        l.alpha = 0
        return l
    }()
    var cancelBtn:IconButton1!
    
    
    let scrollView:UIScrollView={
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    var AccountView:SetAccountView!
    var LanguageView:SetLanguageView!
    var AppInfoView:SetAppInfoView!
    var PushView:SetPushView!
    
    
    
    var nsTitle:NSLayoutConstraint!
    var nsTitle2:NSLayoutConstraint!
    var nsScroll:NSLayoutConstraint!
    var nsContent:NSLayoutConstraint!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame:CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let wd = frame.width
        let h:CGFloat = 50
        
        AccountView = SetAccountView(frame: CGRect(x:0,y:0,width:wd,height:25 + 3*h))
        LanguageView = SetLanguageView(frame: CGRect(x:0,y:0,width:wd,height:25 + h))
        PushView = SetPushView(frame: CGRect(x:0,y:0,width:wd,height:25 + 2*h))
        AppInfoView = SetAppInfoView(frame:CGRect(x:0,y:0,width:wd,height:25 + 4*h))
        
        setup(width:frame.width)
    }
    private func setup(width:CGFloat){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let btmPadding = window.safeAreaInsets.bottom
        
        
        let h:CGFloat = 50
        let term:CGFloat = 20
        
        scrollView.contentSize = CGSize(width: 0, height: 100 + 8*h + term*4 + 50 )
        
        gradientView = MainGradientView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 60 + topPadding))
        cancelBtn = IconButton1(imgName: "LeftArrow", color: UIColor.white, frame: CGRect(x:0,y:0,width:30,height: 30))
        
        self.addSubview(topView)
        topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: topPadding + 60).isActive = true
        
        topView.addSubview(gradientView)
        gradientView.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        gradientView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        gradientView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        gradientView.bottomAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        
        topView.addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: topView.bottomAnchor, constant: -30).isActive = true
        nsTitle = titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor, constant: 0)
        nsTitle.isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        topView.addSubview(titleLabel2)
        titleLabel2.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        nsTitle2 = titleLabel2.centerXAnchor.constraint(equalTo: topView.centerXAnchor, constant: 120)
        nsTitle2.isActive = true
        titleLabel2.widthAnchor.constraint(equalToConstant: 120).isActive = true
        titleLabel2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        topView.addSubview(cancelBtn)
        cancelBtn.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 20).isActive = true
        cancelBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        cancelBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cancelBtn.centerYAnchor.constraint(equalTo: topView.bottomAnchor, constant: -30).isActive = true
        
        self.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        nsScroll = scrollView.leftAnchor.constraint(equalTo: leftAnchor)
        nsScroll.isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        scrollView.addSubview(AccountView)
        AccountView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: term).isActive = true
        AccountView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        AccountView.widthAnchor.constraint(equalToConstant: width).isActive = true
        AccountView.heightAnchor.constraint(equalToConstant: 25 + 3*h).isActive = true
        
        scrollView.addSubview(LanguageView)
        LanguageView.topAnchor.constraint(equalTo: AccountView.bottomAnchor, constant: term).isActive = true
        LanguageView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        LanguageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        LanguageView.heightAnchor.constraint(equalToConstant: 25 + h).isActive = true
        
        scrollView.addSubview(PushView)
        PushView.topAnchor.constraint(equalTo: LanguageView.bottomAnchor,constant: term).isActive = true
        PushView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        PushView.widthAnchor.constraint(equalToConstant: width).isActive = true
        PushView.heightAnchor.constraint(equalToConstant: 25 + 2*h).isActive = true
        
        scrollView.addSubview(AppInfoView)
        AppInfoView.topAnchor.constraint(equalTo: PushView.bottomAnchor, constant: term).isActive = true
        AppInfoView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        AppInfoView.widthAnchor.constraint(equalToConstant: width).isActive = true
        AppInfoView.heightAnchor.constraint(equalToConstant: 25 + 4*h).isActive = true
        
        self.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        nsContent = contentView.leftAnchor.constraint(equalTo: leftAnchor, constant: width)
        nsContent.isActive = true
        contentView.widthAnchor.constraint(equalToConstant: width).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    func slideOpenAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
            self.nsTitle.constant = -120
            self.nsTitle2.constant = 0
            self.titleLabel.alpha = 0
            self.titleLabel2.alpha = 1
            self.nsScroll.constant = -150
            self.nsContent.constant = 0
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                completion()
            }
        }
        
    }
    func slideCloseAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
            self.nsTitle2.constant = 120
            self.nsTitle.constant = 0
            self.titleLabel.alpha = 1
            self.titleLabel2.alpha = 0
            self.nsScroll.constant = 0
            self.nsContent.constant = self.frame.width
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
