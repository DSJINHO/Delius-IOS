//
//  Tab0GroupImageFirstCell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 28/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Tab0GroupImageFirstCell2:UICollectionViewCell{
    
    
    let backView1:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.clipsToBounds = true
        return v
    }()
    let backView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.clipsToBounds = true
        return v
    }()
    
    var imgView1:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    var imgView2:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        let term:CGFloat = 5
        let radius = frame.width/4 + term
        let imgRadius = radius - term
        
        backView1.layer.cornerRadius = radius
        backView2.layer.cornerRadius = radius
        imgView1.layer.cornerRadius = imgRadius
        imgView2.layer.cornerRadius = imgRadius
        setup(r1:radius,t:term)
    }
    private func setup(r1:CGFloat,t:CGFloat){
        self.addSubview(backView1)
        backView1.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        backView1.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        backView1.widthAnchor.constraint(equalToConstant: r1*2).isActive = true
        backView1.heightAnchor.constraint(equalToConstant: r1*2).isActive = true
        
        self.addSubview(backView2)
        backView2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        backView2.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        backView2.heightAnchor.constraint(equalToConstant: r1*2).isActive = true
        backView2.widthAnchor.constraint(equalToConstant: r1*2).isActive = true
        
        
        self.addSubview(imgView1)
        imgView1.topAnchor.constraint(equalTo: backView1.topAnchor, constant: t).isActive = true
        imgView1.leftAnchor.constraint(equalTo: backView1.leftAnchor, constant: t).isActive = true
        imgView1.rightAnchor.constraint(equalTo: backView1.rightAnchor, constant: -t).isActive = true
        imgView1.bottomAnchor.constraint(equalTo: backView1.bottomAnchor, constant: -t).isActive = true
        
        self.addSubview(imgView2)
        imgView2.topAnchor.constraint(equalTo: backView2.topAnchor, constant: t).isActive = true
        imgView2.leftAnchor.constraint(equalTo: backView2.leftAnchor, constant: t).isActive = true
        imgView2.rightAnchor.constraint(equalTo: backView2.rightAnchor, constant: -t).isActive = true
        imgView2.bottomAnchor.constraint(equalTo: backView2.bottomAnchor, constant: -t).isActive = true
    }
    
    func CircleAnimation(circle:Bool){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.imgView1
        })
    }
}
