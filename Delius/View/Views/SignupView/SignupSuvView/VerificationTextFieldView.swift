//
//  VerificationTextFieldView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 13/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//
import UIKit
final class VerificationTextFieldView:UIView{
    
    var tf1,tf2,tf3,tf4,tf5,tf6:VerifyTextField!
    
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        let term:CGFloat = 10
        let width = ( frame.width - 62 - term*5 )/6
        let height = frame.height
        let fieldFrame = CGRect(x:0,y:0,width:width,height: height)
        
        tf1 = VerifyTextField(frame: fieldFrame)
        tf2 = VerifyTextField(frame: fieldFrame)
        tf3 = VerifyTextField(frame: fieldFrame)
        tf4 = VerifyTextField(frame: fieldFrame)
        tf5 = VerifyTextField(frame: fieldFrame)
        tf6 = VerifyTextField(frame:fieldFrame)
        
        setup(width:width,term:term,height:height - 20)
    }
    private func setup(width:CGFloat,term:CGFloat,height:CGFloat){
        
        self.addSubview(tf1)
        tf1.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tf1.leftAnchor.constraint(equalTo: leftAnchor,constant: 40).isActive = true
        tf1.widthAnchor.constraint(equalToConstant: width).isActive = true
        tf1.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.addSubview(tf2)
        tf2.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tf2.leftAnchor.constraint(equalTo: tf1.rightAnchor, constant: term).isActive = true
        tf2.widthAnchor.constraint(equalToConstant: width).isActive = true
        tf2.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.addSubview(tf3)
        tf3.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tf3.leftAnchor.constraint(equalTo: tf2.rightAnchor, constant: term).isActive = true
        tf3.widthAnchor.constraint(equalToConstant: width).isActive = true
        tf3.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.addSubview(tf4)
        tf4.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tf4.leftAnchor.constraint(equalTo: tf3.rightAnchor, constant: term).isActive = true
        tf4.widthAnchor.constraint(equalToConstant: width).isActive = true
        tf4.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.addSubview(tf5)
        tf5.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tf5.leftAnchor.constraint(equalTo: tf4.rightAnchor, constant: term).isActive = true
        tf5.heightAnchor.constraint(equalToConstant: height).isActive = true
        tf5.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.addSubview(tf6)
        tf6.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tf6.heightAnchor.constraint(equalToConstant: height).isActive = true
        tf6.widthAnchor.constraint(equalToConstant: width).isActive = true
        tf6.leftAnchor.constraint(equalTo: tf5.rightAnchor, constant: term).isActive = true
    }
}
