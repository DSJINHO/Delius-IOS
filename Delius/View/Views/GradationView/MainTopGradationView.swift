//
//  MainTopGradationView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 16/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
final class MainTopGradationView: UIView{
    let whiteView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.clear
        return v
    }()
    let logoImageView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "StringLogo")
        v.tintColor = UIColor.MainBlackColor()
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    var menuBtn:IconButton1!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = false
        menuBtn = IconButton1(imgName: "List", color: UIColor.black, frame: CGRect(x:0,y:0,width:30,height:30))
        setup(frame: frame)
    }
    func setup(frame:CGRect){
        self.addSubview(whiteView)
        whiteView.bottomAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        whiteView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        whiteView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        
        whiteView.addSubview(logoImageView)
        logoImageView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor,constant: -5).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        
        self.addSubview(menuBtn)
        menuBtn.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor).isActive = true
        menuBtn.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        menuBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        menuBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
}
