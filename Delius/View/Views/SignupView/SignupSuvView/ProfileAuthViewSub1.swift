//
//  ProfileAuthViewSub1.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 03/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//
import UIKit
class ProfileAuthViewSub1:UIView{
    var titleLabel:UILabel!
    var textField:UITextField!
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.clear
        v.layer.cornerRadius = 15
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.MainLightGrayColor().cgColor
        v.clipsToBounds = true
        return v
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(txt:String,ph_txt:String,frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        titleLabel = UILabel()
        titleLabel.DeliusLabel(txt: txt, txtAlignment: .left, ft: UIFont.DeliusBoldType4(), txtColor: .MainGrayColor())
        textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = ph_txt
        textField.textColor = UIColor.MainBlackColor2()
        textField.font = UIFont.DeliusSystemType2()
        
        setup()
    }
    private func setup(){
        
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor,constant: 30).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(lineView)
        lineView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        lineView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        lineView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(textField)
        textField.centerYAnchor.constraint(equalTo: lineView.centerYAnchor).isActive = true
        textField.leftAnchor.constraint(equalTo: titleLabel.leftAnchor,constant: 15).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
}
