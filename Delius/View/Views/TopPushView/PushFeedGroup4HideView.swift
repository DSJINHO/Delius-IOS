//
//  PushFeedSoloView.swift
//  Delius
//
//  Created by user on 2020/09/01.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class PushFeedGroup4HideView:UIView{
    
    let circleView1:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 25
        v.layer.shadowOpacity = 0.5
        v.layer.shadowRadius = 3
        v.layer.shadowOffset = CGSize(width: 2, height: 2)
        v.layer.shadowColor = UIColor.MainBlackColor().cgColor
        return v
    }()
    var imgView1:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 23
        v.image = UIImage(named: "model1")
        return v
    }()
    let circleView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 25
        v.layer.shadowOpacity = 0.5
        v.layer.shadowRadius = 3
        v.layer.shadowOffset = CGSize(width: 2, height: 2)
        v.layer.shadowColor = UIColor.MainBlackColor().cgColor
        return v
    }()
    var imgView2:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 23
        v.image = UIImage(named: "model1")
        return v
    }()
    let circleView3:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 25
        v.layer.shadowOpacity = 0.5
        v.layer.shadowRadius = 3
        v.layer.shadowOffset = CGSize(width: 2, height: 2)
        v.layer.shadowColor = UIColor.MainBlackColor().cgColor
        return v
    }()
    var imgView3:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 23
        v.image = UIImage(named: "model1")
        return v
    }()
    let circleView4:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 25
        v.layer.shadowOpacity = 0.5
        v.layer.shadowRadius = 3
        v.layer.shadowOffset = CGSize(width: 2, height: 2)
        v.layer.shadowColor = UIColor.MainBlackColor().cgColor
        return v
    }()
    var imgView4:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 23
        v.image = UIImage(named: "model1")
        return v
    }()
    let titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.boldSystemFont(ofSize: 13)
        l.textAlignment = .left
        l.textColor = UIColor.white
        l.text = "누군가 나에게 라이크를 보냈습니다"
        return l
    }()
    var contentView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.layer.cornerRadius = 25
        return v
    }()
    var gView:MainGradientView!
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        
        gView = MainGradientView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: topPadding + 80))
        setup()
    }
    private func setup(){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        self.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor, constant: topPadding + 5).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        contentView.addSubview(gView)
        gView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        gView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        gView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        gView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        contentView.addSubview(circleView1)
        circleView1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        circleView1.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        circleView1.widthAnchor.constraint(equalToConstant: 50).isActive = true
        circleView1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        contentView.addSubview(circleView2)
        circleView2.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        circleView2.leftAnchor.constraint(equalTo: circleView1.rightAnchor, constant: -10).isActive = true
        circleView2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        circleView2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        contentView.addSubview(circleView3)
        circleView3.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        circleView3.leftAnchor.constraint(equalTo: circleView2.rightAnchor, constant: -10).isActive = true
        circleView3.widthAnchor.constraint(equalToConstant: 50).isActive = true
        circleView3.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        contentView.addSubview(circleView4)
        circleView4.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        circleView4.leftAnchor.constraint(equalTo: circleView3.rightAnchor, constant: -10).isActive = true
        circleView4.widthAnchor.constraint(equalToConstant: 50).isActive = true
        circleView4.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        circleView1.addSubview(imgView1)
        imgView1.topAnchor.constraint(equalTo: circleView1.topAnchor, constant: 2).isActive = true
        imgView1.leftAnchor.constraint(equalTo: circleView1.leftAnchor, constant: 2).isActive = true
        imgView1.rightAnchor.constraint(equalTo: circleView1.rightAnchor, constant: -2).isActive = true
        imgView1.bottomAnchor.constraint(equalTo: circleView1.bottomAnchor, constant: -2).isActive = true
        
        circleView2.addSubview(imgView2)
        imgView2.topAnchor.constraint(equalTo: circleView2.topAnchor, constant: 2).isActive = true
        imgView2.leftAnchor.constraint(equalTo: circleView2.leftAnchor, constant: 2).isActive = true
        imgView2.rightAnchor.constraint(equalTo: circleView2.rightAnchor, constant: -2).isActive = true
        imgView2.bottomAnchor.constraint(equalTo: circleView2.bottomAnchor, constant: -2).isActive = true
        
        circleView3.addSubview(imgView3)
        imgView3.topAnchor.constraint(equalTo: circleView3.topAnchor, constant: 2).isActive = true
        imgView3.leftAnchor.constraint(equalTo: circleView3.leftAnchor, constant: 2).isActive = true
        imgView3.rightAnchor.constraint(equalTo: circleView3.rightAnchor, constant: -2).isActive = true
        imgView3.bottomAnchor.constraint(equalTo: circleView3.bottomAnchor, constant: -2).isActive = true
        
        circleView4.addSubview(imgView4)
        imgView4.topAnchor.constraint(equalTo: circleView4.topAnchor, constant: 2).isActive = true
        imgView4.leftAnchor.constraint(equalTo: circleView4.leftAnchor, constant: 2).isActive = true
        imgView4.rightAnchor.constraint(equalTo: circleView4.rightAnchor, constant: -2).isActive = true
        imgView4.bottomAnchor.constraint(equalTo: circleView4.bottomAnchor, constant: -2).isActive = true
        
        contentView.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: circleView3.rightAnchor, constant: 15).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        
        
        
    }
}



