//
//  SettingTopView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 27/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SetTopView:UIView{
    
    let titleView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.gradientColor()[2]
        return v
    }()
    var titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.text = "SettingView001".localize()
        l.textAlignment = .center
        l.font = UIFont.DeliusBoldType1()
        return l
    }()
    var backBtn:IconButton1!
    var cancelBtn:IconButton1!
    
    var nsTitle1,nsTitle2:NSLayoutConstraint!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame:CGRect){
        super.init(frame: frame)
    }
    private func setup(){
        
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        
        self.addSubview(titleView)
        titleView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: topPadding + 60).isActive = true
        
        self.addSubview(titleLabel)
        titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor, constant: -15).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nsTitle1 = titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor, constant: 0)
        nsTitle1.isActive = true
        
        self.addSubview(backBtn)
        backBtn.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backBtn.leftAnchor.constraint(equalTo: titleView.leftAnchor, constant: 20).isActive = true
        
        self.addSubview(cancelBtn)
        cancelBtn.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        cancelBtn.rightAnchor.constraint(equalTo: titleView.rightAnchor, constant: -20).isActive = true
        cancelBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cancelBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    }
}
