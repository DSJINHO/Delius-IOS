//
//  MainFourButton.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 16/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//
import UIKit
class MainFourButton:UIButton{
    
    
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.tintColor = UIColor.MainBlackColor2()
        return v
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(imgName:String,frame: CGRect) {
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named: imgName)
        setup()
    }
    private func setup(){
        self.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: topAnchor, constant: 7).isActive = true
        imgView.leftAnchor.constraint(equalTo: leftAnchor, constant: 7).isActive = true
        imgView.rightAnchor.constraint(equalTo: rightAnchor, constant: -7).isActive = true
        imgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7).isActive = true
    }
}
