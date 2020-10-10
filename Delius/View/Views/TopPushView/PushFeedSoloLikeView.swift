//
//  PushFeedSoloView.swift
//  Delius
//
//  Created by user on 2020/09/01.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class PushFeedSoloLikeView:UIView{
    
    let circleView:UIView={
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
    var imgView:UIImageView={
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
        
        contentView.addSubview(circleView)
        circleView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        circleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        circleView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        
        circleView.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: circleView.topAnchor, constant: 2).isActive = true
        imgView.leftAnchor.constraint(equalTo: circleView.leftAnchor, constant: 2).isActive = true
        imgView.rightAnchor.constraint(equalTo: circleView.rightAnchor,constant: -2).isActive = true
        imgView.bottomAnchor.constraint(equalTo: circleView.bottomAnchor,constant: -2).isActive = true
        
        contentView.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: circleView.rightAnchor, constant: 15).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: circleView.centerYAnchor).isActive = true
    }
}

