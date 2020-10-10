//
//  IconButton.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 04/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit

class IconButton1:UIButton{
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(imgName:String,color:UIColor,frame: CGRect) {
        super.init(frame:frame)
        translatesAutoresizingMaskIntoConstraints = false
        tintColor = color
        imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        setImage(UIImage(named: imgName), for: .normal)
        self.imageView!.contentMode = .scaleAspectFit
    }
}
class IconButton2:UIButton{
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    init(imgName:String,color:UIColor,frame: CGRect) {
        super.init(frame:frame)
        translatesAutoresizingMaskIntoConstraints = false
        tintColor = color
        imageEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        setImage(UIImage(named: imgName), for: .normal)
        self.imageView!.contentMode = .scaleAspectFit
    }
    
}

