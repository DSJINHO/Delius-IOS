//
//  EmailAuthSubView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 04/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class EmailAuthSubView:UIView{
    
    //var titleLabel:UILabel!
    let emailView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var edt:LightBoderTextField!
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
    var subLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "", txtAlignment: .left, ft: UIFont.DeliusSystemType1(), txtColor: .red)
        l.alpha = 0
        return l
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(ph_txt:String,frame:CGRect){
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        //titleLabel = UILabel()
        //titleLabel.DeliusLabel(txt: txt, txtAlignment: .left, ft: UIFont.DeliusBoldType2(), txtColor: .black)
        
        edt = LightBoderTextField(ph_txt: ph_txt, color: .black, frame: CGRect(x:0,y:0,width: frame.width - 75,height:30))
        setup()
    }
    private func setup(){
        self.addSubview(emailView)
        emailView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        emailView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        emailView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        emailView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        emailView.addSubview(lineView)
        lineView.centerYAnchor.constraint(equalTo: emailView.centerYAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        lineView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        emailView.addSubview(edt)
        edt.centerYAnchor.constraint(equalTo: lineView.centerYAnchor).isActive = true
        edt.leftAnchor.constraint(equalTo: leftAnchor, constant: 45).isActive = true
        edt.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        edt.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: emailView.bottomAnchor).isActive = true
        subLabel.leftAnchor.constraint(equalTo: edt.leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: edt.rightAnchor).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
}
