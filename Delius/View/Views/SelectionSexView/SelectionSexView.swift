//
//  SelectionSexView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 10/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//
import UIKit
final class SelectionSexView:UIView{
    let titleLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "ProfileAuthView104".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType1(), txtColor: UIColor.MainBlackColor1())
        return l
    }()
    var btn1:UIButton={
        let b = UIButton()
        b.DeliusType1(txt: "Man".localize(), color: .white, backColor: .MainBlackColor3())
        b.layer.cornerRadius = 5
        return b
    }()
    
    var btn2:UIButton={
        let b = UIButton()
        b.DeliusType1(txt: "Woman".localize(), color: .white, backColor: .MainBlackColor3())
        b.layer.cornerRadius = 5
        return b
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        setup(width: frame.width)
    }
    private func setup(width:CGFloat){
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        self.addSubview(btn1)
        btn1.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        btn1.rightAnchor.constraint(equalTo: centerXAnchor, constant: -20).isActive = true
        btn1.widthAnchor.constraint(equalToConstant: width/2 - 60).isActive = true
        btn1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.addSubview(btn2)
        btn2.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        btn2.leftAnchor.constraint(equalTo: centerXAnchor).isActive = true
        btn2.widthAnchor.constraint(equalToConstant: width/2 - 60).isActive = true
        btn2.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
