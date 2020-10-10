//
//  CurrentDeliView.swift
//  Delius
//
//  Created by 박진호 on 2020/06/29.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class CurrentDeliView:UIView{
    var touchView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainBlackColor()
        v.alpha = 0
        return v
    }()
    let whiteView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.alpha = 0
        return v
    }()
    let imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "DeliViewIcon")
        v.contentMode = .scaleAspectFit
        return v
    }()
    let dailyDeliLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType7()
        l.textAlignment = .center
        l.textColor = UIColor.MainGrayColor()
        l.text = "CurrentDeliView001".localize()
        return l
    }()
    let buyDeliLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType7()
        l.textAlignment = .center
        l.textColor = UIColor.MainGrayColor()
        l.text = "CurrentDeliView002".localize()
        return l
    }()
    let lineView1:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainLightGrayColor2()
        return v
    }()
    
    let lineView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainLightGrayColor2()
        return v
    }()
    
    var dailyCountLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType5()
        l.textAlignment = .center
        l.textColor = UIColor.MainGrayColor()
        return l
    }()
    var buyCountLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType5()
        l.textAlignment = .center
        l.textColor = UIColor.MainGrayColor()
        return l
    }()
    
    var timeCountLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType7()
        l.textAlignment = .center
        l.textColor = UIColor.MainGrayColor()
        l.backgroundColor = UIColor.MainLightGrayColor2()
        return l
    }()
    var subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusSystemType2()
        l.textAlignment = .center
        l.textColor = UIColor.MainLightGrayColor()
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.text = "CurrentDeliView003".localize()
        return l
    }()
    var closeBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("구매하기", for: .normal)
        b.setTitleColor(UIColor.MainGrayColor(), for: .normal)
        b.titleLabel!.font = UIFont.DeliusBoldType2()
        b.contentHorizontalAlignment = .center
        return b
    }()
    var nsCenter:NSLayoutConstraint!
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
//    init(cash:CashItemStruct,frame:CGRect){
//        super.init(frame: frame)
//        self.translatesAutoresizingMaskIntoConstraints = false
//        self.backgroundColor = .clear
//        setup(width:frame.width)
//    }
    override init(frame:CGRect){
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        let wd = (frame.width - 120)
        let btnWidth = wd/4
        let viewHeight:CGFloat = 170 + btnWidth*1.7
        //let btnFrame = CGRect(x:0,y:0,width:btnWidth,height:btnWidth)
        setup(wd: wd, btnWidth: btnWidth, viewHeight: viewHeight)
    }
    private func setup(wd:CGFloat,btnWidth:CGFloat,viewHeight:CGFloat){
        self.addSubview(touchView)
        touchView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        touchView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        touchView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        touchView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(whiteView)
        nsCenter = whiteView.centerYAnchor.constraint(equalTo: centerYAnchor)
        nsCenter.isActive = true
        whiteView.widthAnchor.constraint(equalToConstant: wd).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
        whiteView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        whiteView.addSubview(imgView)
        imgView.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        imgView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 20).isActive = true
        
        whiteView.addSubview(dailyDeliLabel)
        dailyDeliLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        dailyDeliLabel.rightAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        dailyDeliLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 15).isActive = true
        dailyDeliLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        whiteView.addSubview(buyDeliLabel)
        buyDeliLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        buyDeliLabel.leftAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        buyDeliLabel.topAnchor.constraint(equalTo: dailyDeliLabel.topAnchor).isActive = true
        buyDeliLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        whiteView.addSubview(dailyCountLabel)
        dailyCountLabel.topAnchor.constraint(equalTo: dailyDeliLabel.bottomAnchor).isActive = true
        dailyCountLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        dailyCountLabel.rightAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        dailyCountLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        whiteView.addSubview(buyCountLabel)
        buyCountLabel.topAnchor.constraint(equalTo: dailyCountLabel.topAnchor).isActive = true
        buyCountLabel.leftAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        buyCountLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        buyCountLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        whiteView.addSubview(lineView1)
        lineView1.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        lineView1.widthAnchor.constraint(equalToConstant: 1).isActive = true
        lineView1.topAnchor.constraint(equalTo: buyCountLabel.topAnchor, constant: 10).isActive = true
        lineView1.bottomAnchor.constraint(equalTo: buyCountLabel.bottomAnchor, constant: -10).isActive = true
        
        whiteView.addSubview(timeCountLabel)
        timeCountLabel.topAnchor.constraint(equalTo: buyCountLabel.bottomAnchor,constant: 5).isActive = true
        timeCountLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        timeCountLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        timeCountLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        whiteView.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: timeCountLabel.bottomAnchor, constant: 5).isActive = true
        subLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        whiteView.addSubview(lineView2)
        lineView2.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 5).isActive = true
        lineView2.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        lineView2.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        lineView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        whiteView.addSubview(closeBtn)
        closeBtn.topAnchor.constraint(equalTo: lineView2.bottomAnchor).isActive = true
        closeBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        closeBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        closeBtn.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor).isActive = true
        
    }
    
    func openAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.nsCenter.constant = -30
            self.touchView.alpha = 0.7
            self.whiteView.alpha = 1
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    func closeAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.nsCenter.constant = 0
            self.touchView.alpha = 0
            self.whiteView.alpha = 0
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
