//
//  Tab0TitleLabel.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 16/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
extension UILabel{
    func Tab0TitleLabelProperty(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = UIColor.MainBlackColor()
        self.font = UIFont.DeliusBoldType5()
        self.textAlignment = .left
    }
    func Tab0SubLabelProperty(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = UIColor.MainBlackColor()
        self.font = UIFont.DeliusSystemType2()
        self.textAlignment = .left
    }
    
}
