//
//  TermsView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 04/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
final class TermsView:UIView{
    
    var cancelBtn:IconButton1!
    
    let titleLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "text", txtAlignment: .left, ft: UIFont.DeliusBoldType1(), txtColor: .white)
        return l
    }()
    var allCheckBtn:CircleButton!
    var checkBtn1:CircleButton!
    var checkBtn2:CircleButton!
    var checkBtn3:CircleButton!
    var linkBtn1:LineButton!
    var linkBtn2:LineButton!
    var linkBtn3:LineButton!
    
    var nextBtn:CircleButton!
    var nextTextBtn:UIButton={
        let b = UIButton()
        b.DeliusType1(txt: "ext", color: .white, backColor: .clear)
        return b
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        cancelBtn = IconButton1(imgName: "c", color: .white, frame: CGRect(x:0,y:0,width: 30,height:30))
        allCheckBtn = CircleButton(imgName: "c", color: .white, frame: CGRect(x:0,y:0,width:40,height:40))
        checkBtn1 = CircleButton(imgName: "c", color: .white, frame: CGRect(x:0,y:0,width:30,height:30))
        checkBtn2 = CircleButton(imgName: "c", color: .white, frame: CGRect(x:0,y:0,width:30,height:30))
        checkBtn3 = CircleButton(imgName: "c", color: .white, frame: CGRect(x:0,y:0,width:30,height:30))
        linkBtn1 = LineButton(txt: "c", color: .white, frame: CGRect(x:0,y:0,width: 120,height:120))
        linkBtn2 = LineButton(txt: "c", color: .white, frame: CGRect(x:0,y:0,width: 120,height:120))
        linkBtn3 = LineButton(txt: "c", color: .white, frame: CGRect(x:0,y:0,width: 120,height:120))
        
        nextBtn = CircleButton(imgName: "c", color: .white, frame: CGRect(x:0,y:0,width:40,height:40))
        
        setup()
    }
    private func setup(){
        self.addSubview(cancelBtn)
        cancelBtn.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        cancelBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        cancelBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cancelBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(allCheckBtn)
        allCheckBtn.topAnchor.constraint(equalTo: cancelBtn.bottomAnchor, constant: 80).isActive = true
        allCheckBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        allCheckBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        allCheckBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(checkBtn1)
        checkBtn1.topAnchor.constraint(equalTo: allCheckBtn.bottomAnchor, constant: 50).isActive = true
        checkBtn1.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        checkBtn1.widthAnchor.constraint(equalToConstant: 30).isActive = true
        checkBtn1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(checkBtn2)
        checkBtn2.topAnchor.constraint(equalTo: checkBtn1.bottomAnchor, constant: 15).isActive = true
        checkBtn2.rightAnchor.constraint(equalTo: checkBtn1.rightAnchor).isActive = true
        checkBtn2.widthAnchor.constraint(equalToConstant: 30).isActive = true
        checkBtn2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(checkBtn3)
        checkBtn3.topAnchor.constraint(equalTo: checkBtn2.bottomAnchor,constant: 15).isActive = true
        checkBtn3.rightAnchor.constraint(equalTo: checkBtn1.rightAnchor).isActive = true
        checkBtn3.widthAnchor.constraint(equalToConstant: 30).isActive = true
        checkBtn3.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(titleLabel)
        titleLabel.bottomAnchor.constraint(equalTo: allCheckBtn.bottomAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: allCheckBtn.leftAnchor, constant: -20).isActive = true
        
        self.addSubview(linkBtn1)
        linkBtn1.centerYAnchor.constraint(equalTo: checkBtn1.centerYAnchor).isActive = true
        linkBtn1.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        linkBtn1.rightAnchor.constraint(equalTo: checkBtn1.leftAnchor, constant: -10).isActive = true
        linkBtn1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(linkBtn2)
        linkBtn2.centerYAnchor.constraint(equalTo: checkBtn2.centerYAnchor).isActive = true
        linkBtn2.leftAnchor.constraint(equalTo: linkBtn1.leftAnchor).isActive = true
        linkBtn2.rightAnchor.constraint(equalTo: linkBtn1.rightAnchor).isActive = true
        linkBtn2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(linkBtn3)
        linkBtn3.centerYAnchor.constraint(equalTo: checkBtn3.centerYAnchor).isActive = true
        linkBtn3.leftAnchor.constraint(equalTo: linkBtn1.leftAnchor).isActive = true
        linkBtn3.rightAnchor.constraint(equalTo: linkBtn1.rightAnchor).isActive = true
        linkBtn3.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(nextBtn)
        nextBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nextBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        nextBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(nextTextBtn)
        nextTextBtn.centerYAnchor.constraint(equalTo: nextBtn.centerYAnchor).isActive = true
        nextTextBtn.rightAnchor.constraint(equalTo: nextBtn.leftAnchor, constant: -20).isActive = true
        nextTextBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nextTextBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
}
