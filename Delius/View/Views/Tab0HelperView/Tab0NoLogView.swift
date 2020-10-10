//
//  Tab0NoLogView.swift
//  Delius
//
//  Created by user on 2020/08/25.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Tab0NoLogView:UIView{
    
    private let imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.clipsToBounds = true
        v.image = UIImage(named: "NoLog")
        return v
    }()
    var timeLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.red
        l.font = UIFont.boldSystemFont(ofSize: 25)
        l.textAlignment = .center
        return l
    }()
    private let titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.boldSystemFont(ofSize: 20)
        l.textAlignment = .center
        l.text = "다음 리스트를 볼 수 없어요"
        return l
    }()
    private let subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.lightGray
        l.font = UIFont.systemFont(ofSize: 12)
        l.textAlignment = .center
        l.lineBreakMode = .byWordWrapping
        l.numberOfLines = 3
        l.text = "하루 제공되는 리스트 요청 수를 초과하셨습니다. 딜리를 사용하여 리스트를 요청하거나 다음 ~~기다리세요"
        return l
    }()
    private let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.lightGray
        return v
    }()
    private let timeTitleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.boldSystemFont(ofSize: 20)
        l.textAlignment = .center
        l.text = "남은 시간"
        return l
    }()
    var deliBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("딜리로 요청하기", for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        b.setTitleColor(UIColor.white, for: .normal)
        b.backgroundColor = UIColor.MainBlackColor()
        return b
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
        imgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imgView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: self.frame.width/3).isActive = true
        
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 50).isActive = true
        subLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -50).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.addSubview(lineView)
        lineView.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 10).isActive = true
        lineView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        lineView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.addSubview(timeTitleLabel)
        timeTitleLabel.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 20).isActive = true
        timeTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        timeTitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        timeTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(timeLabel)
        timeLabel.topAnchor.constraint(equalTo: timeTitleLabel.bottomAnchor, constant: 15).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        timeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        
        self.addSubview(deliBtn)
        deliBtn.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 30).isActive = true
        deliBtn.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        let deliWidth = "딜리로 요청하기".StringWidth(withConstrainedHeight: 30, font: UIFont.boldSystemFont(ofSize: 20))
        deliBtn.widthAnchor.constraint(equalToConstant: deliWidth+20).isActive = true
        deliBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
}
