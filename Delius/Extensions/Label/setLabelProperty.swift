//
//  setProperty.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 02/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import Foundation
import UIKit
extension UILabel{
    func DeliusLabel(txt:String,txtAlignment:NSTextAlignment,ft:UIFont,txtColor:UIColor){
        translatesAutoresizingMaskIntoConstraints = false
        text = txt
        textColor = txtColor
        font = ft
        textAlignment = txtAlignment
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
    }
    func TagCellLabel(alignment:NSTextAlignment,ft:UIFont){
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = alignment
        font = ft
    }
    
    
}
