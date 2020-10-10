//
//  PurchaseSubBtn.swift
//  Delius
//
//  Created by user on 2020/09/04.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class PurchaseSubBtn:UIButton{
    
    
    var countLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.boldSystemFont(ofSize: 35)
        l.textAlignment = .center
        return l
    }()
    var subLabel1:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.lightGray
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 13)
        l.text = "PurchaseDeliString100".localize()
        return l
    }()
    var costLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.boldSystemFont(ofSize: 17)
        l.textAlignment = .center
        return l
    }()
    var perLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.lightGray
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 12)
        return l
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
    }
    init(frame:CGRect,tint:UIColor,str1:String,str2:String,str3:String){
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        countLabel.textColor = tint
        costLabel.textColor = tint
        countLabel.text = str1
        costLabel.text = str2
        perLabel.text = str3
        setup()
    }
    private func setup(){
        self.addSubview(countLabel)
        countLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        countLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        countLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        countLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(subLabel1)
        subLabel1.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 5).isActive = true
        subLabel1.heightAnchor.constraint(equalToConstant: 15).isActive = true
        subLabel1.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        subLabel1.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        self.addSubview(costLabel)
        costLabel.topAnchor.constraint(equalTo: subLabel1.bottomAnchor,constant: 5).isActive = true
        costLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        costLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        costLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.addSubview(perLabel)
        perLabel.topAnchor.constraint(equalTo: costLabel.bottomAnchor,constant: 5).isActive = true
        perLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        perLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        perLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
}
