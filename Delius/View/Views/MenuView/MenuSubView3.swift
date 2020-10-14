//
//  MenuSubView3.swift
//  Delius
//
//  Created by 박진호 on 2020/10/13.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class MenuSubView3:UIButton{
    
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.clipsToBounds = true
        v.tintColor = .white
        return v
    }()
    var txtLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.black
        l.font = UIFont.DeliusBoldType4()
        l.textAlignment = .center
        l.text = "MenuView302".localize()
        l.baselineAdjustment = .alignBaselines
        return l
    }()
    let subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .MainGrayColor()
        l.font = UIFont.DeliusSystemType3()
        l.textAlignment = .center
        l.text = "BuyDeliBtn102".toLocal()
        return l
    }()
    required init?(coder:NSCoder){
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = frame.height/6
        self.clipsToBounds = true
        imgView.image = UIImage(named: "BuyDeli")
        setup()
    }
    private func setup(){
        let textWidth = "MenuView0301".localize().StringWidth(withConstrainedHeight: 30, font: UIFont.DeliusBoldType2())
        self.addSubview(txtLabel)
        txtLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        txtLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        txtLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        txtLabel.widthAnchor.constraint(equalToConstant: textWidth+15).isActive = true
        
        self.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: txtLabel.bottomAnchor, constant: 5).isActive = true
        subLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        self.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: txtLabel.topAnchor).isActive = true
        imgView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
    }
}
