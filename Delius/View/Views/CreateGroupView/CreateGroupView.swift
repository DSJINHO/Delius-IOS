//
//  CreateGroupView.swift
//  Delius
//
//  Created by user on 2020/09/09.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class CreateGroupView:UIView{
    var scrollView:UIScrollView={
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let topView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainColor()
        return v
    }()
    var titleLabel1:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.font = UIFont.boldSystemFont(ofSize: 17)
        l.textAlignment = .center
        return l
    }()
    var titleLabel2:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.font = UIFont.boldSystemFont(ofSize: 17)
        l.textAlignment = .center
        l.alpha = 0
        return l
    }()
    var backBtn:IconButton1!
    
    
    var a : Int = 1
    
    var tapView1:CreateGroupListView!
    var tapView2:CreateGroupListView!
    var tapView3:CreateGroupListView!
    var tapView4:CreateGroupListView!
    var tapView5:CreateGroupListView!
    var tapView6:CreateGroupListView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        backBtn = IconButton1(imgName: "LeftArrow", color: UIColor.white, frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let tapFrame = CGRect(x:0,y:0,width:frame.width,height:80)
        
        tapView1 = CreateGroupListView(frame: tapFrame,image: "c" ,title: "CreateGroup101".localize(), subTitle: "CreateGroup102".localize(), selected: true)
        tapView2 = CreateGroupListView(frame: tapFrame,image: "c", title: "CreateGroup201".localize(), subTitle: "CreateGroup202".localize(), selected: false)
        tapView3 = CreateGroupListView(frame: tapFrame,image: "c", title: "CreateGroup301".localize(), subTitle: "CreateGroup302".localize(), selected: false)
        tapView4 = CreateGroupListView(frame: tapFrame,image: "c", title: "CreateGroup401".localize(), subTitle: "CreateGroup402".localize(), selected: false)
        tapView5 = CreateGroupListView(frame: tapFrame,image: "c", title: "CreateGroup501".localize(), subTitle: "CreateGroup502".localize(), selected: false)
        tapView6 = CreateGroupListView(frame: tapFrame, image: "c", title: "CreateGroup601".localize(), subTitle: "CreateGroup602".localize(), selected: false)
        
        setup(wd:frame.width,ht:80)
        
    }
    var nsTitle1,nsTitle2:NSLayoutConstraint!
    private func setup(wd:CGFloat,ht:CGFloat){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        
        self.addSubview(topView)
        topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: topPadding + 60).isActive = true
        
        topView.addSubview(backBtn)
        backBtn.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 20).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backBtn.centerYAnchor.constraint(equalTo: topView.bottomAnchor, constant: -30).isActive = true
        
        topView.addSubview(titleLabel1)
        titleLabel1.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor).isActive = true
        titleLabel1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel1.widthAnchor.constraint(equalToConstant: 120).isActive = true
        nsTitle1 = titleLabel1.centerXAnchor.constraint(equalTo: topView.centerXAnchor, constant: 0)
        nsTitle1.isActive = true
        
        topView.addSubview(titleLabel2)
        titleLabel2.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor).isActive = true
        titleLabel2.widthAnchor.constraint(equalToConstant: 120).isActive = true
        titleLabel2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nsTitle2 = titleLabel2.centerXAnchor.constraint(equalTo: topView.centerXAnchor, constant: 120)
        nsTitle2.isActive = true
        
        self.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        scrollView.addSubview(tapView1)
        tapView1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        tapView1.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        tapView1.widthAnchor.constraint(equalToConstant: wd).isActive = true
        tapView1.heightAnchor.constraint(equalToConstant: ht).isActive = true
        
        scrollView.addSubview(tapView2)
        tapView2.topAnchor.constraint(equalTo: tapView1.bottomAnchor, constant: 10).isActive = true
        tapView2.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        tapView2.widthAnchor.constraint(equalToConstant: wd).isActive = true
        tapView2.heightAnchor.constraint(equalToConstant: ht).isActive = true
        
        scrollView.addSubview(tapView3)
        tapView3.topAnchor.constraint(equalTo: tapView2.bottomAnchor, constant: 10).isActive = true
        tapView3.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        tapView3.widthAnchor.constraint(equalToConstant: wd).isActive = true
        tapView3.heightAnchor.constraint(equalToConstant: ht).isActive = true
        
        scrollView.addSubview(tapView4)
        tapView4.topAnchor.constraint(equalTo: tapView3.bottomAnchor,constant: 10).isActive = true
        tapView4.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        tapView4.widthAnchor.constraint(equalToConstant: wd).isActive = true
        tapView4.heightAnchor.constraint(equalToConstant: ht).isActive = true
        
        scrollView.addSubview(tapView5)
        tapView5.topAnchor.constraint(equalTo: tapView4.bottomAnchor, constant: 10).isActive = true
        tapView5.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        tapView5.widthAnchor.constraint(equalToConstant: wd).isActive = true
        tapView5.heightAnchor.constraint(equalToConstant: ht).isActive = true
        
        scrollView.addSubview(tapView6)
        tapView6.topAnchor.constraint(equalTo: tapView5.bottomAnchor, constant: 10).isActive = true
        tapView6.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        tapView6.widthAnchor.constraint(equalToConstant: wd).isActive = true
        tapView6.heightAnchor.constraint(equalToConstant: ht).isActive = true
        
    }
}
