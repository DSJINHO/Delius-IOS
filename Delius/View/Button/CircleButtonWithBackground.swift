//
//  CircleButtonWithBackground.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 07/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit

class CircleButtonWithBackground:UIButton{
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(imgName:String,tintColor:UIColor,backColor:UIColor,frame: CGRect) {
        super.init(frame:frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = frame.height/2
        self.tintColor = tintColor
        backgroundColor = backColor
        setImage(UIImage(named: imgName), for: .normal)
    }
}
