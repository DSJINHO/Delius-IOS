//
//  ReportSubBtn.swift
//  Delius
//
//  Created by 박진호 on 2020/06/15.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class ReportSubBtn:UIButton{
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        return v
    }()
    var txtLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .MainBlackColor()
        l.font = UIFont.DeliusSystemType3()
        l.textAlignment = .center
        return l
    }()
    required init?(coder:NSCoder){
        super.init(coder:coder)
    }
    init(imgName:String,txt:String,frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named: imgName)
        txtLabel.text = txt
        setup(width:frame.width)
    }
    private func setup(width:CGFloat){
        self.addSubview(imgView)
        imgView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: width/2).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: width/2).isActive = true
        imgView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        self.addSubview(txtLabel)
        txtLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor).isActive = true
        txtLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        txtLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        txtLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
