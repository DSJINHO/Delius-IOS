//
//  TermView.swift
//  Delius
//
//  Created by user on 2020/08/05.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class TermView:UIView{
    var gradationView:MainGradientView!
    var backBtn:IconButton1!
    
    let titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.textAlignment = .left
        l.font = UIFont.DeliusBoldType1()
        l.text = "TermView001".localize()
        return l
    }()
    var allBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.cornerRadius = 15
        b.layer.borderColor = UIColor.white.cgColor
        b.layer.borderWidth = 2
        b.setImage(UIImage(named: "Check"), for: .normal)
        b.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        b.tintColor = UIColor.white
        return b
    }()
    
    var termBtn1:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("TermView101".localize(), for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.font = UIFont.DeliusBoldType1()
        b.titleLabel?.textAlignment = .left
        return b
    }()
    var termBtn2:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("TermView201".localize(), for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.font = UIFont.DeliusBoldType1()
        b.titleLabel?.textAlignment = .left
        return b
    }()
    var termBtn3:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("TermView301".localize(), for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.font = UIFont.DeliusBoldType1()
        b.titleLabel?.textAlignment = .left
        return b
    }()
    
    var checkBtn1:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.cornerRadius = 15
        b.layer.borderColor = UIColor.white.cgColor
        b.layer.borderWidth = 2
        b.setImage(UIImage(named: "Check"), for: .normal)
        b.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        b.tintColor = UIColor.white
        return b
    }()
    var checkBtn2:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.cornerRadius = 15
        b.layer.borderColor = UIColor.white.cgColor
        b.layer.borderWidth = 2
        b.setImage(UIImage(named: "Check"), for: .normal)
        b.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        b.tintColor = UIColor.white
        return b
    }()
    var checkBtn3:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.cornerRadius = 15
        b.layer.borderColor = UIColor.white.cgColor
        b.layer.borderWidth = 2
        b.setImage(UIImage(named: "Check"), for: .normal)
        b.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        b.tintColor = UIColor.white
        return b
    }()
    let lineView1:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        return v
    }()
    let lineView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        return v
    }()
    let lineView3:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        return v
    }()
    
    
    let nextLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.textAlignment = .right
        l.font = UIFont.DeliusBoldType1()
        l.text = "Next"
        return l
    }()
    let nextBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.cornerRadius = 25
        b.layer.borderColor = UIColor.white.cgColor
        b.layer.borderWidth = 4
        b.setImage(UIImage(named: "MainRight"), for: .normal)
        b.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        b.tintColor = UIColor.white
        return b
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        backBtn = IconButton1(imgName: "c", color: .white, frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        gradationView = MainGradientView(frame: frame)
        setup()
    }
    private func setup(){
        self.addSubview(gradationView)
        gradationView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        gradationView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        gradationView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        gradationView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let btmPadding = window.safeAreaInsets.bottom
        self.addSubview(backBtn)
        backBtn.centerYAnchor.constraint(equalTo: topAnchor, constant: topPadding + 30).isActive = true
        backBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(allBtn)
        allBtn.topAnchor.constraint(equalTo: backBtn.bottomAnchor, constant: 150).isActive = true
        allBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        allBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        allBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: allBtn.centerYAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: allBtn.leftAnchor, constant: -30).isActive = true
        
        let term1Width = "TermView101".localize().StringWidth(withConstrainedHeight: 30, font: UIFont.DeliusBoldType1())
        self.addSubview(termBtn1)
        termBtn1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        termBtn1.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        termBtn1.widthAnchor.constraint(equalToConstant: term1Width).isActive = true
        termBtn1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        let term2Width = "TermView201".localize().StringWidth(withConstrainedHeight: 30, font: UIFont.DeliusBoldType1())
        self.addSubview(termBtn2)
        termBtn2.topAnchor.constraint(equalTo: termBtn1.bottomAnchor, constant: 20).isActive = true
        termBtn2.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        termBtn2.widthAnchor.constraint(equalToConstant: term2Width).isActive = true
        termBtn2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        let term3Width = "TermView301".localize().StringWidth(withConstrainedHeight: 30, font: UIFont.DeliusBoldType1())
        self.addSubview(termBtn3)
        termBtn3.topAnchor.constraint(equalTo: termBtn2.bottomAnchor,constant: 20).isActive = true
        termBtn3.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        termBtn3.widthAnchor.constraint(equalToConstant: term3Width).isActive = true
        termBtn3.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(checkBtn1)
        checkBtn1.centerYAnchor.constraint(equalTo: termBtn1.centerYAnchor).isActive = true
        checkBtn1.rightAnchor.constraint(equalTo: allBtn.rightAnchor).isActive = true
        checkBtn1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        checkBtn1.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(checkBtn2)
        checkBtn2.centerYAnchor.constraint(equalTo: termBtn2.centerYAnchor).isActive = true
        checkBtn2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        checkBtn2.widthAnchor.constraint(equalToConstant: 30).isActive = true
        checkBtn2.rightAnchor.constraint(equalTo: allBtn.rightAnchor).isActive = true
        
        self.addSubview(checkBtn3)
        checkBtn3.centerYAnchor.constraint(equalTo: termBtn3.centerYAnchor).isActive = true
        checkBtn3.heightAnchor.constraint(equalToConstant: 30).isActive = true
        checkBtn3.widthAnchor.constraint(equalToConstant: 30).isActive = true
        checkBtn3.rightAnchor.constraint(equalTo: allBtn.rightAnchor).isActive = true
        
        
        self.addSubview(lineView1)
        lineView1.topAnchor.constraint(equalTo: termBtn1.bottomAnchor).isActive = true
        lineView1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView1.leftAnchor.constraint(equalTo: termBtn1.leftAnchor).isActive = true
        lineView1.rightAnchor.constraint(equalTo: termBtn1.rightAnchor).isActive = true
        
        self.addSubview(lineView2)
        lineView2.topAnchor.constraint(equalTo: termBtn2.bottomAnchor).isActive = true
        lineView2.leftAnchor.constraint(equalTo: termBtn2.leftAnchor).isActive = true
        lineView2.rightAnchor.constraint(equalTo: termBtn2.rightAnchor).isActive = true
        lineView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.addSubview(lineView3)
        lineView3.topAnchor.constraint(equalTo: termBtn3.bottomAnchor).isActive = true
        lineView3.leftAnchor.constraint(equalTo: termBtn3.leftAnchor).isActive = true
        lineView3.rightAnchor.constraint(equalTo: termBtn3.rightAnchor).isActive = true
        lineView3.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.addSubview(nextBtn)
        nextBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        nextBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -btmPadding - 30).isActive = true
        
        self.addSubview(nextLabel)
        nextLabel.centerYAnchor.constraint(equalTo: nextBtn.centerYAnchor).isActive = true
        nextLabel.rightAnchor.constraint(equalTo: nextBtn.leftAnchor, constant: -15).isActive = true
        nextLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nextLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        
        
        
    }
}
