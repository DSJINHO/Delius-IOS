//
//  GroupFeedEmptyView.swift
//  Delius
//
//  Created by user on 2020/08/27.
//  Copyright © 2020 정윤환. All rights reserved.
//
import UIKit
class GroupFeedEmptyView:UIView{
    
    
    let imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "noAlarm")
        return v
    }()
    let titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.text = "피드가 없습니다"
        l.font = UIFont.boldSystemFont(ofSize: 20)
        l.textAlignment = .center
        return l
    }()
    let subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.lightGray
        l.font = UIFont.systemFont(ofSize: 14)
        l.textAlignment = .center
        l.text = "다른 그룹에게 먼저 표현해보세요"
        return l
    }()
    
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    private func setup(){
        self.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        imgView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor,constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        self.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 10).isActive = true
        subLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
