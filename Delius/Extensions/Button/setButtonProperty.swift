//
//  setProperty.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 02/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
extension UIButton{
    func DeliusType1(txt:String,color:UIColor,backColor:UIColor){
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(txt, for: .normal)
        self.titleLabel!.font = UIFont.DeliusBoldType2()
        setTitleColor(color, for: .normal)
        backgroundColor = backColor
    }
    func DeliusTeyp2(img:UIImage,tint:UIColor){
        translatesAutoresizingMaskIntoConstraints = false
        setImage(img, for: .normal)
        tintColor = tint
        contentMode = .scaleAspectFit
    }
    func DeliusType3(txt:String,color:UIColor,backColor:UIColor){
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(txt, for: .normal)
        self.titleLabel!.font = UIFont.DeliusSystemType1()
        setTitleColor(color, for: .normal)
        backgroundColor = backColor
    }
    func DeliusType4(txt:String,color:UIColor,backColor:UIColor){
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(txt, for: .normal)
        self.titleLabel!.font = UIFont.DeliusSystemType2()
        setTitleColor(color, for: .normal)
        backgroundColor = backColor
    }
    func BtnBlackType(txt:String){
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(txt, for: .normal)
        self.titleLabel!.font = UIFont.DeliusBoldType6()
        setTitleColor(.white, for: .normal)
        backgroundColor = .black
        
        
    }
    func BtnWhiteType(txt:String){
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(txt, for: .normal)
        self.titleLabel!.font = UIFont.DeliusBoldType6()
        setTitleColor(.black, for: .normal)
        backgroundColor = .white
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
    }
    func BtnGrayType(txt:String){
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(txt, for: .normal)
        self.titleLabel!.font = UIFont.DeliusBoldType6()
        setTitleColor(.white, for: .normal)
        backgroundColor = .MainLightGrayColor()
        self.titleLabel?.textColor = .white
    }
    func BtnWhiteTextGrayType(txt:String){
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(txt, for: .normal)
        self.titleLabel!.font = UIFont.DeliusBoldType2()
        setTitleColor(.MainGrayColor(), for: .normal)
        backgroundColor = .clear
    }
    func BtnImgTint(img:UIImage,tint:UIColor){
        translatesAutoresizingMaskIntoConstraints = false
        setImage(img, for: .normal)
        tintColor = tint
        contentMode = .scaleAspectFit
    }

}

