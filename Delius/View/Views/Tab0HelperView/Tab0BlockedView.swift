//
//  Tab0BlockedView.swift
//  Delius
//
//  Created by user on 2020/08/22.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Tab0BlockedView:UIView{
    private let imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.tintColor = UIColor.MainBlackColor()
        v.clipsToBounds = true
        v.image = UIImage(named: "UsingBlock")
        return v
    }()
    private var blockLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.black
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .center
        l.text = "관리자에 의해 사용이 중지되었습니다"
        return l
    }()
    private var subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.lightGray
        l.font = UIFont.systemFont(ofSize: 12)
        l.textAlignment = .center
        l.text = "관리자에게 문의해주세요"
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
        imgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imgView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        self.addSubview(blockLabel)
        blockLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 10).isActive = true
        blockLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        blockLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        blockLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        self.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: blockLabel.bottomAnchor, constant: 10).isActive = true
        subLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        subLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
}
