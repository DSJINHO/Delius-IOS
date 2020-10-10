//
//  AppSettingStatusView.swift
//  Delius
//
//  Created by user on 2020/07/21.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class AppSettingStatusView:UIView{
    
    var logoutBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    var pauseBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    var withdrawBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    let logoutLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.font = UIFont.DeliusBoldType2()
        l.textAlignment = .left
        l.text = "Logout".localize()
        return l
    }()
    let pauseLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.font = UIFont.DeliusBoldType2()
        l.textAlignment = .left
        l.text = "Pause".localize()
        return l
    }()
    let withdrawLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.font = UIFont.DeliusBoldType2()
        l.textAlignment = .left
        l.text = "Withdraw".localize()
        return l
    }()
    
    let logoutArrow:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "RightArrow")
        v.contentMode = .scaleAspectFit
        v.tintColor = UIColor.MainBlackColor2()
        return v
    }()
    let pauseArrow:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "RightArrow")
        v.contentMode = .scaleAspectFit
        v.tintColor = UIColor.MainBlackColor2()
        return v
    }()
    let withdrawArrow:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "RightArrow")
        v.contentMode = .scaleAspectFit
        v.tintColor = UIColor.MainBlackColor2()
        return v
    }()
    
    let lineView1:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.gray
        v.alpha = 0.2
        return v
    }()
    let lineView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.gray
        v.alpha = 0.2
        return v
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    private func setup(){
        self.addSubview(logoutBtn)
        logoutBtn.topAnchor.constraint(equalTo: topAnchor,constant: 60).isActive = true
        logoutBtn.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        logoutBtn.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        logoutBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.addSubview(lineView1)
        lineView1.topAnchor.constraint(equalTo: logoutBtn.bottomAnchor).isActive = true
        lineView1.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        lineView1.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        lineView1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.addSubview(pauseBtn)
        pauseBtn.topAnchor.constraint(equalTo: lineView1.bottomAnchor).isActive = true
        pauseBtn.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pauseBtn.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        pauseBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.addSubview(lineView2)
        lineView2.topAnchor.constraint(equalTo: pauseBtn.bottomAnchor).isActive = true
        lineView2.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        lineView2.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        lineView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.addSubview(withdrawBtn)
        withdrawBtn.topAnchor.constraint(equalTo: lineView2.bottomAnchor).isActive = true
        withdrawBtn.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        withdrawBtn.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        withdrawBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        logoutBtn.addSubview(logoutArrow)
        logoutArrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
        logoutArrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
        logoutArrow.rightAnchor.constraint(equalTo: logoutBtn.rightAnchor, constant: -30).isActive = true
        logoutArrow.centerYAnchor.constraint(equalTo: logoutBtn.centerYAnchor).isActive = true
        
        logoutBtn.addSubview(logoutLabel)
        logoutLabel.centerYAnchor.constraint(equalTo: logoutBtn.centerYAnchor).isActive = true
        logoutLabel.leftAnchor.constraint(equalTo: logoutBtn.leftAnchor, constant: 30).isActive = true
        logoutLabel.rightAnchor.constraint(equalTo: logoutArrow.leftAnchor, constant: -20).isActive = true
        logoutLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        pauseBtn.addSubview(pauseArrow)
        pauseArrow.centerYAnchor.constraint(equalTo: pauseBtn.centerYAnchor).isActive = true
        pauseArrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
        pauseArrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pauseArrow.rightAnchor.constraint(equalTo: pauseBtn.rightAnchor, constant: -30).isActive = true
        
        pauseBtn.addSubview(pauseLabel)
        pauseLabel.centerYAnchor.constraint(equalTo: pauseBtn.centerYAnchor).isActive = true
        pauseLabel.leftAnchor.constraint(equalTo: pauseBtn.leftAnchor, constant: 30).isActive = true
        pauseLabel.rightAnchor.constraint(equalTo: pauseArrow.leftAnchor, constant: -20).isActive = true
        pauseLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        withdrawBtn.addSubview(withdrawArrow)
        withdrawArrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
        withdrawArrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
        withdrawArrow.rightAnchor.constraint(equalTo: withdrawBtn.rightAnchor, constant: -30).isActive = true
        withdrawArrow.centerYAnchor.constraint(equalTo: withdrawBtn.centerYAnchor).isActive = true
        
        withdrawBtn.addSubview(withdrawLabel)
        withdrawLabel.centerYAnchor.constraint(equalTo: withdrawBtn.centerYAnchor).isActive = true
        withdrawLabel.leftAnchor.constraint(equalTo: withdrawBtn.leftAnchor, constant: 30).isActive = true
        withdrawLabel.rightAnchor.constraint(equalTo: withdrawArrow.leftAnchor, constant: -20).isActive = true
        withdrawLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
}
