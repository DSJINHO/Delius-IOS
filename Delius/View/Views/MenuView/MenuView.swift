//
//  MenuView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/03.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class MenuView:UIView{
    
    var topView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var imgBackView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    var blurView:UIVisualEffectView={
        let effect = UIBlurEffect(style: .dark)
        let v = UIVisualEffectView(effect: effect)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var scrollView:UIScrollView={
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.showsVerticalScrollIndicator = false
        v.backgroundColor = UIColor.clear
        v.clipsToBounds = false
        return v
    }()
//    var gradationView:CrossGradationView!
    var btmView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    var defaultGroupView:MenuDefaultGroupView!
    
    let profileView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.clear
//        v.layer.cornerRadius = 20
//        v.layer.shadowOpacity = 0.4
//        v.layer.shadowRadius = 10
        return v
    }()
    var profileLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .blackType1()
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .left
        l.text = "MenuView001".localize()
        return l
    }()
    var profileBackView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 72
        v.layer.masksToBounds = false
        return v
    }()
    var profileImgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        v.layer.cornerRadius = 66
        return v
    }()
    var profileNameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .blackType1()
        l.font = UIFont.DeliusBoldType4()
        l.textAlignment = .center
        l.baselineAdjustment = .alignBaselines
        return l
    }()
    var profileStatusLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.blackType1()
        l.font = UIFont.DeliusSystemType4()
        l.textAlignment = .center
        return l
    }()
    let groupView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var groupLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .blackType1()
        l.font = UIFont.DeliusBoldType4()
        l.textAlignment = .left
        l.text = "MenuView002".localize()
        return l
    }()
    
    lazy var groupCollectionView:UICollectionView={
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.headerReferenceSize = CGSize(width:30,height:0)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.isScrollEnabled = true
        return cv
    }()
    
    let buyView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let envView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var buyLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .blackType1()
        l.font = UIFont.DeliusBoldType4()
        l.textAlignment = .left
        l.text = "MenuView003".localize()
        return l
    }()
    var envLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .blackType1()
        l.font = UIFont.DeliusBoldType4()
        l.textAlignment = .left
        l.text = "MenuView004".localize()
        return l
    }()
    
    var editProfileBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("MenuView101".localize(), for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel!.font = UIFont.DeliusSystemType4()
        b.contentHorizontalAlignment = .right
        return b
    }()
    var addGroupBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("MenuView201".localize(), for: .normal)
        b.setTitleColor(.blackType1(), for: .normal)
        b.titleLabel!.font = UIFont.DeliusSystemType3()
        b.contentHorizontalAlignment = .right
        return b
    }()
    
//    let lineViewBuy:UIView={
//        let v = UIView()
//        v.translatesAutoresizingMaskIntoConstraints = false
//        v.backgroundColor = UIColor.MainLightGrayColor()
//        return v
//    }()
//
//    let lineViewEnv:UIView={
//        let v = UIView()
//        v.translatesAutoresizingMaskIntoConstraints = false
//        v.backgroundColor = UIColor.MainLightGrayColor()
//        return v
//    }()
    let lineView1:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainLightGrayColor()
        return v
    }()
    
    let lineView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainLightGrayColor()
        return v
    }()
    
    let lineView3:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainLightGrayColor()
        return v
    }()
    
    var plusBtnBack:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOpacity = 0.3
        v.layer.shadowOffset = CGSize(width: 2 , height: 2)
        v.layer.masksToBounds = false
        return v
    }()
    var plusUserBtn:MenuSubView2!
    var deliBtn:MenuSubView3!
    var boosterBtn:MenuSubView4!
    var filterBtn:MenuSubView!
    var blockBtn:MenuSubView!
    
    
    var settingBtn:IconButton1!
    var userDeliBtn:IconButton1!
    var userBoosterBtn:IconButton1!
    var menuBtn:IconButton1!
    
    
    var nsProfile:NSLayoutConstraint!
    var nsGroup:NSLayoutConstraint!
    
    required init?(coder:NSCoder){
        super.init(coder:coder)
        self.backgroundColor = UIColor.white
    }
    
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
//        gradationView = CrossGradationView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        
        settingBtn = IconButton1(imgName: "Setting", color: .white, frame: CGRect(x:0,y:0,width:30,height:30))
        userDeliBtn = IconButton1(imgName: "CheckDeli", color: .white, frame: CGRect(x:0,y:0,width:30,height:30))
        userBoosterBtn = IconButton1(imgName: "CheckBooster", color: .white, frame: CGRect(x:0,y:0,width:30,height:30))
        menuBtn = IconButton1(imgName: "LeftArrow", color: .white, frame: CGRect(x:0,y:0,width:30,height:30))
        
        
        scrollView.delegate = self
        
        defaultGroupView = MenuDefaultGroupView(frame: self.bounds)
        defaultGroupView.isHidden = true
        
        setup(width:frame.width)
    }
    private func setup2(width:CGFloat){
        
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        
        let btnFrame = CGRect(x:0,y:0,width:width-60,height:60)
        
//        self.addSubview(gradationView)
//        gradationView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        gradationView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//        gradationView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        gradationView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        self.addSubview(settingBtn)
        settingBtn.centerYAnchor.constraint(equalTo: topAnchor,constant: topPadding + 30).isActive = true
        settingBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        settingBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        settingBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -25).isActive = true
        
