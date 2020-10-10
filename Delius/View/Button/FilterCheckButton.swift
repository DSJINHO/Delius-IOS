//
//  FilterCheckButton.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/05/31.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class FilterCheckButton:UIButton{
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.tintColor = UIColor.MainBlackColor1()
        v.image = UIImage(named:"Check")
        v.alpha = 0
        return v
    }()
    var contentLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor1()
        l.textAlignment = .center
        l.font = UIFont.DeliusBoldType2()
        return l
    }()
    
    required init?(coder:NSCoder){
        super.init(coder:coder)
    }
    init(txt:String,frame:CGRect){
        super.init(frame:frame)
        self.layer.cornerRadius = 3
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.MainBlackColor1().cgColor
        self.translatesAutoresizingMaskIntoConstraints = false
        
        contentLabel.text = txt
        let strWd = txt.StringWidth(withConstrainedHeight: 50, font: UIFont.DeliusBoldType2())
        setup(wd:strWd)
    }
    private func setup(wd:CGFloat){
        
        self.addSubview(contentLabel)
        contentLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        contentLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contentLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        contentLabel.widthAnchor.constraint(equalToConstant: wd).isActive = true
        
        self.addSubview(imgView)
        imgView.rightAnchor.constraint(equalTo: contentLabel.leftAnchor, constant: -10).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imgView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
