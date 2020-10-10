//
//  DuSignupSendSMSView.swift
//  Delius
//
//  Created by user on 2020/10/05.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class DuSignupSendSMSView:UIView{
    
    let titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.blackType1()
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .left
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        return l
    }()
    var pickerBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    var pickerLineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.grayType1()
        return v
    }()
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
    }
}
