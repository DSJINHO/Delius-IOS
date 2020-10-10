//
//  Tab0SuspendingView.swift
//  Delius
//
//  Created by user on 2020/08/22.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Tab0SuspendingView:UIView{
    
    private let imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "StopUsing")
        v.clipsToBounds = true
        v.tintColor = UIColor.MainBlackColor()
        return v
    }()
    
    private var label:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.text = "사용 중지중입니다"
        l.textAlignment = .center
        l.font = UIFont.DeliusBoldType0()
        return l
    }()
    private let subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.text = "설정에서 사용중지를 해제할수 있습니다"
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 12)
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
        imgView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.addSubview(label)
        label.topAnchor.constraint(equalTo: imgView.bottomAnchor,constant: 30).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5).isActive = true
        subLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
}
