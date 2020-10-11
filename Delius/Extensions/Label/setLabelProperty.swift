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
    func MainLabel(txt:String,txtAlignment:NSTextAlignment, fnt:UIFont){
        translatesAutoresizingMaskIntoConstraints = false
        text = txt
        font = fnt
        self.textColor = UIColor.MainBlackColor()
        textAlignment = txtAlignment
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        
    }
    func SubLabel(txt:String,txtAlignment:NSTextAlignment, fnt:UIFont){
        translatesAutoresizingMaskIntoConstraints = false
        text = txt
        font = fnt
        self.textColor = UIColor.MainBlackColor()
        textAlignment = txtAlignment
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
    }
    func pointLabel(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemYellow
    }
    func alertLabel(txt:String,txtAlignment:NSTextAlignment, fnt:UIFont,color:UIColor){
        translatesAutoresizingMaskIntoConstraints = false
        text = txt
        font = fnt
        self.textColor = color
        textAlignment = txtAlignment
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        
    }
    
}
