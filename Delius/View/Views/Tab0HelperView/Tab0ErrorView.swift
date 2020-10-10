//
//  Tab0ErrorView.swift
//  Delius
//
//  Created by user on 2020/08/25.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Tab0ErrorView:UIView{
    
    private let imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.tintColor = UIColor.MainBlackColor()
        v.clipsToBounds = true
        v.image = UIImage(named: "Error")
        return v
    }()
    private let label:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.boldSystemFont(ofSize: 15)
        l.textAlignment = .center
        l.text = "리스트를 요청하는 중에 오류가 발생하였습니다"
        return l
    }()
    var reloadBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = UIColor.MainBlackColor()
        b.setTitle("다시시도", for: .normal)
        b.setTitleColor(UIColor.white, for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        b.titleLabel?.textAlignment = .center
        return b
    }()
    required init?(coder:NSCoder) {
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
        imgView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.addSubview(label)
        label.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 10).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.addSubview(reloadBtn)
        reloadBtn.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        reloadBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        reloadBtn.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        let btnWidth = "다시시도".StringWidth(withConstrainedHeight: 30, font: UIFont.boldSystemFont(ofSize: 14)) + 20
        reloadBtn.widthAnchor.constraint(equalToConstant: btnWidth).isActive = true
    }
    
}
