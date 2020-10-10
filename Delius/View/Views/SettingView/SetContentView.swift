//
//  SetContentView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 27/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SetContentView:UIView{
    
    let scrollView:UIScrollView={
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var AccountView:SetAccountView!
    var FilterView:SetfilterView!
    var BlockView:SetUserBlockView!
    var LanguageView:SetLanguageView!
    var AppInfoView:SetAppInfoView!
    var PushView:SetPushView!
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        let wd = frame.width
        let h:CGFloat = 60
        
        AccountView = SetAccountView(frame: CGRect(x:0,y:0,width:wd,height:25 + 3*h))
        FilterView = SetfilterView(frame: CGRect(x:0,y:0,width:wd,height:25 + 2*h))
        BlockView = SetUserBlockView(frame: CGRect(x:0,y:0,width:wd,height:25 + h))
        LanguageView = SetLanguageView(frame: CGRect(x:0,y:0,width:wd,height:25 + h))
        PushView = SetPushView(frame: CGRect(x:0,y:0,width:wd,height:25 + 2*h))
        AppInfoView = SetAppInfoView(frame:CGRect(x:0,y:0,width:wd,height:25 + 4*h))
        
        scrollView.contentSize = CGSize(width:wd,height:45*8 + 13*h)
        
        setup(wd:wd)
    }
    private func setup(wd:CGFloat){
        let h:CGFloat = 60
        let term:CGFloat = 20
        self.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        scrollView.addSubview(AccountView)
        AccountView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: term).isActive = true
        AccountView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        AccountView.widthAnchor.constraint(equalToConstant: wd).isActive = true
        AccountView.heightAnchor.constraint(equalToConstant: 25 + 3*h).isActive = true
        
        scrollView.addSubview(FilterView)
        FilterView.topAnchor.constraint(equalTo: AccountView.bottomAnchor, constant: term).isActive = true
        FilterView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        FilterView.widthAnchor.constraint(equalToConstant: wd).isActive = true
        FilterView.heightAnchor.constraint(equalToConstant: 25 + 2*h).isActive = true
        
        scrollView.addSubview(BlockView)
        BlockView.topAnchor.constraint(equalTo: FilterView.bottomAnchor, constant: term).isActive = true
        BlockView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        BlockView.widthAnchor.constraint(equalToConstant: wd).isActive = true
        BlockView.heightAnchor.constraint(equalToConstant: 25 + h).isActive = true
        
        scrollView.addSubview(LanguageView)
        LanguageView.topAnchor.constraint(equalTo: FilterView.bottomAnchor, constant: term).isActive = true
        LanguageView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        LanguageView.widthAnchor.constraint(equalToConstant: wd).isActive = true
        LanguageView.heightAnchor.constraint(equalToConstant: 25 + h).isActive = true
        
        scrollView.addSubview(PushView)
        PushView.topAnchor.constraint(equalTo: LanguageView.bottomAnchor, constant: term).isActive = true
        PushView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        PushView.widthAnchor.constraint(equalToConstant: wd).isActive = true
        PushView.heightAnchor.constraint(equalToConstant: 25 + h).isActive = true
        
        scrollView.addSubview(AppInfoView)
        AppInfoView.topAnchor.constraint(equalTo: PushView.bottomAnchor, constant: term).isActive = true
        AppInfoView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        AppInfoView.widthAnchor.constraint(equalToConstant: wd).isActive = true
        AppInfoView.heightAnchor.constraint(equalToConstant: 25 + 4*h).isActive = true
        
        
    }
}
