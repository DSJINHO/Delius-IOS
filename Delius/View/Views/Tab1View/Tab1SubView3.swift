//
//  Tab1SubView3.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 18/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Tab1SubView3:UIView{
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.tintColor = UIColor.MainBlackColor1()
        return v
    }()
    var label:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor1()
        l.font = UIFont.DeliusSystemType2()
        l.textAlignment = .center
        return l
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(txt:String,imgName:String,frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named: imgName)
        label.text = txt
        setup()
    }
    private func setup(){
        self.addSubview(imgView)
        imgView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imgView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.addSubview(label)
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 10).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
}
