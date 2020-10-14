//
//  MenuGroup2Cell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/04.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class MenuGroup4Cell:UICollectionViewCell{
    
    var backView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 10
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOffset = CGSize(width: 2, height: 2)
        v.layer.shadowOpacity = 0.2
        return v
    }()
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        v.layer.cornerRadius = 25
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.borderWidth = 2
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
    var imgView3:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        v.layer.cornerRadius = 20
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.borderWidth = 2
        return v
    }()
    var imgView4:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        v.layer.cornerRadius = 20
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.borderWidth = 2
        return v
    }()
    var dateLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.black
        l.font = UIFont.DeliusSystemType6()
        l.textAlignment = .left
        return l
    }()
    var crownImg:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "GroupLeader")
        return v
    }()
    var nameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        l.textAlignment = .center
        l.font = UIFont.DeliusBoldType6()
        return l
    }()
    var stateLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        l.textAlignment = .center
        l.font = UIFont.DeliusSystemType2()
        return l
    }()
    var tabLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.black
        l.text = "tab".localize()
        l.font = UIFont.DeliusSystemType3()
        l.textAlignment = .center
        return l
    }()
    var tabline:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = .black
        return l
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
        backView.topAnchor.constraint(equalTo: topAnchor,constant: 10).isActive = true
        backView.leftAnchor.constraint(equalTo: leftAnchor,constant: 10).isActive = true
        backView.rightAnchor.constraint(equalTo: rightAnchor,constant: -10).isActive = true
        backView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10).isActive = true
        
        self.addSubview(dateLabel)
        dateLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 5).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 11).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: backView.rightAnchor).isActive = true
        
        self.addSubview(imgView2)
        imgView2.topAnchor.constraint(equalTo: backView.topAnchor, constant: 30).isActive = true
        imgView2.rightAnchor.constraint(equalTo: backView.centerXAnchor, constant: -30).isActive = true
        imgView2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imgView2.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(imgView4)
        imgView4.topAnchor.constraint(equalTo: backView.topAnchor, constant: 30).isActive = true
        imgView4.leftAnchor.constraint(equalTo: backView.centerXAnchor, constant: 30).isActive = true
        imgView4.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imgView4.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(imgView3)
        imgView3.topAnchor.constraint(equalTo: backView.topAnchor, constant: 30).isActive = true
        imgView3.leftAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        imgView3.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imgView3.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(imgView)
        imgView.centerYAnchor.constraint(equalTo: imgView2.centerYAnchor).isActive = true
        imgView.rightAnchor.constraint(equalTo: backView.centerXAnchor, constant: 10).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        
        
        self.addSubview(crownImg)
        crownImg.bottomAnchor.constraint(equalTo: imgView.topAnchor, constant: -2).isActive = true
        crownImg.centerXAnchor.constraint(equalTo: imgView.centerXAnchor).isActive = true
        crownImg.heightAnchor.constraint(equalToConstant: 10).isActive = true
        crownImg.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 5).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: backView.rightAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: backView.leftAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.addSubview(stateLabel)
        stateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        stateLabel.rightAnchor.constraint(equalTo: backView.rightAnchor).isActive = true
        stateLabel.leftAnchor.constraint(equalTo: backView.leftAnchor).isActive = true
        stateLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true
    
        self.addSubview(tabLabel)
        tabLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -8).isActive = true
        tabLabel.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        tabLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        tabLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        self.addSubview(tabline)
        tabline.topAnchor.constraint(equalTo: tabLabel.bottomAnchor,constant: -1).isActive = true
        tabline.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        tabline.widthAnchor.constraint(equalToConstant: 50).isActive = true
        tabline.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        
        
        
        
        
    }
}


