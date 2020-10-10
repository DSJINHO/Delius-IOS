
//
//  MySoloChatCell.swift
//  Delius
//
//  Created by 박진호 on 2020/07/04.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class ChooseGroup2Cell:UICollectionViewCell{
    
    
    
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        v.layer.cornerRadius = 20
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.borderWidth = 2
        return v
    }()
    var backView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        return v
    }()
    var alphaView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.black
        v.alpha = 0.3
        return v
    }()
    var imgView2:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        v.layer.cornerRadius = 20
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.borderWidth = 2
        return v
    }()
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.layer.cornerRadius = 10
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 4
        self.clipsToBounds = true
        setup()
    }
    private func setup(){
        self.addSubview(backView)
        backView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(alphaView)
        alphaView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        alphaView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        alphaView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        alphaView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(imgView)
        imgView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imgView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        imgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        self.addSubview(imgView2)
        imgView2.topAnchor.constraint(equalTo: imgView.topAnchor).isActive = true
        imgView2.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: -20).isActive = true
        imgView2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imgView2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
    }
}

