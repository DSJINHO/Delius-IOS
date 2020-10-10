//
//  MenuTitleView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/05.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class MenuTitleView:UIView{
    var titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType0()
        l.textAlignment = .left
        return l
    }()
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    required init?(coder:NSCoder){
        super.init(coder:coder)
    }
    init(txt:String,white:Bool,frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = txt
        if white{
            titleLabel.textColor = UIColor.white
            lineView.backgroundColor = .white
        }else{
            titleLabel.textColor = UIColor.MainBlackColor1()
            lineView.backgroundColor = UIColor.MainBlackColor1()
        }
        setup()
    
    }
    private func setup(){
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(lineView)
        lineView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        lineView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 5).isActive = true
    }
}