//        self.addSubview(lineView1)
//        lineView1.centerYAnchor.constraint(equalTo: settingBtn.centerYAnchor).isActive = true
//        lineView1.widthAnchor.constraint(equalToConstant: 1).isActive = true
//        lineView1.heightAnchor.constraint(equalToConstant: 15).isActive = true
//        lineView1.rightAnchor.constraint(equalTo: settingBtn.leftAnchor,constant: -10).isActive = true
        
        self.addSubview(userBoosterBtn)
        userBoosterBtn.centerYAnchor.constraint(equalTo: settingBtn.centerYAnchor).isActive = true
        userBoosterBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        userBoosterBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userBoosterBtn.rightAnchor.constraint(equalTo: settingBtn.leftAnchor, constant: -8).isActive = true
        
        self.addSubview(userDeliBtn)
        userDeliBtn.centerYAnchor.constraint(equalTo: settingBtn.centerYAnchor).isActive = true
        userDeliBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        userDeliBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userDeliBtn.rightAnchor.constraint(equalTo: userBoosterBtn.leftAnchor,constant: -10).isActive = true
        
        self.addSubview(menuBtn)
        menuBtn.centerYAnchor.constraint(equalTo: settingBtn.centerYAnchor).isActive = true
        menuBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        menuBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        menuBtn.leftAnchor.constraint(equalTo: leftAnchor, constant: 25).isActive = true
        
        
        self.addSubview(profileLabel)
        nsProfile = profileLabel.topAnchor.constraint(equalTo: topAnchor, constant: topPadding + 60)
        nsProfile.isActive = true
        profileLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        profileLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(editProfileBtn)
        editProfileBtn.bottomAnchor.constraint(equalTo: profileLabel.bottomAnchor).isActive = true
        editProfileBtn.rightAnchor.constraint(equalTo: rightAnchor,constant: -30).isActive = true
        editProfileBtn.heightAnchor.constraint(equalToConstant: 25).isActive = true
        editProfileBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        
        
        
