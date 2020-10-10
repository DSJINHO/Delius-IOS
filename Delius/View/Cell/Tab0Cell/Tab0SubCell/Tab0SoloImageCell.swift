//
//  Tab0SoloImageCell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 28/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Tab0SoloImageCell:UICollectionViewCell{
    var circleView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOffset = CGSize(width: 10, height: 10)
        v.layer.shadowRadius = 10
        v.layer.shadowOpacity = 0.3
        v.layer.masksToBounds = false
        return v
    }()
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    var nsTop:NSLayoutConstraint!
    var nsLeft:NSLayoutConstraint!
    var nsRight:NSLayoutConstraint!
    var nsBtm:NSLayoutConstraint!
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
//        setup()
    }
    func setup(){
        self.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imgView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    func setupCircle(term t:CGFloat,spacing:CGFloat,url:URL){
        imgView.sd_setImage(with: url)
        circleView.layer.cornerRadius = frame.width/2 - t
        imgView.layer.cornerRadius = frame.width/2 - t - spacing
        circleView.alpha = 1
        
        self.addSubview(circleView)
        circleView.topAnchor.constraint(equalTo: topAnchor,constant: t).isActive = true
        circleView.leftAnchor.constraint(equalTo: leftAnchor, constant: t).isActive = true
        circleView.rightAnchor.constraint(equalTo: rightAnchor,constant: -t).isActive = true
        circleView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -t).isActive = true
        self.addSubview(imgView)
        nsTop = imgView.topAnchor.constraint(equalTo: topAnchor,constant: t + spacing)
        nsTop.isActive = true
        nsLeft = imgView.leftAnchor.constraint(equalTo: leftAnchor,constant: t + spacing)
        nsLeft.isActive = true
        nsRight = imgView.rightAnchor.constraint(equalTo: rightAnchor,constant: -t - spacing)
        nsRight.isActive = true
        nsBtm = imgView.bottomAnchor.constraint(equalTo: bottomAnchor,constant:  -t - spacing)
        nsBtm.isActive = true
    }
    func setupSquare(term t:CGFloat,spacing:CGFloat,url:URL){
        imgView.sd_setImage(with: url)
        circleView.layer.cornerRadius = frame.width/2 - t
        imgView.layer.cornerRadius = 0
        circleView.alpha = 0
        self.addSubview(circleView)
        circleView.topAnchor.constraint(equalTo: topAnchor,constant: t).isActive = true
        circleView.leftAnchor.constraint(equalTo: leftAnchor, constant: t).isActive = true
        circleView.rightAnchor.constraint(equalTo: rightAnchor, constant: -t).isActive = true
        circleView.bottomAnchor.constraint(equalTo: bottomAnchor,constant:  -t).isActive = true
        
        self.addSubview(imgView)
        nsTop = imgView.topAnchor.constraint(equalTo: topAnchor)
        nsTop.isActive = true
        nsLeft = imgView.leftAnchor.constraint(equalTo: leftAnchor)
        nsLeft.isActive = true
        nsRight = imgView.rightAnchor.constraint(equalTo: rightAnchor)
        nsRight.isActive = true
        nsBtm = imgView.bottomAnchor.constraint(equalTo: bottomAnchor)
        nsBtm.isActive = true
        
    }
    
    func CircleAnimation(circle:Bool){
        let Animator = UIViewPropertyAnimator(duration: 0.1, curve: .easeIn, animations: {
            if circle{
                self.imgView.layer.cornerRadius = self.frame.width/2 - 35
                self.circleView.alpha = 1
                self.nsTop.constant = 35
                self.nsLeft.constant = 35
                self.nsRight.constant = -35
                self.nsBtm.constant = -35
            }else{
                self.circleView.alpha = 0
                self.imgView.layer.cornerRadius = 0
                self.nsTop.constant = 0
                self.nsLeft.constant = 0
                self.nsRight.constant = 0
                self.nsBtm.constant = 0
                
            }
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    override func prepareForReuse() {
        imgView.removeFromSuperview()
        imgView.image = nil
        nsTop = nil
        nsLeft = nil
        nsRight = nil
        nsBtm = nil
    }
}
