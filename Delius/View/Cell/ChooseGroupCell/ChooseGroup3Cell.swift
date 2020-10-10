
//
//  MySoloChatCell.swift
//  Delius
//
//  Created by 박진호 on 2020/07/04.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class ChooseGroup3Cell:UICollectionViewCell{
    var imgView1:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        v.layer.cornerRadius = 15
        return v
    }()
    var imgView2:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        v.layer.cornerRadius = 15
        return v
    }()
    var imgView3:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        v.layer.cornerRadius = 15
        return v
    }()
    var nameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.textAlignment = .center
        l.font = UIFont.DeliusBoldType2()
        return l
    }()
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        setup()
    }
    
    private func setup(){
        self.addSubview(imgView1)
        imgView1.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView1.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imgView1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imgView1.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(imgView2)
        imgView2.topAnchor.constraint(equalTo: imgView1.bottomAnchor).isActive = true
        imgView2.leftAnchor.constraint(equalTo: imgView1.rightAnchor).isActive = true
        imgView2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imgView2.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(imgView3)
        imgView3.topAnchor.constraint(equalTo: imgView2.bottomAnchor).isActive = true
        imgView3.leftAnchor.constraint(equalTo: imgView2.rightAnchor).isActive = true
        imgView3.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imgView3.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: imgView2.bottomAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
    }
}


