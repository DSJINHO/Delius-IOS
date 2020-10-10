//
//  GroupInvitationView.swift
//  Delius
//
//  Created by 박진호 on 2020/07/08.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

class GroupInvitationView:UIView{
    
    
    var shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.black
        v.alpha = 0
        return v
    }()
    
    let whiteView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 15
        v.clipsToBounds = true
        v.alpha = 0
        return v
    }()
    var groupNameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.boldSystemFont(ofSize: 20)
        l.textAlignment = .center
        return l
    }()
    var groupStatusLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.boldSystemFont(ofSize: 15)
        l.textAlignment = .center
        return l
    }()
    
    
    var imgView1:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 26
        return v
    }()
    
    var circleView1:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOffset = CGSize(width: 10, height: 10)
        v.layer.shadowRadius = 10
        v.layer.shadowOpacity = 0.3
        v.layer.masksToBounds = false
        v.alpha = 0
        v.layer.cornerRadius = 30
        return v
    }()
    var nameLabel1:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.font = UIFont.DeliusBoldType2()
        l.textAlignment = .center
        l.alpha = 0
        return l
    }()
    
    var imgView2:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 26
        return v
    }()
    
    var circleView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOffset = CGSize(width: 10, height: 10)
        v.layer.shadowRadius = 10
        v.layer.shadowOpacity = 0.3
        v.layer.masksToBounds = false
        v.alpha = 0
        v.layer.cornerRadius = 30
        return v
    }()
    var nameLabel2:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.font = UIFont.DeliusBoldType2()
        l.textAlignment = .center
        l.alpha = 0
        return l
    }()
    
    
    var imgView3:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 26
        return v
    }()
    
    var circleView3:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOffset = CGSize(width: 10, height: 10)
        v.layer.shadowRadius = 10
        v.layer.shadowOpacity = 0.3
        v.layer.masksToBounds = false
        v.alpha = 0
        v.layer.cornerRadius = 30
        return v
    }()
    var nameLabel3:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.font = UIFont.DeliusBoldType2()
        l.textAlignment = .center
        l.alpha = 0
        return l
    }()
    
    
    var imgView4:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 26
        return v
    }()
    
    var circleView4:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOffset = CGSize(width: 10, height: 10)
        v.layer.shadowRadius = 10
        v.layer.shadowOpacity = 0.3
        v.layer.masksToBounds = false
        v.alpha = 0
        v.layer.cornerRadius = 30
        return v
    }()
    var nameLabel4:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.font = UIFont.DeliusBoldType2()
        l.textAlignment = .center
        l.alpha = 0
        return l
    }()
    
    
    
    
    
    let lineView1:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.lightGray
        return v
    }()
    let lineView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.lightGray
        return v
    }()
    let lineView3:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.lightGray
        return v
    }()
    let lineView4:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.lightGray
        return v
    }()
    let subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.lightGray
        l.font = UIFont.systemFont(ofSize: 12)
        l.textAlignment = .center
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.text = "그룹방 초대에 수락하시겠습니까?"
        return l
    }()
    
    let imgContainer:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    var locationLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.lightGray
        l.font = UIFont.systemFont(ofSize: 12)
        l.textAlignment = .center
        return l
    }()
    var fo1Label:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.lightGray
        l.font = UIFont.systemFont(ofSize: 12)
        l.textAlignment = .center
        return l
    }()
    var fo2Label:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.lightGray
        l.font = UIFont.systemFont(ofSize: 12)
        l.textAlignment = .center
        return l
    }()
    var fo3Label:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.lightGray
        l.font = UIFont.systemFont(ofSize: 12)
        l.textAlignment = .center
        return l
    }()
    var timeLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.lightGray
        l.font = UIFont.systemFont(ofSize: 12)
        l.textAlignment = .center
        return l
    }()
    var extraLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.lightGray
        l.font = UIFont.systemFont(ofSize: 12)
        l.textAlignment = .center
        return l
    }()
    let scrollView:UIScrollView={
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    var okBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setImage(UIImage(named: "okBtn"), for: .normal)
        b.imageView?.contentMode = .scaleAspectFit
        b.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return b
    }()
    var xBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setImage(UIImage(named: "xBtn"), for: .normal)
        b.imageView?.contentMode = .scaleAspectFit
        b.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return b
    }()
    
    

    var nsCenter:NSLayoutConstraint!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        let wWidth = frame.width - 80
        setup(wd:wWidth)
    }
    private func setup(wd:CGFloat){
        self.addSubview(shadowView)
        shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shadowView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        shadowView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(whiteView)
        nsCenter = whiteView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 200)
        nsCenter.isActive = true
        whiteView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        whiteView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        
        self.addSubview(imgContainer)
        imgContainer.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 30).isActive = true
        imgContainer.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        imgContainer.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        imgContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.addSubview(groupNameLabel)
        groupNameLabel.topAnchor.constraint(equalTo: imgContainer.bottomAnchor,constant: 5).isActive = true
        groupNameLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        groupNameLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        groupNameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        self.addSubview(groupStatusLabel)
        groupStatusLabel.topAnchor.constraint(equalTo: groupNameLabel.bottomAnchor, constant: 5).isActive = true
        groupStatusLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        groupStatusLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        groupStatusLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        
        self.addSubview(lineView1)
        lineView1.topAnchor.constraint(equalTo: groupStatusLabel.bottomAnchor,constant: 10).isActive = true
        lineView1.leftAnchor.constraint(equalTo: whiteView.leftAnchor,constant: 30).isActive = true
        lineView1.rightAnchor.constraint(equalTo: whiteView.rightAnchor,constant: -30).isActive = true
        lineView1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: lineView1.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        scrollView.addSubview(locationLabel)
        locationLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        locationLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        locationLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 20).isActive = true
        locationLabel.widthAnchor.constraint(lessThanOrEqualToConstant: wd).isActive = true
        
        scrollView.addSubview(fo1Label)
        fo1Label.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10).isActive = true
        fo1Label.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        fo1Label.widthAnchor.constraint(equalToConstant: wd).isActive = true
        fo1Label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        scrollView.addSubview(fo2Label)
        fo2Label.topAnchor.constraint(equalTo: fo1Label.bottomAnchor,constant: 10).isActive = true
        fo2Label.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        fo2Label.widthAnchor.constraint(equalToConstant: wd).isActive = true
        fo2Label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        scrollView.addSubview(fo3Label)
        fo3Label.topAnchor.constraint(equalTo: fo2Label.bottomAnchor, constant: 10).isActive = true
        fo3Label.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        fo3Label.widthAnchor.constraint(equalToConstant: wd).isActive = true
        fo3Label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        scrollView.addSubview(timeLabel)
        timeLabel.topAnchor.constraint(equalTo: fo3Label.bottomAnchor, constant: 10).isActive = true
        timeLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: wd).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        scrollView.addSubview(lineView2)
        lineView2.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        lineView2.widthAnchor.constraint(equalToConstant: wd).isActive = true
        lineView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView2.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10).isActive = true
        
        scrollView.addSubview(extraLabel)
        extraLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
        extraLabel.widthAnchor.constraint(equalToConstant: wd - 20 ).isActive = true
        extraLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        extraLabel.topAnchor.constraint(equalTo: lineView2.bottomAnchor, constant: 10).isActive = true
        
        whiteView.addSubview(lineView3)
        lineView3.topAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        lineView3.leftAnchor.constraint(equalTo: lineView1.leftAnchor).isActive = true
        lineView3.rightAnchor.constraint(equalTo: lineView1.rightAnchor).isActive = true
        lineView3.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        whiteView.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: lineView3.bottomAnchor,constant: 10).isActive = true
        subLabel.leftAnchor.constraint(equalTo: lineView1.leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: lineView1.rightAnchor).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        whiteView.addSubview(lineView4)
        lineView4.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 10).isActive = true
        lineView4.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        lineView4.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        lineView4.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        whiteView.addSubview(okBtn)
        okBtn.topAnchor.constraint(equalTo: lineView4.bottomAnchor,constant: 10).isActive = true
        okBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor,constant: 20).isActive = true
        okBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        okBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        whiteView.addSubview(xBtn)
        xBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -20).isActive = true
        xBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        xBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        xBtn.topAnchor.constraint(equalTo: lineView4.bottomAnchor, constant: 10).isActive = true
        
        whiteView.bottomAnchor.constraint(equalTo: xBtn.bottomAnchor,constant: 10).isActive = true
    }
    
    func setup2(requestNumber:Int){
        
        var ns1:NSLayoutConstraint!
        var ns2:NSLayoutConstraint!
        
        imgContainer.addSubview(circleView1)
        circleView1.centerYAnchor.constraint(equalTo: imgContainer.centerYAnchor).isActive = true
        circleView1.widthAnchor.constraint(equalToConstant: 60).isActive = true
        circleView1.heightAnchor.constraint(equalToConstant: 60).isActive = true
        ns1 = circleView1.centerXAnchor.constraint(equalTo: imgContainer.centerXAnchor)
        ns1.isActive = true
        
        circleView1.addSubview(imgView1)
        imgView1.topAnchor.constraint(equalTo: circleView1.topAnchor, constant: 4).isActive = true
        imgView1.leftAnchor.constraint(equalTo: circleView1.leftAnchor,constant: 4).isActive = true
        imgView1.rightAnchor.constraint(equalTo: circleView1.rightAnchor,constant: -4).isActive = true
        imgView1.bottomAnchor.constraint(equalTo: circleView1.bottomAnchor, constant: -4).isActive = true
        
        imgContainer.addSubview(circleView2)
        circleView2.centerYAnchor.constraint(equalTo: imgContainer.centerYAnchor).isActive = true
        circleView2.widthAnchor.constraint(equalToConstant: 60).isActive = true
        circleView2.heightAnchor.constraint(equalToConstant: 60).isActive = true
        ns2 = circleView2.centerXAnchor.constraint(equalTo: imgContainer.centerXAnchor)
        ns2.isActive = true
        
        circleView2.addSubview(imgView2)
        imgView2.topAnchor.constraint(equalTo: circleView2.topAnchor, constant: 4).isActive = true
        imgView2.leftAnchor.constraint(equalTo: circleView2.leftAnchor,constant: 4).isActive = true
        imgView2.rightAnchor.constraint(equalTo: circleView2.rightAnchor,constant: -4).isActive = true
        imgView2.bottomAnchor.constraint(equalTo: circleView2.bottomAnchor, constant: -4).isActive = true
        
        if requestNumber == 0{
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
            let bView = UIVisualEffectView(effect: blurEffect)
            bView.translatesAutoresizingMaskIntoConstraints = false
            self.imgView2.addSubview(bView)
            bView.topAnchor.constraint(equalTo: imgView2.topAnchor).isActive = true
            bView.leftAnchor.constraint(equalTo: imgView2.leftAnchor).isActive = true
            bView.rightAnchor.constraint(equalTo: imgView2.rightAnchor).isActive = true
            bView.bottomAnchor.constraint(equalTo: imgView2.bottomAnchor).isActive = true
        }
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            ns1.constant = -20
            self.circleView1.alpha = 1
            self.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.2, delay: 0.3, options: .curveEaseIn, animations: {
            ns2.constant = 20
            self.circleView2.alpha = 1
            self.layoutIfNeeded()
        })
    }
    func setup3(requestNumber:Int){
        
        var ns1:NSLayoutConstraint!
        var ns2:NSLayoutConstraint!
        var ns3:NSLayoutConstraint!
        
        imgContainer.addSubview(circleView1)
        circleView1.centerYAnchor.constraint(equalTo: imgContainer.centerYAnchor).isActive = true
        circleView1.widthAnchor.constraint(equalToConstant: 60).isActive = true
        circleView1.heightAnchor.constraint(equalToConstant: 60).isActive = true
        ns1 = circleView1.centerXAnchor.constraint(equalTo: imgContainer.centerXAnchor)
        ns1.isActive = true
        
        circleView1.addSubview(imgView1)
        imgView1.topAnchor.constraint(equalTo: circleView1.topAnchor, constant: 4).isActive = true
        imgView1.leftAnchor.constraint(equalTo: circleView1.leftAnchor,constant: 4).isActive = true
        imgView1.rightAnchor.constraint(equalTo: circleView1.rightAnchor,constant: -4).isActive = true
        imgView1.bottomAnchor.constraint(equalTo: circleView1.bottomAnchor, constant: -4).isActive = true
        
        imgContainer.addSubview(circleView2)
        circleView2.centerYAnchor.constraint(equalTo: imgContainer.centerYAnchor).isActive = true
        circleView2.widthAnchor.constraint(equalToConstant: 60).isActive = true
        circleView2.heightAnchor.constraint(equalToConstant: 60).isActive = true
        ns2 = circleView2.centerXAnchor.constraint(equalTo: imgContainer.centerXAnchor)
        ns2.isActive = true
        
        circleView2.addSubview(imgView2)
        imgView2.topAnchor.constraint(equalTo: circleView2.topAnchor, constant: 4).isActive = true
        imgView2.leftAnchor.constraint(equalTo: circleView2.leftAnchor,constant: 4).isActive = true
        imgView2.rightAnchor.constraint(equalTo: circleView2.rightAnchor,constant: -4).isActive = true
        imgView2.bottomAnchor.constraint(equalTo: circleView2.bottomAnchor, constant: -4).isActive = true
        
        imgContainer.addSubview(circleView3)
        circleView3.centerYAnchor.constraint(equalTo: imgContainer.centerYAnchor).isActive = true
        circleView3.widthAnchor.constraint(equalToConstant: 60).isActive = true
        circleView3.heightAnchor.constraint(equalToConstant: 60).isActive = true
        ns3 = circleView3.centerXAnchor.constraint(equalTo: imgContainer.centerXAnchor)
        ns3.isActive = true
        
        circleView3.addSubview(imgView3)
        imgView3.topAnchor.constraint(equalTo: circleView3.topAnchor, constant: 4).isActive = true
        imgView3.leftAnchor.constraint(equalTo: circleView3.leftAnchor,constant: 4).isActive = true
        imgView3.rightAnchor.constraint(equalTo: circleView3.rightAnchor,constant: -4).isActive = true
        imgView3.bottomAnchor.constraint(equalTo: circleView3.bottomAnchor, constant: -4).isActive = true
        
        if requestNumber == 0{
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
            let bView = UIVisualEffectView(effect: blurEffect)
            bView.translatesAutoresizingMaskIntoConstraints = false
            self.imgView2.addSubview(bView)
            bView.topAnchor.constraint(equalTo: imgView2.topAnchor).isActive = true
            bView.leftAnchor.constraint(equalTo: imgView2.leftAnchor).isActive = true
            bView.rightAnchor.constraint(equalTo: imgView2.rightAnchor).isActive = true
            bView.bottomAnchor.constraint(equalTo: imgView2.bottomAnchor).isActive = true
            
            let bView2 = UIVisualEffectView(effect: blurEffect)
            bView2.translatesAutoresizingMaskIntoConstraints = false
            self.imgView3.addSubview(bView2)
            bView2.topAnchor.constraint(equalTo: imgView3.topAnchor).isActive = true
            bView2.leftAnchor.constraint(equalTo: imgView3.leftAnchor).isActive = true
            bView2.rightAnchor.constraint(equalTo: imgView3.rightAnchor).isActive = true
            bView2.bottomAnchor.constraint(equalTo: imgView3.bottomAnchor).isActive = true
        }else if requestNumber == 1{
            
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
            let bView2 = UIVisualEffectView(effect: blurEffect)
            bView2.translatesAutoresizingMaskIntoConstraints = false
            self.imgView3.addSubview(bView2)
            bView2.topAnchor.constraint(equalTo: imgView3.topAnchor).isActive = true
            bView2.leftAnchor.constraint(equalTo: imgView3.leftAnchor).isActive = true
            bView2.rightAnchor.constraint(equalTo: imgView3.rightAnchor).isActive = true
            bView2.bottomAnchor.constraint(equalTo: imgView3.bottomAnchor).isActive = true
        }else{
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
            let bView = UIVisualEffectView(effect: blurEffect)
            bView.translatesAutoresizingMaskIntoConstraints = false
            self.imgView2.addSubview(bView)
            bView.topAnchor.constraint(equalTo: imgView2.topAnchor).isActive = true
            bView.leftAnchor.constraint(equalTo: imgView2.leftAnchor).isActive = true
            bView.rightAnchor.constraint(equalTo: imgView2.rightAnchor).isActive = true
            bView.bottomAnchor.constraint(equalTo: imgView2.bottomAnchor).isActive = true
        }
        
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            ns1.constant = -40
            self.circleView1.alpha = 1
            self.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.2, delay: 0.3, options: .curveEaseIn, animations: {
            self.circleView2.alpha = 1
            self.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.2, delay: 0.5, options: .curveEaseIn, animations: {
            ns3.constant = 40
            self.circleView3.alpha = 1
            self.layoutIfNeeded()
        })
        
    }
    func setup4(requestNumber:Int){
        
        var ns1:NSLayoutConstraint!
        var ns2:NSLayoutConstraint!
        var ns3:NSLayoutConstraint!
        var ns4:NSLayoutConstraint!
        
        imgContainer.addSubview(circleView1)
        circleView1.centerYAnchor.constraint(equalTo: imgContainer.centerYAnchor).isActive = true
        circleView1.widthAnchor.constraint(equalToConstant: 60).isActive = true
        circleView1.heightAnchor.constraint(equalToConstant: 60).isActive = true
        ns1 = circleView1.centerXAnchor.constraint(equalTo: imgContainer.centerXAnchor)
        ns1.isActive = true
        
        circleView1.addSubview(imgView1)
        imgView1.topAnchor.constraint(equalTo: circleView1.topAnchor, constant: 4).isActive = true
        imgView1.leftAnchor.constraint(equalTo: circleView1.leftAnchor,constant: 4).isActive = true
        imgView1.rightAnchor.constraint(equalTo: circleView1.rightAnchor,constant: -4).isActive = true
        imgView1.bottomAnchor.constraint(equalTo: circleView1.bottomAnchor, constant: -4).isActive = true
        
        imgContainer.addSubview(circleView2)
        circleView2.centerYAnchor.constraint(equalTo: imgContainer.centerYAnchor).isActive = true
        circleView2.widthAnchor.constraint(equalToConstant: 60).isActive = true
        circleView2.heightAnchor.constraint(equalToConstant: 60).isActive = true
        ns2 = circleView2.centerXAnchor.constraint(equalTo: imgContainer.centerXAnchor)
        ns2.isActive = true
        
        circleView2.addSubview(imgView2)
        imgView2.topAnchor.constraint(equalTo: circleView2.topAnchor, constant: 4).isActive = true
        imgView2.leftAnchor.constraint(equalTo: circleView2.leftAnchor,constant: 4).isActive = true
        imgView2.rightAnchor.constraint(equalTo: circleView2.rightAnchor,constant: -4).isActive = true
        imgView2.bottomAnchor.constraint(equalTo: circleView2.bottomAnchor, constant: -4).isActive = true
        
        imgContainer.addSubview(circleView3)
        circleView3.centerYAnchor.constraint(equalTo: imgContainer.centerYAnchor).isActive = true
        circleView3.widthAnchor.constraint(equalToConstant: 60).isActive = true
        circleView3.heightAnchor.constraint(equalToConstant: 60).isActive = true
        ns3 = circleView3.centerXAnchor.constraint(equalTo: imgContainer.centerXAnchor)
        ns3.isActive = true
        
        circleView3.addSubview(imgView3)
        imgView3.topAnchor.constraint(equalTo: circleView3.topAnchor, constant: 4).isActive = true
        imgView3.leftAnchor.constraint(equalTo: circleView3.leftAnchor,constant: 4).isActive = true
        imgView3.rightAnchor.constraint(equalTo: circleView3.rightAnchor,constant: -4).isActive = true
        imgView3.bottomAnchor.constraint(equalTo: circleView3.bottomAnchor, constant: -4).isActive = true
        
        imgContainer.addSubview(circleView4)
        circleView4.centerYAnchor.constraint(equalTo: imgContainer.centerYAnchor).isActive = true
        circleView4.widthAnchor.constraint(equalToConstant: 60).isActive = true
        circleView4.heightAnchor.constraint(equalToConstant: 60).isActive = true
        ns4 = circleView4.centerXAnchor.constraint(equalTo: imgContainer.centerXAnchor)
        ns4.isActive = true
        
        circleView4.addSubview(imgView4)
        imgView4.topAnchor.constraint(equalTo: circleView4.topAnchor, constant: 4).isActive = true
        imgView4.leftAnchor.constraint(equalTo: circleView4.leftAnchor,constant: 4).isActive = true
        imgView4.rightAnchor.constraint(equalTo: circleView4.rightAnchor,constant: -4).isActive = true
        imgView4.bottomAnchor.constraint(equalTo: circleView4.bottomAnchor, constant: -4).isActive = true
        
        
        if requestNumber == 0{
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
            let bView = UIVisualEffectView(effect: blurEffect)
            bView.translatesAutoresizingMaskIntoConstraints = false
            self.imgView2.addSubview(bView)
            bView.topAnchor.constraint(equalTo: imgView2.topAnchor).isActive = true
            bView.leftAnchor.constraint(equalTo: imgView2.leftAnchor).isActive = true
            bView.rightAnchor.constraint(equalTo: imgView2.rightAnchor).isActive = true
            bView.bottomAnchor.constraint(equalTo: imgView2.bottomAnchor).isActive = true
            
            let bView2 = UIVisualEffectView(effect: blurEffect)
            bView2.translatesAutoresizingMaskIntoConstraints = false
            self.imgView3.addSubview(bView2)
            bView2.topAnchor.constraint(equalTo: imgView3.topAnchor).isActive = true
            bView2.leftAnchor.constraint(equalTo: imgView3.leftAnchor).isActive = true
            bView2.rightAnchor.constraint(equalTo: imgView3.rightAnchor).isActive = true
            bView2.bottomAnchor.constraint(equalTo: imgView3.bottomAnchor).isActive = true
            
            
            let bView3 = UIVisualEffectView(effect: blurEffect)
            bView3.translatesAutoresizingMaskIntoConstraints = false
            self.imgView4.addSubview(bView3)
            bView3.topAnchor.constraint(equalTo: imgView4.topAnchor).isActive = true
            bView3.leftAnchor.constraint(equalTo: imgView4.leftAnchor).isActive = true
            bView3.rightAnchor.constraint(equalTo: imgView4.rightAnchor).isActive = true
            bView3.bottomAnchor.constraint(equalTo: imgView4.bottomAnchor).isActive = true
        }else if requestNumber == 1{
            
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
            let bView2 = UIVisualEffectView(effect: blurEffect)
            bView2.translatesAutoresizingMaskIntoConstraints = false
            self.imgView3.addSubview(bView2)
            bView2.topAnchor.constraint(equalTo: imgView3.topAnchor).isActive = true
            bView2.leftAnchor.constraint(equalTo: imgView3.leftAnchor).isActive = true
            bView2.rightAnchor.constraint(equalTo: imgView3.rightAnchor).isActive = true
            bView2.bottomAnchor.constraint(equalTo: imgView3.bottomAnchor).isActive = true
            
            
            let bView3 = UIVisualEffectView(effect: blurEffect)
            bView3.translatesAutoresizingMaskIntoConstraints = false
            self.imgView4.addSubview(bView3)
            bView3.topAnchor.constraint(equalTo: imgView4.topAnchor).isActive = true
            bView3.leftAnchor.constraint(equalTo: imgView4.leftAnchor).isActive = true
            bView3.rightAnchor.constraint(equalTo: imgView4.rightAnchor).isActive = true
            bView3.bottomAnchor.constraint(equalTo: imgView4.bottomAnchor).isActive = true
        }else if requestNumber == 2{
            
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
            let bView = UIVisualEffectView(effect: blurEffect)
            bView.translatesAutoresizingMaskIntoConstraints = false
            self.imgView2.addSubview(bView)
            bView.topAnchor.constraint(equalTo: imgView2.topAnchor).isActive = true
            bView.leftAnchor.constraint(equalTo: imgView2.leftAnchor).isActive = true
            bView.rightAnchor.constraint(equalTo: imgView2.rightAnchor).isActive = true
            bView.bottomAnchor.constraint(equalTo: imgView2.bottomAnchor).isActive = true
            
            
            let bView3 = UIVisualEffectView(effect: blurEffect)
            bView3.translatesAutoresizingMaskIntoConstraints = false
            self.imgView4.addSubview(bView3)
            bView3.topAnchor.constraint(equalTo: imgView4.topAnchor).isActive = true
            bView3.leftAnchor.constraint(equalTo: imgView4.leftAnchor).isActive = true
            bView3.rightAnchor.constraint(equalTo: imgView4.rightAnchor).isActive = true
            bView3.bottomAnchor.constraint(equalTo: imgView4.bottomAnchor).isActive = true
        }else{
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
            let bView = UIVisualEffectView(effect: blurEffect)
            bView.translatesAutoresizingMaskIntoConstraints = false
            self.imgView2.addSubview(bView)
            bView.topAnchor.constraint(equalTo: imgView2.topAnchor).isActive = true
            bView.leftAnchor.constraint(equalTo: imgView2.leftAnchor).isActive = true
            bView.rightAnchor.constraint(equalTo: imgView2.rightAnchor).isActive = true
            bView.bottomAnchor.constraint(equalTo: imgView2.bottomAnchor).isActive = true
            
            let bView2 = UIVisualEffectView(effect: blurEffect)
            bView2.translatesAutoresizingMaskIntoConstraints = false
            self.imgView3.addSubview(bView2)
            bView2.topAnchor.constraint(equalTo: imgView3.topAnchor).isActive = true
            bView2.leftAnchor.constraint(equalTo: imgView3.leftAnchor).isActive = true
            bView2.rightAnchor.constraint(equalTo: imgView3.rightAnchor).isActive = true
            bView2.bottomAnchor.constraint(equalTo: imgView3.bottomAnchor).isActive = true
        }
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            ns1.constant = -60
            self.circleView1.alpha = 1
            self.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.2, delay: 0.3, options: .curveEaseIn, animations: {
            ns2.constant = -20
            self.circleView2.alpha = 1
            self.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.2, delay: 0.5, options: .curveEaseIn, animations: {
            ns3.constant = 20
            self.circleView3.alpha = 1
            self.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.2, delay: 0.7, options: .curveEaseIn, animations: {
            ns4.constant = 60
            self.circleView4.alpha = 1
            self.layoutIfNeeded()
        })
        
    }
    func openAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.nsCenter.constant = 0
            self.whiteView.alpha = 5
            self.shadowView.alpha = 0.3
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    func closeAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.nsCenter.constant = 200
            self.whiteView.alpha = -100
            self.shadowView.alpha = -1
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                completion()
            }
        }
    }
    
}
