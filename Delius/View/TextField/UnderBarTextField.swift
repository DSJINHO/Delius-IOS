//
//  UnderBarTextField.swift
//  Delius
//
//  Created by 박진호 on 2020/06/25.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

class UnderBarTextField:UITextField{
    
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.clear
        v.layer.cornerRadius = 15
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.MainLightGrayColor().cgColor
        v.clipsToBounds = true
        return v
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(ph_txt:String,color:UIColor,frame: CGRect) {
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = ph_txt
        self.textColor = color
        self.textAlignment = .left
        self.textColor = UIColor.MainGrayColor()
        self.font = UIFont.DeliusSystemType1()
        setup()
    }
    private func setup(){
        self.addSubview(lineView)
        lineView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: leftAnchor, constant: -15).isActive = true
        lineView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
