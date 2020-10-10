//
//  LocationIndicatorTimerView.swift
//  Delius
//
//  Created by user on 2020/08/21.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class LocationIndicatorTimerView:UIView{
    
    
    var timer:Timer!
    var btn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.cornerRadius = 30
        b.clipsToBounds = true
        return b
    }()
    let label:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.textAlignment = .center
        l.font = UIFont.boldSystemFont(ofSize: 20)
        l.text = "회원님께 맞는 유저 찾는 중"
        return l
    }()
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    init(frame:CGRect,imgUrl:URL){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(btnFunc(_:)), for: .touchUpInside)
        
        let imgView:UIImageView={
            let v = UIImageView()
            v.translatesAutoresizingMaskIntoConstraints = false
            v.contentMode = .scaleAspectFill
            v.sd_setImage(with: imgUrl)
            return v
        }()
        btn.backgroundColor = UIColor.white
        self.addSubview(btn)
        btn.centerYAnchor.constraint(equalTo: topAnchor,constant: self.frame.width/2).isActive = true
        btn.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 60).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        btn.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: btn.topAnchor).isActive = true
        imgView.leftAnchor.constraint(equalTo: btn.leftAnchor).isActive = true
        imgView.rightAnchor.constraint(equalTo: btn.rightAnchor).isActive = true
        imgView.bottomAnchor.constraint(equalTo: btn.bottomAnchor).isActive = true
        
        
        self.addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor, constant: self.frame.width + 20).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        start()
    }
    private func start(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (Timer) in
            let v = LocationIndicatorView(frame: self.frame)
            self.addSubview(v)
            v.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            v.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            v.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            v.heightAnchor.constraint(equalToConstant: self.frame.width).isActive = true
            self.bringSubviewToFront(self.btn)
            v.timeAnimation {
                v.removeFromSuperview()
            }
        })
    }
    @objc func btnFunc(_ sender:UIButton){
        let v = LocationIndicatorView(frame: self.frame)
        self.addSubview(v)
        v.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        v.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        v.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        v.heightAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        self.bringSubviewToFront(self.btn)
        v.timeAnimation {
            v.removeFromSuperview()
        }
    }
    func removeView(){
        
    }
}
