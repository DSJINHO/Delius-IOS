//
//  AddingGroupView.swift
//  Delius
//
//  Created by 박진호 on 2020/06/14.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class AddingGroupView:UIView{
    let titleView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    //let titleLabel:UILabel={
    //    let l = UILabel()
    //    l.translatesAutoresizingMaskIntoConstraints = false
    //    l.textColor = .MainBlackColor1()
    //    l.font = UIFont.DeliusSystemType1()
    //    l.textAlignment = .center
    //    l.text = "AddingGroupView001".localize()
    //    return l
    //}()
    var cancelBtn:IconButton1!
    
    let scrollView:UIScrollView={
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var stringView:SubTitleView!
    var memberView:SubTitleView!
    var tagView:SubTitleView!
    var locationView:SubTitleView!
    var dateView:SubTitleView!
    var extraView:SubTitleView!
    
    var lineView1:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainLightGrayColor()
        return v
    }()
    var lineView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainLightGrayColor()
        return v
    }()
    var lineView3:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainLightGrayColor()
        return v
    }()
    var lineView4:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainLightGrayColor()
        return v
    }()
    var lineView5:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainLightGrayColor()
        return v
    }()
    var lineView6:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainLightGrayColor()
        return v
    }()
    var completeBackView:GroupGradationView!
    var completeButton:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Complete".localize(), for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.font = UIFont.DeliusBoldType1()
        return b
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        completeBackView = GroupGradationView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 50))
        cancelBtn = IconButton1(imgName: "c", color: .MainBlackColor1(), frame: CGRect(x:0,y:0,width:30,height:30))
        let viewFrame = CGRect(x:0,y:0,width:frame.width,height:80)
        stringView = SubTitleView(imgName: "AddGroupIcon1", title: "AddingGroupView101".localize(), subTitle: "AddingGroupView102".localize(), frame: viewFrame)
        memberView = SubTitleView(imgName: "AddGroupIcon2", title: "AddingGroupView201".localize(), subTitle: "AddingGroupView202".localize(), frame: viewFrame)
        tagView = SubTitleView(imgName: "AddGroupIcon3", title: "AddingGroupView301".localize(), subTitle: "AddingGroupView302".localize(), frame: viewFrame)
        locationView = SubTitleView(imgName: "AddGroupIcon4", title: "AddingGroupView401".localize(), subTitle: "AddingGroupView402".localize(), frame: viewFrame)
        dateView = SubTitleView(imgName: "AddGroupIcon5", title: "AddingGroupView501".localize(), subTitle: "AddingGroupView502".localize(), frame: viewFrame)
        extraView = SubTitleView(imgName: "AddGroupIcon6", title: "AddingGroupView601".localize(), subTitle: "AddingGroupView602".localize(), frame: viewFrame)
        setup(width: frame.width)
        
    }
    private func setup(width:CGFloat){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        
        let viewHeight:CGFloat = 70
        let term:CGFloat = 30
        
        
        
        self.addSubview(titleView)
        titleView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 60 + topPadding).isActive = true
        
        //titleView.addSubview(titleLabel)
        //titleLabel.centerYAnchor.constraint(equalTo: titleView.bottomAnchor, constant: -30).isActive = true
        //titleLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        //titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        //titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        titleView.addSubview(cancelBtn)
        cancelBtn.centerYAnchor.constraint(equalTo: titleView.bottomAnchor, constant: -30).isActive = true
        cancelBtn.rightAnchor.constraint(equalTo: titleView.rightAnchor, constant: -30).isActive = true
        cancelBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cancelBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        scrollView.contentSize = CGSize(width: 0, height: viewHeight*6 + 30 + term*5)
        self.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        scrollView.addSubview(stringView)
        stringView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 10).isActive = true
        stringView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        stringView.widthAnchor.constraint(equalToConstant: width).isActive = true
        stringView.heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
        
        scrollView.addSubview(lineView1)
        lineView1.topAnchor.constraint(equalTo: stringView.bottomAnchor, constant: 5).isActive = true
        lineView1.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 80).isActive = true
        lineView1.widthAnchor.constraint(equalToConstant: width - 110).isActive = true
        lineView1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        scrollView.addSubview(memberView)
        memberView.topAnchor.constraint(equalTo: lineView1.bottomAnchor,constant: term).isActive = true
        memberView.leftAnchor.constraint(equalTo: stringView.leftAnchor).isActive = true
        memberView.rightAnchor.constraint(equalTo: stringView.rightAnchor).isActive = true
        memberView.heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
        
        scrollView.addSubview(lineView2)
        lineView2.topAnchor.constraint(equalTo: memberView.bottomAnchor, constant: 5).isActive = true
        lineView2.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 80).isActive = true
        lineView2.widthAnchor.constraint(equalToConstant: width - 110).isActive = true
        lineView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        scrollView.addSubview(tagView)
        tagView.topAnchor.constraint(equalTo: lineView2.bottomAnchor,constant: term).isActive = true
        tagView.leftAnchor.constraint(equalTo: stringView.leftAnchor).isActive = true
        tagView.rightAnchor.constraint(equalTo: stringView.rightAnchor).isActive = true
        tagView.heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
        
        scrollView.addSubview(lineView3)
        lineView3.topAnchor.constraint(equalTo: tagView.bottomAnchor, constant: 5).isActive = true
        lineView3.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 80).isActive = true
        lineView3.widthAnchor.constraint(equalToConstant: width - 110).isActive = true
        lineView3.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        scrollView.addSubview(locationView)
        locationView.topAnchor.constraint(equalTo: lineView3.bottomAnchor,constant: term).isActive = true
        locationView.leftAnchor.constraint(equalTo: stringView.leftAnchor).isActive = true
        locationView.rightAnchor.constraint(equalTo: stringView.rightAnchor).isActive = true
        locationView.heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
        
        scrollView.addSubview(lineView4)
        lineView4.topAnchor.constraint(equalTo: locationView.bottomAnchor, constant: 5).isActive = true
        lineView4.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 80).isActive = true
        lineView4.widthAnchor.constraint(equalToConstant: width - 110).isActive = true
        lineView4.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        scrollView.addSubview(dateView)
        dateView.topAnchor.constraint(equalTo: lineView4.bottomAnchor,constant: term).isActive = true
        dateView.leftAnchor.constraint(equalTo: stringView.leftAnchor).isActive = true
        dateView.rightAnchor.constraint(equalTo: stringView.rightAnchor).isActive = true
        dateView.heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
        
        scrollView.addSubview(lineView5)
        lineView5.topAnchor.constraint(equalTo: dateView.bottomAnchor, constant: 5).isActive = true
        lineView5.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 80).isActive = true
        lineView5.widthAnchor.constraint(equalToConstant: width - 110).isActive = true
        lineView5.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        scrollView.addSubview(extraView)
        extraView.topAnchor.constraint(equalTo: lineView5.bottomAnchor,constant: term).isActive = true
        extraView.leftAnchor.constraint(equalTo: stringView.leftAnchor).isActive = true
        extraView.rightAnchor.constraint(equalTo: stringView.rightAnchor).isActive = true
        extraView.heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
        
        scrollView.addSubview(lineView6)
        lineView6.topAnchor.constraint(equalTo: extraView.bottomAnchor, constant: 5).isActive = true
        lineView6.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 80).isActive = true
        lineView6.widthAnchor.constraint(equalToConstant: width - 110).isActive = true
        lineView6.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        scrollView.addSubview(completeBackView)
        completeBackView.topAnchor.constraint(equalTo: lineView6.bottomAnchor,constant: 60).isActive = true
        completeBackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        completeBackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        completeBackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(completeButton)
        completeButton.centerXAnchor.constraint(equalTo: completeBackView.centerXAnchor).isActive = true
        completeButton.centerYAnchor.constraint(equalTo: completeBackView.centerYAnchor).isActive = true
        completeButton.widthAnchor.constraint(equalToConstant: width).isActive = true
        completeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
}
