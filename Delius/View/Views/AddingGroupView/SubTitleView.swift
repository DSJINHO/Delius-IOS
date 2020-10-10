//
//  SubTitleView.swift
//  Delius
//
//  Created by 박진호 on 2020/06/14.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SubTitleView:UIButton{
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        return v
    }()
    var contentLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor1()
        l.textAlignment = .left
        l.font = UIFont.DeliusBoldType1()
        return l
    }()
    var subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.textAlignment = .left
        l.font = UIFont.DeliusSystemType2()
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.baselineAdjustment = .alignBaselines
        return l
    }()
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    init(imgName:String,title:String,subTitle:String,frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        imgView.image = UIImage(named: imgName)
        contentLabel.text = title
        subLabel.text = subTitle
        setup()
        
    }
    private func setup(){
        self.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(contentLabel)
        contentLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentLabel.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 10).isActive = true
        contentLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        contentLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        
        self.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor).isActive = true
        subLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        subLabel.leftAnchor.constraint(equalTo: contentLabel.leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: contentLabel.rightAnchor).isActive = true
        
        
    }
}
