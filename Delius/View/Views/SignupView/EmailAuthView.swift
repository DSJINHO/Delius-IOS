//
//  EmailAuthView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 03/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//
import UIKit
final class EmailAuthView:UIView{
    let titleLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "EmailAuthView001".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType4(), txtColor: .MainGrayColor())
        return l
    }()
    let titleLabel2:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "EmailAuthView002".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType4(), txtColor: .MainGrayColor())
        return l
    }()
    
    //let subLabel:UILabel={
    //    let l = UILabel()
    //    l.DeliusLabel(txt: "EmailAuthView002".localize(), txtAlignment: .left, ft: UIFont.DeliusSystemType2(), txtColor: .MainGrayColor())
    //    return l
    //}()
    var emailView:EmailAuthSubView!
    var passwordView1:EmailAuthSubView!
    var passwordView2:EmailAuthSubView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        let subRect = CGRect(x:0,y:0,width:frame.width,height:50)
        emailView = EmailAuthSubView(ph_txt: "EmailAuthView300".localize(), frame: subRect)
        passwordView1 = EmailAuthSubView(ph_txt: "EmailAuthView301".localize(), frame: subRect)
        passwordView2 = EmailAuthSubView(ph_txt: "EmailAuthView302".localize(), frame: subRect)
        
        passwordView1.edt.isSecureTextEntry = true
        passwordView2.edt.isSecureTextEntry = true
        
        setup(frame:frame)
    }
    private func setup(frame:CGRect){
        let title_str = "EmailAuthView001".localize()
        let title_height = title_str.StringHeight(withConstrainedWidth: frame.width - 60, font: UIFont.DeliusBoldType4())
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor,constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: title_height).isActive = true
        
        let sub_str = "EmailAuthView002".localize()
        let sub_height = sub_str.StringHeight(withConstrainedWidth: frame.width - 60, font: UIFont.DeliusBoldType4())
        //self.addSubview(subLabel)
        //subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        //subLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        //subLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        //subLabel.heightAnchor.constraint(equalToConstant: sub_height).isActive = true
        
        self.addSubview(emailView)
        emailView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        emailView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        emailView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        emailView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(titleLabel2)
        titleLabel2.topAnchor.constraint(equalTo: emailView.bottomAnchor,constant: 20).isActive = true
        titleLabel2.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        titleLabel2.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        titleLabel2.heightAnchor.constraint(equalToConstant: sub_height).isActive = true
        
        self.addSubview(passwordView1)
        passwordView1.topAnchor.constraint(equalTo: titleLabel2.bottomAnchor,constant: 10).isActive = true
        passwordView1.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        passwordView1.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        passwordView1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.addSubview(passwordView2)
        passwordView2.topAnchor.constraint(equalTo: passwordView1.bottomAnchor).isActive = true
        passwordView2.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        passwordView2.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        passwordView2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
}