//        let profileViewHeight = width/5*2
        let profileViewHeight:CGFloat = 146
        let profileImgHeight:CGFloat = 146
        
        self.addSubview(profileView)
        profileView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 10).isActive = true
        profileView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        profileView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: profileViewHeight).isActive = true
        
        profileBackView.layer.cornerRadius = profileImgHeight/2
        profileView.addSubview(profileBackView)
        profileBackView.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 10).isActive = true
        profileBackView.widthAnchor.constraint(equalToConstant: profileImgHeight).isActive = true
        profileBackView.heightAnchor.constraint(equalToConstant: profileImgHeight).isActive = true
        profileBackView.leftAnchor.constraint(equalTo: profileView.leftAnchor, constant: 45).isActive = true
        
        
        profileImgView.layer.cornerRadius = (profileImgHeight-6)/2
        profileBackView.addSubview(profileImgView)
        profileImgView.topAnchor.constraint(equalTo: profileBackView.topAnchor, constant: 2).isActive = true
        profileImgView.leftAnchor.constraint(equalTo: profileBackView.leftAnchor, constant: 2).isActive = true
        profileImgView.rightAnchor.constraint(equalTo: profileBackView.rightAnchor, constant: -2).isActive = true
        profileImgView.bottomAnchor.constraint(equalTo: profileBackView.bottomAnchor, constant: -2).isActive = true
        
        let rightArrow = UIImageView()
        rightArrow.translatesAutoresizingMaskIntoConstraints = false
        rightArrow.image = UIImage(named: "RightArrow")
        rightArrow.tintColor = UIColor.white
        rightArrow.contentMode = .scaleAspectFit
        
        profileView.addSubview(rightArrow)
        rightArrow.centerYAnchor.constraint(equalTo: profileView.centerYAnchor).isActive = true
        rightArrow.rightAnchor.constraint(equalTo: profileView.rightAnchor, constant: -30).isActive = true
        rightArrow.heightAnchor.constraint(equalToConstant: 15).isActive = true
        rightArrow.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        profileView.addSubview(profileNameLabel)
        profileNameLabel.topAnchor.constraint(equalTo: profileBackView.topAnchor).isActive = true
        profileNameLabel.leftAnchor.constraint(equalTo: profileBackView.rightAnchor, constant: 15).isActive = true
        profileNameLabel.rightAnchor.constraint(equalTo: rightArrow.leftAnchor, constant: -20).isActive = true
        profileNameLabel.bottomAnchor.constraint(equalTo: profileBackView.centerYAnchor).isActive = true
        
        profileView.addSubview(profileStatusLabel)
        profileStatusLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor).isActive = true
        profileStatusLabel.leftAnchor.constraint(equalTo: profileNameLabel.leftAnchor).isActive = true
        profileStatusLabel.rightAnchor.constraint(equalTo: profileNameLabel.rightAnchor).isActive = true
        profileStatusLabel.bottomAnchor.constraint(equalTo: profileBackView.bottomAnchor).isActive = true
        
