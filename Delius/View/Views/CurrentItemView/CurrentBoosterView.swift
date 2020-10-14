//
//  CurrentBoosterView.swift
//  Delius
//
//  Created by 박진호 on 2020/06/29.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class CurrentBoosterView:UIView{
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
        v.image = UIImage(named: "BoosterViewIcon")
        v.contentMode = .scaleAspectFit
        return v
    }()
    let titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusSystemType5()
        l.textAlignment = .center
        l.textColor = .MainBlackColor()
        l.text = "CurrentBoosterView001".localize()
        return l
    }()
    var boosterCountLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType5()
        l.textAlignment = .center
        l.textColor = UIColor.MainBlackColor()
        l.text = "0"
        return l
    }()
    var gradationView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainPurpleColor()
//        v.clipsToBounds = true
        v.layer.cornerRadius = 25
        v.layer.shadowColor = UIColor.MainBlackColor().cgColor
        v.layer.shadowOffset = CGSize(width: 2, height: 2)
        v.layer.shadowOpacity = 0.3
        
        return v
    }()
    var useBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = .clear
        b.titleLabel?.font! = UIFont.DeliusBoldType1()
        b.setTitle("CurrentBoosterView002".localize(), for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.tintColor = UIColor.white
        return b
    }()
    
    let subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusSystemType2()
        l.textAlignment = .center
        l.textColor = UIColor.MainLightGrayColor()
        l.text = "CurrentBoosterView003".localize()
        return l
    }()
    let lineView1:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainLightGrayColor()
        return v
    }()
    var closeBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("ReportView002".localize(), for: .normal)
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
        let wd = (frame.width - 60)
        let btnWidth = wd/4
        let viewHeight:CGFloat = 250 + btnWidth*2
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
        imgView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imgView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 30).isActive = true
        
        whiteView.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 15).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        whiteView.addSubview(boosterCountLabel)
        boosterCountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        boosterCountLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        boosterCountLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        boosterCountLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        whiteView.addSubview(gradationView)
        gradationView.topAnchor.constraint(equalTo: boosterCountLabel.bottomAnchor, constant: 10).isActive = true
        gradationView.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 30).isActive = true
        gradationView.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -30).isActive = true
        gradationView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        whiteView.addSubview(useBtn)
        useBtn.topAnchor.constraint(equalTo: gradationView.topAnchor).isActive = true
        useBtn.leftAnchor.constraint(equalTo: gradationView.leftAnchor).isActive = true
        useBtn.rightAnchor.constraint(equalTo: gradationView.rightAnchor).isActive = true
        useBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        whiteView.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: useBtn.bottomAnchor, constant: 25).isActive = true
        subLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        
        whiteView.addSubview(closeBtn)
        closeBtn.centerYAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -25).isActive = true
        closeBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        closeBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        whiteView.addSubview(lineView1)
        lineView1.bottomAnchor.constraint(equalTo: closeBtn.centerYAnchor, constant: -25).isActive = true
        lineView1.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        lineView1.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        lineView1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
    }
    
    func openAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.nsCenter.constant = -30
            self.touchView.alpha = 0.3
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
