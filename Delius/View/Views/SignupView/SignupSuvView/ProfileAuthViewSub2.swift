//
//  ProfileAuthViewSub2.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 03/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//
import UIKit

class ProfileAuthViewSub2:UIView{
    var titleLabel:UILabel!
    var InputView:UIButton={
        let v = UIButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var inputLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "", txtAlignment: .left, ft: UIFont.DeliusSystemType2(), txtColor: .MainGrayColor())
        return l
    }()
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
        inputLabel.text = ph_txt
        
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
        
        self.addSubview(InputView)
        InputView.centerYAnchor.constraint(equalTo: lineView.centerYAnchor).isActive = true
        InputView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor,constant: 15).isActive = true
        InputView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        InputView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        InputView.addSubview(inputLabel)
        inputLabel.topAnchor.constraint(equalTo: InputView.topAnchor).isActive = true
        inputLabel.rightAnchor.constraint(equalTo: InputView.rightAnchor).isActive = true
        inputLabel.leftAnchor.constraint(equalTo: InputView.leftAnchor).isActive = true
        inputLabel.bottomAnchor.constraint(equalTo: InputView.bottomAnchor).isActive = true
        
    }
}