//        self.addSubview(profileView)
//        profileView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 20).isActive = true
//        profileView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//        profileView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        profileView.heightAnchor.constraint(equalToConstant: profileViewHeight).isActive = true
//
//        profileBackView.layer.cornerRadius = profileImgHeight/2+4
//        profileView.addSubview(profileBackView)
//        profileBackView.centerYAnchor.constraint(equalTo: profileView.centerYAnchor).isActive = true
//        profileBackView.leftAnchor.constraint(equalTo: profileView.leftAnchor,constant:30).isActive = true
//        profileBackView.widthAnchor.constraint(equalToConstant: profileImgHeight+8).isActive = true
//        profileBackView.heightAnchor.constraint(equalToConstant: profileImgHeight+8).isActive = true
//
//
//        profileImgView.layer.cornerRadius = profileImgHeight/2
//        profileView.addSubview(profileImgView)
//        profileImgView.centerYAnchor.constraint(equalTo: profileBackView.centerYAnchor).isActive = true
//        profileImgView.centerXAnchor.constraint(equalTo: profileBackView.centerXAnchor).isActive = true
//        profileImgView.widthAnchor.constraint(equalToConstant: profileImgHeight).isActive = true
//        profileImgView.heightAnchor.constraint(equalToConstant: profileImgHeight).isActive = true
//
//        profileView.addSubview(profileNameLabel)
//        profileNameLabel.leftAnchor.constraint(equalTo: profileImgView.rightAnchor, constant: 20).isActive = true
//        profileNameLabel.rightAnchor.constraint(equalTo: profileView.rightAnchor, constant: -20).isActive = true
//        profileNameLabel.bottomAnchor.constraint(equalTo: profileImgView.centerYAnchor).isActive = true
//        profileNameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
//
//        profileView.addSubview(profileStatusLabel)
//        profileStatusLabel.leftAnchor.constraint(equalTo: profileNameLabel.leftAnchor).isActive = true
//        profileStatusLabel.rightAnchor.constraint(equalTo: profileNameLabel.rightAnchor).isActive = true
//        profileStatusLabel.topAnchor.constraint(equalTo: profileImgView.centerYAnchor).isActive = true
//        profileStatusLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        self.addSubview(groupLabel)
        nsGroup =  groupLabel.topAnchor.constraint(equalTo: topAnchor, constant: topPadding + 60 + 30 + 20 + profileViewHeight + 20)
        nsGroup.isActive = true
        groupLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        groupLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        groupLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.addSubview(addGroupBtn)
        addGroupBtn.centerYAnchor.constraint(equalTo: groupLabel.centerYAnchor).isActive = true
        addGroupBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        addGroupBtn.heightAnchor.constraint(equalToConstant: 25).isActive = true
        addGroupBtn.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        
        let groupViewHeight = ( width - 60 )
        self.addSubview(groupView)
        groupView.topAnchor.constraint(equalTo: groupLabel.bottomAnchor, constant: 20).isActive = true
        groupView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        groupView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        groupView.heightAnchor.constraint(equalToConstant: groupViewHeight).isActive = true
        
        groupView.addSubview(defaultGroupView)
        defaultGroupView.topAnchor.constraint(equalTo: groupView.topAnchor).isActive = true
        defaultGroupView.leftAnchor.constraint(equalTo: groupView.leftAnchor).isActive = true
        defaultGroupView.rightAnchor.constraint(equalTo: groupView.rightAnchor).isActive = true
        defaultGroupView.bottomAnchor.constraint(equalTo: groupView.bottomAnchor).isActive = true
        
        groupView.addSubview(groupCollectionView)
        groupCollectionView.topAnchor.constraint(equalTo: groupView.topAnchor).isActive = true
        groupCollectionView.leftAnchor.constraint(equalTo: groupView.leftAnchor).isActive = true
        groupCollectionView.rightAnchor.constraint(equalTo: groupView.rightAnchor).isActive = true
        groupCollectionView.bottomAnchor.constraint(equalTo: groupView.bottomAnchor).isActive = true
        
        
        scrollView.contentSize = CGSize(width:0,height:900)
        self.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: topAnchor,constant: topPadding + 90).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        
        scrollView.addSubview(btmView)
        btmView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 130 + profileViewHeight + groupViewHeight).isActive = true
        btmView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        btmView.widthAnchor.constraint(equalToConstant: width).isActive = true
        btmView.heightAnchor.constraint(equalToConstant: 900).isActive = true
        
        
        btmView.addSubview(buyView)
        buyView.topAnchor.constraint(equalTo: btmView.topAnchor, constant: 20).isActive = true
        buyView.leftAnchor.constraint(equalTo: btmView.leftAnchor).isActive = true
        buyView.rightAnchor.constraint(equalTo: btmView.rightAnchor).isActive = true
        buyView.heightAnchor.constraint(equalToConstant: 260).isActive = true
        
        buyView.addSubview(buyLabel)
        buyLabel.topAnchor.constraint(equalTo: buyView.topAnchor).isActive = true
        buyLabel.leftAnchor.constraint(equalTo: btmView.leftAnchor, constant: 30).isActive = true
        buyLabel.rightAnchor.constraint(equalTo: btmView.rightAnchor, constant: -30).isActive = true
        buyLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        plusBtnBack.layer.cornerRadius = 50/6
        buyView.addSubview(plusBtnBack)
        plusBtnBack.topAnchor.constraint(equalTo: buyLabel.bottomAnchor,constant: 15).isActive = true
        plusBtnBack.leftAnchor.constraint(equalTo: btmView.leftAnchor, constant: 30).isActive = true
        plusBtnBack.rightAnchor.constraint(equalTo: btmView.rightAnchor, constant: -30).isActive = true
        plusBtnBack.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        
        
        plusUserBtn = MenuSubView2(frame: btnFrame)
        buyView.addSubview(plusUserBtn)
        plusUserBtn.topAnchor.constraint(equalTo: buyLabel.bottomAnchor,constant: 15).isActive = true
        plusUserBtn.leftAnchor.constraint(equalTo: btmView.leftAnchor, constant: 30).isActive = true
        plusUserBtn.rightAnchor.constraint(equalTo: btmView.rightAnchor, constant: -30).isActive = true
        plusUserBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        buyView.addSubview(lineView1)
        lineView1.topAnchor.constraint(equalTo: plusUserBtn.bottomAnchor).isActive = true
        lineView1.leftAnchor.constraint(equalTo: btmView.leftAnchor, constant: 30).isActive = true
        lineView1.rightAnchor.constraint(equalTo: btmView.rightAnchor).isActive = true
        lineView1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        deliBtn = MenuSubView3(frame: btnFrame)
        buyView.addSubview(deliBtn)
        deliBtn.topAnchor.constraint(equalTo: plusUserBtn.bottomAnchor, constant: 15).isActive = true
        deliBtn.leftAnchor.constraint(equalTo: plusUserBtn.leftAnchor).isActive = true
        deliBtn.rightAnchor.constraint(equalTo: plusUserBtn.rightAnchor).isActive = true
        deliBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        buyView.addSubview(lineView2)
        lineView2.topAnchor.constraint(equalTo: deliBtn.bottomAnchor).isActive = true
        lineView2.leftAnchor.constraint(equalTo: btmView.leftAnchor, constant: 30).isActive = true
        lineView2.rightAnchor.constraint(equalTo: btmView.rightAnchor).isActive = true
        lineView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        boosterBtn = MenuSubView4(frame: btnFrame)
        buyView.addSubview(boosterBtn)
        boosterBtn.topAnchor.constraint(equalTo: deliBtn.bottomAnchor, constant: 15).isActive = true
        boosterBtn.leftAnchor.constraint(equalTo: plusUserBtn.leftAnchor).isActive = true
        boosterBtn.rightAnchor.constraint(equalTo: plusUserBtn.rightAnchor).isActive = true
        boosterBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
