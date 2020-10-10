//
//  EmptyDeliAlertView.swift
//  Delius
//
//  Created by user on 2020/08/26.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class EmptyDeliAlertView:UIView{
    
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
    let imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "LockDeli")
        return v
    }()
    let titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.boldSystemFont(ofSize: 20)
        l.textAlignment = .center
        l.text = "딜리가 부족해요"
        return l
    }()
    let deliLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.boldSystemFont(ofSize: 20)
        l.textAlignment = .center
        l.text = "데일리 딜리"
        return l
    }()
    let deli2Label:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.boldSystemFont(ofSize: 20)
        l.textAlignment = .center
        l.text = "구매한 딜리"
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
    let nextTitleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.boldSystemFont(ofSize: 20)
        l.textAlignment = .center
        l.text = "다음 데일리 딜리 시간"
        return l
    }()
    var timeLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.red
        l.font = UIFont.boldSystemFont(ofSize: 25)
        l.textAlignment = .center
        return l
    }()
    var deliCountLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.boldSystemFont(ofSize: 30)
        l.textAlignment = .center
        return l
    }()
    var deli2CountLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.boldSystemFont(ofSize: 30)
        l.textAlignment = .center
        return l
    }()
    let subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.lightGray
        l.font = UIFont.systemFont(ofSize: 12)
        l.textAlignment = .center
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.text = "'딜리어스 플러스' 또는 '딜리 구매'를 통해 더 많은 딜리로 마음에 맞는 사람을 찾으세요"
        return l
    }()
    var purchasePlusBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = UIColor.MainColor()
        b.layer.cornerRadius = 20
        b.setTitle("딜리어스 플러스", for: .normal)
        b.setTitleColor(UIColor.white, for: .normal)
        return b
    }()
    var purchaseDeliBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = UIColor.MainColor()
        b.layer.cornerRadius = 20
        b.setTitle("딜리 구매하기", for: .normal)
        b.setTitleColor(UIColor.white, for: .normal)
        return b
    }()
    var closeBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("닫기", for: .normal)
        b.setTitleColor(UIColor.MainBlackColor(), for: .normal)
        return b
    }()
    
    var nsCenter:NSLayoutConstraint!
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    private func setup(){
        self.addSubview(shadowView)
        shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shadowView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        shadowView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(whiteView)
        nsCenter = whiteView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 200)
        nsCenter.isActive = true
        whiteView.leftAnchor.constraint(equalTo: leftAnchor,constant: 40).isActive = true
        whiteView.rightAnchor.constraint(equalTo: rightAnchor,constant: -40).isActive = true
        
        whiteView.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 30).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imgView.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        
        whiteView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 30).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        whiteView.addSubview(lineView1)
        lineView1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        lineView1.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 30).isActive = true
        lineView1.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -10).isActive = true
        lineView1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        whiteView.addSubview(deliLabel)
        deliLabel.leftAnchor.constraint(equalTo: lineView1.leftAnchor).isActive = true
        deliLabel.rightAnchor.constraint(equalTo: lineView1.centerXAnchor).isActive = true
        deliLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deliLabel.topAnchor.constraint(equalTo: lineView1.bottomAnchor, constant: 5).isActive = true
        
        whiteView.addSubview(deli2Label)
        deli2Label.topAnchor.constraint(equalTo: deliLabel.topAnchor).isActive = true
        deli2Label.leftAnchor.constraint(equalTo: lineView1.centerXAnchor).isActive = true
        deli2Label.rightAnchor.constraint(equalTo: lineView1.rightAnchor).isActive = true
        deli2Label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        whiteView.addSubview(deliCountLabel)
        deliCountLabel.leftAnchor.constraint(equalTo: deliLabel.leftAnchor).isActive = true
        deliCountLabel.rightAnchor.constraint(equalTo: deliLabel.rightAnchor).isActive = true
        deliCountLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        deliCountLabel.topAnchor.constraint(equalTo: deliLabel.bottomAnchor).isActive = true
        
        whiteView.addSubview(deli2CountLabel)
        deli2CountLabel.topAnchor.constraint(equalTo: deli2Label.bottomAnchor).isActive = true
        deli2CountLabel.leftAnchor.constraint(equalTo: deli2Label.leftAnchor).isActive = true
        deli2CountLabel.rightAnchor.constraint(equalTo: deli2Label.rightAnchor).isActive = true
        deli2CountLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        whiteView.addSubview(lineView2)
        lineView2.topAnchor.constraint(equalTo: deli2CountLabel.bottomAnchor).isActive = true
        lineView2.leftAnchor.constraint(equalTo: lineView1.leftAnchor).isActive = true
        lineView2.rightAnchor.constraint(equalTo: lineView1.rightAnchor).isActive = true
        lineView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        whiteView.addSubview(nextTitleLabel)
        nextTitleLabel.topAnchor.constraint(equalTo: lineView2.bottomAnchor).isActive = true
        nextTitleLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        nextTitleLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        nextTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        whiteView.addSubview(timeLabel)
        timeLabel.topAnchor.constraint(equalTo: nextTitleLabel.bottomAnchor).isActive = true
        timeLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        whiteView.addSubview(lineView3)
        lineView3.topAnchor.constraint(equalTo: timeLabel.bottomAnchor).isActive = true
        lineView3.leftAnchor.constraint(equalTo: lineView1.leftAnchor).isActive = true
        lineView3.rightAnchor.constraint(equalTo: lineView1.rightAnchor).isActive = true
        lineView3.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        whiteView.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: lineView3.bottomAnchor).isActive = true
        subLabel.leftAnchor.constraint(equalTo: lineView1.leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: lineView1.rightAnchor).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        whiteView.addSubview(purchaseDeliBtn)
        purchaseDeliBtn.topAnchor.constraint(equalTo: subLabel.bottomAnchor).isActive = true
        purchaseDeliBtn.leftAnchor.constraint(equalTo: lineView1.leftAnchor).isActive = true
        purchaseDeliBtn.rightAnchor.constraint(equalTo: lineView1.rightAnchor).isActive = true
        purchaseDeliBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        whiteView.addSubview(purchasePlusBtn)
        purchasePlusBtn.topAnchor.constraint(equalTo: purchaseDeliBtn.bottomAnchor,constant: 10).isActive = true
        purchasePlusBtn.leftAnchor.constraint(equalTo: purchaseDeliBtn.leftAnchor).isActive = true
        purchasePlusBtn.rightAnchor.constraint(equalTo: purchaseDeliBtn.rightAnchor).isActive = true
        purchasePlusBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        whiteView.addSubview(lineView4)
        lineView4.topAnchor.constraint(equalTo: purchasePlusBtn.bottomAnchor,constant: 10).isActive = true
        lineView4.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        lineView4.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        lineView4.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        whiteView.addSubview(closeBtn)
        closeBtn.topAnchor.constraint(equalTo: lineView4.bottomAnchor).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        closeBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        
        whiteView.bottomAnchor.constraint(equalTo: closeBtn.bottomAnchor).isActive = true
        
        
        
        
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
            self.whiteView.alpha = -1
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
