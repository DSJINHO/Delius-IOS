//
//  UnderBarTextField.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 03/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit

class LightBoderTextField:UITextField{
    
    
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
        
    }
}