//        buyView.addSubview(lineViewBuy)
//        lineViewBuy.centerYAnchor.constraint(equalTo: deliBtn.bottomAnchor).isActive = true
//        lineViewBuy.leftAnchor.constraint(equalTo: deliBtn.leftAnchor, constant: 15).isActive = true
//        lineViewBuy.rightAnchor.constraint(equalTo: deliBtn.rightAnchor, constant: -15).isActive = true
//        lineViewBuy.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        btmView.addSubview(envView)
        envView.topAnchor.constraint(equalTo: buyView.bottomAnchor).isActive = true
        envView.leftAnchor.constraint(equalTo: btmView.leftAnchor).isActive = true
        envView.rightAnchor.constraint(equalTo: btmView.rightAnchor).isActive = true
        envView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        envView.addSubview(envLabel)
        envLabel.topAnchor.constraint(equalTo: envView.topAnchor).isActive = true
        envLabel.leftAnchor.constraint(equalTo: envView.leftAnchor, constant: 35).isActive = true
        envLabel.rightAnchor.constraint(equalTo: envView.rightAnchor, constant: -35).isActive = true
        envLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        filterBtn = MenuSubView(txt: "MenuView401".localize(), frame: btnFrame)
        envView.addSubview(filterBtn)
        filterBtn.topAnchor.constraint(equalTo: envLabel.bottomAnchor,constant: 15).isActive = true
        filterBtn.leftAnchor.constraint(equalTo: plusUserBtn.leftAnchor).isActive = true
        filterBtn.rightAnchor.constraint(equalTo: envView.rightAnchor,constant:-35).isActive = true
        filterBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        envView.addSubview(lineView3)
        lineView3.topAnchor.constraint(equalTo: filterBtn.bottomAnchor, constant: 7.5).isActive = true
        lineView3.leftAnchor.constraint(equalTo: envView.leftAnchor, constant: 30).isActive = true
        lineView3.rightAnchor.constraint(equalTo: envView.rightAnchor).isActive = true
        lineView3.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        blockBtn = MenuSubView(txt: "MenuView402".localize(), frame: btnFrame)
        envView.addSubview(blockBtn)
        blockBtn.topAnchor.constraint(equalTo: filterBtn.bottomAnchor,constant: 15).isActive = true
        blockBtn.leftAnchor.constraint(equalTo: filterBtn.leftAnchor).isActive = true
        blockBtn.rightAnchor.constraint(equalTo: envView.rightAnchor,constant:-35).isActive = true
        blockBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
