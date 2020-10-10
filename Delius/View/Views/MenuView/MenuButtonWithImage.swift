//
//  MenuButtonWithImage.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/06.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class MenuButtonWithImage:UIButton{
    
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.tintColor = .white
        return v
    }()
    var txtLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.font = UIFont.DeliusBoldType2()
        l.textAlignment = .center
        return l
    }()
    
    required init?(coder:NSCoder){
        super.init(coder:coder)
    }
    init(txt:String,imgName:String,frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named:imgName)
        txtLabel.text = txt
        setup()
    }
    private func setup(){
        
        self.addSubview(imgView)
        imgView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imgView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.addSubview(txtLabel)
        txtLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        txtLabel.leftAnchor.constraint(equalTo: imgView.rightAnchor,constant: 10).isActive = true
        txtLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        txtLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
