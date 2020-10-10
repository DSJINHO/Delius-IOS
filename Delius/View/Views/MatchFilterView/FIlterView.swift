//
//  FIlterView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/05/31.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
final class FilterView:UIView{
    
    var titleViewBack:MainGradientView!
    
    var titleView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let titleLabel1:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "FilterView001".localize(), txtAlignment: .center, ft: UIFont.DeliusBoldType1(), txtColor: .white)
        return l
    }()
    let titleLabel2:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "FilterView002".localize(), txtAlignment: .center, ft: UIFont.DeliusBoldType1(), txtColor: .white)
        l.alpha = 0
        return l
    }()
    let titleLabel3:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "FilterView003".localize(), txtAlignment: .center, ft: UIFont.DeliusBoldType1(), txtColor: .white)
        l.alpha = 0
        return l
    }()
    var backBtn:IconButton1!
    
    var nsTitle1,nsTitle2,nsTitle3:NSLayoutConstraint!
    var nsContent:NSLayoutConstraint!
    
    
    var soloBtnView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    var groupBtnView:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let contentView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let soloBtnLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "FilterView101".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType6(), txtColor: UIColor.MainGrayColor())
        return l
    }()
    let groupBtnLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "FilterView102".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType6(), txtColor: UIColor.MainGrayColor())
        return l
    }()
    let soloStateLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "FilterView201".localize(), txtAlignment: .right, ft: UIFont.DeliusSystemType2(), txtColor: UIColor.MainGrayColor())
        return l
    }()
    let groupStateLAbel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "FilterView201".localize(), txtAlignment: .right, ft: UIFont.DeliusSystemType2(), txtColor: UIColor.MainGrayColor())
        return l
    }()
    let rightArrow1:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named:"RightArrow")
        v.tintColor = UIColor.MainGrayColor()
        v.contentMode = .scaleAspectFit
        return v
    }()
    let rightArrow2:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named:"RightArrow")
        v.tintColor = UIColor.MainGrayColor()
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainLightGrayColor()
        return v
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        backBtn = IconButton1(imgName: "LeftArrow", color: .white, frame: CGRect(x:0,y:0,width:30,height:30))
        
        setup(width:frame.width)
    }
    private func setup(width:CGFloat){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        titleViewBack = MainGradientView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 60 + topPadding))
        
        self.addSubview(titleView)
        titleView.topAnchor.constraint(equalTo: topAnchor, constant: topPadding).isActive = true
        titleView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        titleView.addSubview(titleViewBack)
        titleViewBack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleViewBack.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleViewBack.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleViewBack.heightAnchor.constraint(equalToConstant: 60 + topPadding).isActive = true
        
        titleView.addSubview(titleLabel1)
        titleLabel1.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        nsTitle1 = titleLabel1.centerXAnchor.constraint(equalTo: titleView.centerXAnchor, constant: 0)
        nsTitle1.isActive = true
        titleLabel1.widthAnchor.constraint(equalToConstant: 120).isActive = true
        titleLabel1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        titleView.addSubview(titleLabel2)
        titleLabel2.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        nsTitle2 = titleLabel2.centerXAnchor.constraint(equalTo: titleView.centerXAnchor, constant: 120)
        nsTitle2.isActive = true
        titleLabel2.widthAnchor.constraint(equalToConstant: 120).isActive = true
        titleLabel2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        titleView.addSubview(titleLabel3)
        titleLabel3.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        nsTitle3 = titleLabel3.centerXAnchor.constraint(equalTo: titleView.centerXAnchor, constant: 120)
        nsTitle3.isActive = true
        titleLabel3.widthAnchor.constraint(equalToConstant: 120).isActive = true
        titleLabel3.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        titleView.addSubview(backBtn)
        backBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backBtn.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        backBtn.leftAnchor.constraint(equalTo: titleView.leftAnchor, constant: 30).isActive = true
        
        self.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        nsContent = contentView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0)
        nsContent.isActive = true
        contentView.widthAnchor.constraint(equalToConstant: width).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        contentView.addSubview(soloBtnView)
        soloBtnView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        soloBtnView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        soloBtnView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        soloBtnView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        contentView.addSubview(lineView)
        lineView.topAnchor.constraint(equalTo: soloBtnView.bottomAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: soloBtnView.leftAnchor, constant: 40).isActive = true
        lineView.rightAnchor.constraint(equalTo: soloBtnView.rightAnchor, constant: -40).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        contentView.addSubview(groupBtnView)
        groupBtnView.topAnchor.constraint(equalTo: lineView.bottomAnchor).isActive = true
        groupBtnView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        groupBtnView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        groupBtnView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        soloBtnView.addSubview(rightArrow1)
        rightArrow1.centerYAnchor.constraint(equalTo: soloBtnView.centerYAnchor).isActive = true
        rightArrow1.widthAnchor.constraint(equalToConstant: 15).isActive = true
        rightArrow1.heightAnchor.constraint(equalToConstant: 15).isActive = true
        rightArrow1.rightAnchor.constraint(equalTo: soloBtnView.rightAnchor, constant: -40).isActive = true
        
        soloBtnView.addSubview(soloStateLabel)
        soloStateLabel.rightAnchor.constraint(equalTo: rightArrow1.leftAnchor, constant: -10).isActive = true
        soloStateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        soloStateLabel.centerYAnchor.constraint(equalTo: soloBtnView.centerYAnchor).isActive = true
        soloStateLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        soloBtnView.addSubview(soloBtnLabel)
        soloBtnLabel.leftAnchor.constraint(equalTo: soloBtnView.leftAnchor, constant: 40).isActive = true
        soloBtnLabel.rightAnchor.constraint(equalTo: soloStateLabel.leftAnchor, constant: -20).isActive = true
        soloBtnLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        soloBtnLabel.centerYAnchor.constraint(equalTo: soloBtnView.centerYAnchor).isActive = true
        
        
        groupBtnView.addSubview(rightArrow2)
        rightArrow2.centerYAnchor.constraint(equalTo: groupBtnView.centerYAnchor).isActive = true
        rightArrow2.heightAnchor.constraint(equalToConstant: 15).isActive = true
        rightArrow2.widthAnchor.constraint(equalToConstant: 15).isActive = true
        rightArrow2.rightAnchor.constraint(equalTo: groupBtnView.rightAnchor, constant: -40).isActive = true
        
        groupBtnView.addSubview(groupStateLAbel)
        groupStateLAbel.rightAnchor.constraint(equalTo: rightArrow2.leftAnchor, constant: -10).isActive = true
        groupStateLAbel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        groupStateLAbel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        groupStateLAbel.centerYAnchor.constraint(equalTo: groupBtnView.centerYAnchor).isActive = true
        
        groupBtnView.addSubview(groupBtnLabel)
        groupBtnLabel.centerYAnchor.constraint(equalTo: groupBtnView.centerYAnchor).isActive = true
        groupBtnLabel.leftAnchor.constraint(equalTo: groupBtnView.leftAnchor, constant: 40).isActive = true
        groupBtnLabel.rightAnchor.constraint(equalTo: groupStateLAbel.leftAnchor, constant: -20).isActive = true
        groupBtnLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    
}