//        envView.addSubview(lineViewEnv)
//        lineViewEnv.centerYAnchor.constraint(equalTo: filterBtn.bottomAnchor).isActive = true
//        lineViewEnv.leftAnchor.constraint(equalTo: filterBtn.leftAnchor, constant: 15).isActive = true
//        lineViewEnv.rightAnchor.constraint(equalTo: filterBtn.rightAnchor, constant: -15).isActive = true
//        lineViewEnv.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.bringSubviewToFront(addGroupBtn)
        self.bringSubviewToFront(groupView)
        
    }
    func setup(width:CGFloat){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        
        self.addSubview(imgBackView)
        imgBackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgBackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imgBackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imgBackView.heightAnchor.constraint(equalToConstant: width).isActive = true
        
        self.addSubview(blurView)
        blurView.topAnchor.constraint(equalTo: imgBackView.topAnchor).isActive = true
        blurView.leftAnchor.constraint(equalTo: imgBackView.leftAnchor).isActive = true
        blurView.rightAnchor.constraint(equalTo: imgBackView.rightAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: imgBackView.bottomAnchor).isActive = true
        
        self.addSubview(topView)
        topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: topPadding + 60).isActive = true
        
        topView.addSubview(menuBtn)
        menuBtn.centerYAnchor.constraint(equalTo: topView.bottomAnchor,constant: -30).isActive = true
        menuBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        menuBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        menuBtn.leftAnchor.constraint(equalTo: topView.leftAnchor,constant: 30).isActive = true
        
        topView.addSubview(settingBtn)
        settingBtn.centerYAnchor.constraint(equalTo: menuBtn.centerYAnchor).isActive = true
        settingBtn.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -30).isActive = true
        settingBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        settingBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
