//
//  AddingGroupDateView.swift
//  Delius
//
//  Created by 박진호 on 2020/06/14.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class AddingGroupDateView:UIView{
    
    let titleView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let titleImgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "AddGroupIcon5")
        v.contentMode = .scaleAspectFit
        return v
    }()
    let completeBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(UIColor.MainBlackColor2(), for: .normal)
        b.titleLabel!.font = UIFont.boldSystemFont(ofSize: 17)
        b.contentHorizontalAlignment = .right
        b.setTitle("Complete".localize(), for: .normal)
        return b
    }()
    let startLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.font = UIFont.boldSystemFont(ofSize: 17)
        l.textAlignment = .left
        l.text = "AddingGroupDateView001".localize()
        return l
    }()
    let startLine:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(red: 109/255.0, green: 165/255.0, blue: 186/255.0, alpha: 1.0)
        v.layer.cornerRadius = 1
        return v
    }()
    let startDateLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.font = UIFont.systemFont(ofSize: 17)
        l.textAlignment = .left
        return l
    }()
    let endLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.font = UIFont.boldSystemFont(ofSize: 17)
        l.textAlignment = .left
        l.text = "AddingGroupDateView002".localize()
        return l
    }()
    let endDateLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.font = UIFont.systemFont(ofSize: 17)
        l.textAlignment = .left
        return l
    }()
    let endLine:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(red: 109/255.0, green: 165/255.0, blue: 186/255.0, alpha: 1.0)
        v.layer.cornerRadius = 1
        return v
    }()
//    let descriptionLabel:UILabel={
//        let l = UILabel()
//        l.translatesAutoresizingMaskIntoConstraints = false
//        l.textColor = UIColor.lightGray
//        l.font = UIFont.systemFont(ofSize: 14)
//        l.numberOfLines = 0
//        l.lineBreakMode = .byWordWrapping
//        l.textAlignment = .left
//        l.text = "AddingGroupDateView101".localize()
//        return l
//    }()
    let nameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .left
        l.text = "AddingGroupDateView801".localize()
        return l
    }()
    let subNameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor1()
        l.font = UIFont.DeliusSystemType1()
        l.textAlignment = .left
        l.text = "AddingGroupDateView802".localize()
        return l
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    private func setup(){
        
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        
        self.addSubview(titleView)
        titleView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: topPadding + 60).isActive = true
        
        titleView.addSubview(titleImgView)
        titleImgView.centerYAnchor.constraint(equalTo: titleView.bottomAnchor,constant: -30).isActive = true
        titleImgView.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        titleImgView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        titleImgView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        titleView.addSubview(completeBtn)
        completeBtn.centerYAnchor.constraint(equalTo: titleImgView.centerYAnchor).isActive = true
        completeBtn.rightAnchor.constraint(equalTo: titleView.rightAnchor, constant: -30).isActive = true
        completeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        completeBtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: titleView.leftAnchor, constant: 30).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: titleView.rightAnchor, constant: -30).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        addSubview(subNameLabel)
        subNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        subNameLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        subNameLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        subNameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        addSubview(startLabel)
        startLabel.topAnchor.constraint(equalTo: subNameLabel.bottomAnchor, constant: 20).isActive = true
        startLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        startLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        startLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        addSubview(startLine)
        startLine.centerYAnchor.constraint(equalTo: startLabel.centerYAnchor).isActive = true
        startLine.widthAnchor.constraint(equalToConstant: 2).isActive = true
        startLine.heightAnchor.constraint(equalToConstant: 13).isActive = true
        startLine.leftAnchor.constraint(equalTo: startLabel.rightAnchor, constant: -5).isActive = true
        addSubview(startDateLabel)
        startDateLabel.centerYAnchor.constraint(equalTo: startLabel.centerYAnchor).isActive = true
        startDateLabel.leftAnchor.constraint(equalTo: startLine.rightAnchor, constant: 10).isActive = true
        startDateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(endLabel)
        endLabel.topAnchor.constraint(equalTo: startLabel.bottomAnchor, constant: 10).isActive = true
        endLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        endLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        endLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(endLine)
        endLine.centerYAnchor.constraint(equalTo: endLabel.centerYAnchor).isActive = true
        endLine.widthAnchor.constraint(equalToConstant: 2).isActive = true
        endLine.heightAnchor.constraint(equalToConstant: 13).isActive = true
        endLine.leftAnchor.constraint(equalTo: endLabel.rightAnchor, constant: -5).isActive = true
        
        addSubview(endDateLabel)
        endDateLabel.centerYAnchor.constraint(equalTo: endLabel.centerYAnchor).isActive = true
        endDateLabel.leftAnchor.constraint(equalTo: endLine.rightAnchor, constant: 10).isActive = true
        endDateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
//        addSubview(descriptionLabel)
//        descriptionLabel.topAnchor.constraint(equalTo: endDateLabel.bottomAnchor, constant: 2).isActive = true
//        descriptionLabel.leftAnchor.constraint(equalTo: endDateLabel.leftAnchor).isActive = true
//        descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor,constant:-30).isActive = true
//        descriptionLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true`

    }
}
