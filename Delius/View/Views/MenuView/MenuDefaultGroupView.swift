//
//  MenuDefaultGroupView.swift
//  Delius
//
//  Created by 박진호 on 2020/07/02.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class MenuDefaultGroupView:UIView{
    private let label:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "MenuGroupView001".localize()
        l.textColor = UIColor.white
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .center
        return l
    }()
    private let imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "MenuGroupEmpty")
        v.contentMode = .scaleAspectFit
        v.tintColor = UIColor.white
        return v
    }()
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    private func setup(){
        self.addSubview(label)
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        self.addSubview(imgView)
        imgView.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -25).isActive = true
        imgView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