//        topView.addSubview(lineView1)
//        lineView1.centerYAnchor.constraint(equalTo: menuBtn.centerYAnchor).isActive = true
//        lineView1.rightAnchor.constraint(equalTo: settingBtn.leftAnchor, constant: -5).isActive = true
//        lineView1.heightAnchor.constraint(equalToConstant: 15).isActive = true
//        lineView1.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        topView.addSubview(userBoosterBtn)
        userBoosterBtn.centerYAnchor.constraint(equalTo: menuBtn.centerYAnchor).isActive = true
        userBoosterBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        userBoosterBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userBoosterBtn.rightAnchor.constraint(equalTo: settingBtn.leftAnchor, constant: -8).isActive = true
        
        topView.addSubview(userDeliBtn)
        userDeliBtn.centerYAnchor.constraint(equalTo: menuBtn.centerYAnchor).isActive = true
        userDeliBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        userDeliBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userDeliBtn.rightAnchor.constraint(equalTo: userBoosterBtn.leftAnchor, constant: -5).isActive = true
        
        self.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        scrollView.addSubview(btmView)
        btmView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: width - topPadding - 210).isActive = true
        btmView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        btmView.widthAnchor.constraint(equalToConstant: width).isActive = true
        btmView.heightAnchor.constraint(equalToConstant: 700).isActive = true
        
        scrollView.addSubview(profileView)
        profileView.topAnchor.constraint(equalTo: btmView.topAnchor, constant: -80).isActive = true
        profileView.centerXAnchor.constraint(equalTo: btmView.centerXAnchor).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        profileView.leftAnchor.constraint(equalTo: btmView.leftAnchor, constant: 30).isActive = true
        
        
        profileView.addSubview(profileBackView)
        profileBackView.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 10).isActive = true
        profileBackView.centerXAnchor.constraint(equalTo: profileView.centerXAnchor).isActive = true
        profileBackView.widthAnchor.constraint(equalToConstant: 146).isActive = true
        profileBackView.heightAnchor.constraint(equalToConstant: 146).isActive = true
        
        profileBackView.addSubview(profileImgView)
        profileImgView.topAnchor.constraint(equalTo: profileBackView.topAnchor, constant: 6).isActive = true
        profileImgView.leftAnchor.constraint(equalTo: profileBackView.leftAnchor,constant: 6).isActive = true
        profileImgView.rightAnchor.constraint(equalTo: profileBackView.rightAnchor, constant: -6).isActive = true
        profileImgView.bottomAnchor.constraint(equalTo: profileBackView.bottomAnchor, constant: -6).isActive = true
        
        profileView.addSubview(profileNameLabel)
        profileNameLabel.topAnchor.constraint(equalTo: profileImgView.bottomAnchor, constant: 20).isActive = true
        profileNameLabel.leftAnchor.constraint(equalTo: profileView.leftAnchor, constant: 20).isActive = true
        profileNameLabel.rightAnchor.constraint(equalTo: profileView.rightAnchor, constant: -30).isActive = true
        profileNameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        profileView.addSubview(profileStatusLabel)
        profileStatusLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor,constant: 5).isActive = true
        profileStatusLabel.leftAnchor.constraint(equalTo: profileNameLabel.leftAnchor, constant: 30).isActive = true
        profileStatusLabel.rightAnchor.constraint(equalTo: profileNameLabel.rightAnchor, constant: -30).isActive = true
        profileStatusLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        btmView.addSubview(groupLabel)
        groupLabel.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 50).isActive = true
        groupLabel.leftAnchor.constraint(equalTo: btmView.leftAnchor, constant: 30).isActive = true
        groupLabel.rightAnchor.constraint(equalTo: btmView.rightAnchor, constant: -30).isActive = true
        groupLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        btmView.addSubview(addGroupBtn)
        addGroupBtn.centerYAnchor.constraint(equalTo: groupLabel.centerYAnchor).isActive = true
        addGroupBtn.rightAnchor.constraint(equalTo: btmView.rightAnchor, constant: -30).isActive = true
        addGroupBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        addGroupBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        btmView.addSubview(groupCollectionView)
        groupCollectionView.leftAnchor.constraint(equalTo: btmView.leftAnchor).isActive = true
        groupCollectionView.rightAnchor.constraint(equalTo: btmView.rightAnchor).isActive = true
        groupCollectionView.heightAnchor.constraint(equalToConstant: 170).isActive = true
        groupCollectionView.topAnchor.constraint(equalTo: groupLabel.bottomAnchor, constant: 5).isActive = true
        
        btmView.addSubview(buyView)
        buyView.topAnchor.constraint(equalTo: groupCollectionView.bottomAnchor, constant: 20).isActive = true
        buyView.leftAnchor.constraint(equalTo: btmView.leftAnchor).isActive = true
        buyView.rightAnchor.constraint(equalTo: btmView.rightAnchor).isActive = true
        buyView.heightAnchor.constraint(equalToConstant: 260).isActive = true
        
        buyView.addSubview(buyLabel)
        buyLabel.topAnchor.constraint(equalTo: buyView.topAnchor, constant: 20).isActive = true
        buyLabel.leftAnchor.constraint(equalTo: buyView.leftAnchor, constant: 30).isActive = true
        buyLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buyLabel.rightAnchor.constraint(equalTo: buyView.rightAnchor, constant: -30).isActive = true
        
        plusUserBtn = MenuSubView2(frame: CGRect(x:0,y: 0,width: width - 60,height: 50))
        buyView.addSubview(plusUserBtn)
        plusUserBtn.topAnchor.constraint(equalTo: buyView.topAnchor, constant: 60).isActive = true
        plusUserBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        plusUserBtn.leftAnchor.constraint(equalTo: buyView.leftAnchor, constant: 30).isActive = true
        plusUserBtn.rightAnchor.constraint(equalTo: buyView.rightAnchor, constant: -30).isActive = true
        buyView.addSubview(lineView1)
        lineView1.topAnchor.constraint(equalTo: plusUserBtn.bottomAnchor).isActive = true
        lineView1.leftAnchor.constraint(equalTo: btmView.leftAnchor, constant: 30).isActive = true
        lineView1.rightAnchor.constraint(equalTo: btmView.rightAnchor).isActive = true
        lineView1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        deliBtn = MenuSubView3(frame: CGRect(x:0,y: 0,width: width - 60,height: 50))
        buyView.addSubview(deliBtn)
        deliBtn.topAnchor.constraint(equalTo: plusUserBtn.bottomAnchor, constant: 14).isActive = true
        deliBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        deliBtn.leftAnchor.constraint(equalTo: buyView.leftAnchor, constant: 30).isActive = true
        deliBtn.rightAnchor.constraint(equalTo: buyView.rightAnchor, constant: -30).isActive = true
        
        buyView.addSubview(lineView2)
        lineView2.topAnchor.constraint(equalTo: deliBtn.bottomAnchor).isActive = true
        lineView2.leftAnchor.constraint(equalTo: btmView.leftAnchor, constant: 30).isActive = true
        lineView2.rightAnchor.constraint(equalTo: btmView.rightAnchor).isActive = true
        lineView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        boosterBtn = MenuSubView4(frame: CGRect(x:0,y: 0,width: width - 60,height: 50))
        buyView.addSubview(boosterBtn)
        boosterBtn.topAnchor.constraint(equalTo: deliBtn.bottomAnchor, constant: 14).isActive = true
        boosterBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        boosterBtn.leftAnchor.constraint(equalTo: buyView.leftAnchor, constant: 30).isActive = true
        boosterBtn.rightAnchor.constraint(equalTo: buyView.rightAnchor, constant: -30).isActive = true
        
        btmView.addSubview(envView)
        envView.topAnchor.constraint(equalTo: buyView.bottomAnchor, constant: 10).isActive = true
        envView.topAnchor.constraint(equalTo: buyView.bottomAnchor).isActive = true
        envView.leftAnchor.constraint(equalTo: btmView.leftAnchor).isActive = true
        envView.rightAnchor.constraint(equalTo: btmView.rightAnchor).isActive = true
        
        envView.addSubview(envLabel)
        envLabel.topAnchor.constraint(equalTo: envView.topAnchor, constant: 20).isActive = true
        envLabel.leftAnchor.constraint(equalTo: envView.leftAnchor, constant: 30).isActive = true
        envLabel.rightAnchor.constraint(equalTo: envView.rightAnchor, constant: -30).isActive = true
        envLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        filterBtn = MenuSubView(txt: "MenuView401".localize(), frame: CGRect(x:0,y:0,width:width-60,height:60))
        envView.addSubview(filterBtn)
        filterBtn.topAnchor.constraint(equalTo: envLabel.bottomAnchor, constant: 15).isActive = true
        filterBtn.leftAnchor.constraint(equalTo: plusUserBtn.leftAnchor).isActive = true
        filterBtn.rightAnchor.constraint(equalTo: envView.rightAnchor,constant:-35).isActive = true
        filterBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        envView.addSubview(lineView3)
        lineView3.topAnchor.constraint(equalTo: filterBtn.bottomAnchor, constant: 7.5).isActive = true
        lineView3.leftAnchor.constraint(equalTo: envView.leftAnchor, constant: 30).isActive = true
        lineView3.rightAnchor.constraint(equalTo: envView.rightAnchor).isActive = true
        lineView3.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        blockBtn = MenuSubView(txt: "MenuView402".localize(), frame: CGRect(x:0,y:0,width:width-60,height:60))
        envView.addSubview(blockBtn)
        blockBtn.topAnchor.constraint(equalTo: filterBtn.bottomAnchor, constant: 15).isActive = true
        blockBtn.leftAnchor.constraint(equalTo: filterBtn.leftAnchor).isActive = true
        blockBtn.rightAnchor.constraint(equalTo: envView.rightAnchor,constant:-35).isActive = true
        blockBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.bringSubviewToFront(topView)
        
        scrollView.contentSize = CGSize(width: 0, height: 1000)
    }
}
extension MenuView:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
