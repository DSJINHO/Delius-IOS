//
//  VerificationTextField.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 13/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
final class VerificationTextField:UITextField{
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 5
        let size = frame.width - 8
        self.backgroundColor = UIColor.clear
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.MainLightGrayColor().cgColor
        self.font = UIFont.systemFont(ofSize: size)
        self.textColor = UIColor.MainGrayColor()
        self.textAlignment = .center
        self.keyboardType = .numberPad
    }
    
}
