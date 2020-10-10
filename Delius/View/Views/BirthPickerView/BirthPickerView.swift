//
//  BirthPickerView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 08/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
final class BirthPickerView:UIView{
    let pickerView:UIPickerView={
        let v = UIPickerView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    private let titleLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "ProfileAuthView105".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType1(), txtColor: UIColor.MainBlackColor1())
        return l
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        setup(frame: frame)
    }
    private func setup(frame:CGRect){
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        self.addSubview(pickerView)
        pickerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        pickerView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        pickerView.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
    }
    
}
