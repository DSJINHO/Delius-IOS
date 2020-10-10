//
//  BorderTextField.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 03/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit

class BorderTextField:UITextField{
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(ph_txt:String,color:UIColor,frame: CGRect) {
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = color
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 4
        self.layer.cornerRadius = 10
        self.textAlignment = .center
        setup(color:color)
    }
    private func setup(color:UIColor){
    }
}
