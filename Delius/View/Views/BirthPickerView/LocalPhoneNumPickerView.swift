//
//  LocalPhoneNumPickerView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 10/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
final class LocalPhoneNumPickerView:UIView{
    
    let arrs = ["kr 082","kr 082","kr 082","kr 082","kr 082"]
    let titleLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "PhoneAuthView500".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType1(), txtColor: UIColor.MainBlackColor1())
        return l
    }()
    
    var pickView:UIPickerView={
        let pView = UIPickerView()
        pView.translatesAutoresizingMaskIntoConstraints = false
        return pView
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        setup(wd:frame.width)
    }
    private func setup(wd:CGFloat){
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.addSubview(pickView)
        pickView.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        pickView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        pickView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        pickView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
    }
}
