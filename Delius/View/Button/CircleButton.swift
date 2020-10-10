//
//  CircleButton.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 04/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit

class CircleButton:UIButton{
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(imgName:String,color:UIColor,frame: CGRect) {
        super.init(frame:frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = 2
        layer.borderColor = color.cgColor
        layer.cornerRadius = frame.height/2
        tintColor = color
        setImage(UIImage(named: imgName), for: .normal)
    }
}
