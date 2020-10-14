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
        let size = frame.width - 8
        self.backgroundColor = UIColor.clear
        self.font = UIFont.systemFont(ofSize: size)
        self.textColor = UIColor.MainGrayColor()
        self.textAlignment = .center
        self.keyboardType = .numberPad
    }
    
}
