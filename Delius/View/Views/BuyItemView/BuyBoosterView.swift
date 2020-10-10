//
//  BuyBoosterView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/05.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class BuyBoosterView:UIView{
    let titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.text = "BuyBoosterView001".localize()
        l.font = UIFont.DeliusBoldType5()
        l.textAlignment = .center
        l.numberOfLines = 2
        l.lineBreakMode = .byWordWrapping
        l.baselineAdjustment = .alignBaselines
        return l
    }()
    var cancelBtn:IconButton1!
    let scrollView:UIScrollView={
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.showsVerticalScrollIndicator = false
        v.clipsToBounds = false
        return v
    }()
    let introImgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.image = UIImage(named: "BuyBoosterView")
        return v
    }()
    let btmView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    let termView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainLightGrayColor2()
        return v
    }()
    let termLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainGrayColor()
        l.font = UIFont.DeliusSystemType2()
        l.textAlignment = .left
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.text = "BuyBoosterView002".localize()
        return l
    }()
    var termBtn:UIButton={
        let lineView=UIView()
        lineView.backgroundColor = .MainGrayColor()
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(UIColor.MainGrayColor(), for: .normal)
        b.setTitle("BuyBoosterView101".localize(), for: .normal)
        b.titleLabel!.font = UIFont.DeliusSystemType2()
        lineView.frame = CGRect(x:0,y:0,width:b.frame.width,height: 1)
        b.addSubview(lineView)
        return b
    }()
    let subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainGrayColor()
        l.font = UIFont.DeliusSystemType2()
        l.textAlignment = .center
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.text = "BuyBoosterView102".localize()
        return l
    }()
    //let imgView:UIImageView={
    //    let v = UIImageView()
    //    v.translatesAutoresizingMaskIntoConstraints = false
    //    v.backgroundColor = UIColor.MainBlackColor1()
    //    return v
    //}()
    var buyBtn:BuyBoosterButton!
    var nsScroll:NSLayoutConstraint!
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.MainBlackColor().withAlphaComponent(0)
        setup(width: frame.width,height:frame.height)
    }
    private func setup(width:CGFloat,height:CGFloat){
        
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let btmPadding = window.safeAreaInsets.bottom
        let buyBtnHeight = ( width - 60 )/4 + 40
        let scrollHeight = 100 + buyBtnHeight
        let introImgHeight = height - topPadding - btmPadding - 60 - scrollHeight
        
        
        scrollView.contentSize = CGSize(width: 0, height: scrollHeight + 1)
        self.addSubview(scrollView)
        nsScroll = scrollView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: scrollHeight)
        nsScroll.isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: scrollHeight).isActive = true
        
        scrollView.addSubview(btmView)
        btmView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        btmView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        btmView.widthAnchor.constraint(equalToConstant: width).isActive = true
        btmView.heightAnchor.constraint(equalToConstant: 700).isActive = true
        
        btmView.addSubview(termView)
        termView.topAnchor.constraint(equalTo: btmView.topAnchor).isActive = true
        termView.leftAnchor.constraint(equalTo: btmView.leftAnchor).isActive = true
        termView.rightAnchor.constraint(equalTo: btmView.rightAnchor).isActive = true
        termView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let termBtnWidth = "BuyBoosterView101".localize().StringWidth(withConstrainedHeight: 30, font: UIFont.DeliusBoldType1())
        termView.addSubview(termBtn)
        termBtn.centerYAnchor.constraint(equalTo: termView.centerYAnchor).isActive = true
        termBtn.rightAnchor.constraint(equalTo: termView.rightAnchor, constant: -30).isActive = true
        termBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        termBtn.widthAnchor.constraint(equalToConstant: termBtnWidth).isActive = true
        
        
        termView.addSubview(termLabel)
        termLabel.topAnchor.constraint(equalTo: termView.topAnchor).isActive = true
        termLabel.leftAnchor.constraint(equalTo: termView.leftAnchor,constant: 30).isActive = true
        termLabel.rightAnchor.constraint(equalTo: termBtn.leftAnchor, constant: -20).isActive = true
        termLabel.bottomAnchor.constraint(equalTo: termView.bottomAnchor).isActive = true
        
        buyBtn = BuyBoosterButton(frame: CGRect(x:0,y:0,width: width,height:buyBtnHeight))
        btmView.addSubview(buyBtn)
        buyBtn.topAnchor.constraint(equalTo: termView.bottomAnchor,constant:10).isActive = true
        buyBtn.leftAnchor.constraint(equalTo: btmView.leftAnchor).isActive = true
        buyBtn.rightAnchor.constraint(equalTo: btmView.rightAnchor).isActive = true
        buyBtn.heightAnchor.constraint(equalToConstant: buyBtnHeight).isActive = true
        
        btmView.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: buyBtn.bottomAnchor, constant: 5).isActive = true
        subLabel.centerXAnchor.constraint(equalTo: buyBtn.centerXAnchor).isActive = true
        subLabel.widthAnchor.constraint(equalToConstant: buyBtn.frame.width).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        cancelBtn = IconButton1(imgName: "c", color: .white, frame: CGRect(x:0,y:0,width:30,height:30))
        self.addSubview(cancelBtn)
        cancelBtn.topAnchor.constraint(equalTo: topAnchor,constant: topPadding + 20).isActive = true
        cancelBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        cancelBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cancelBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: cancelBtn.bottomAnchor, constant:  introImgHeight/20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        self.addSubview(introImgView)
        introImgView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: -30).isActive = true
        introImgView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        introImgView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        introImgView.heightAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        
        self.bringSubviewToFront(scrollView)
        
    }
    func appearAnimation(){
        let window = UIApplication.shared.windows[0]
        let btmPadding = window.safeAreaInsets.bottom
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.nsScroll.constant = -btmPadding
            self.backgroundColor = UIColor.MainBlackColor().withAlphaComponent(0.9)
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    func disappearAnimation(completion:@escaping()->Void){
        let window = UIApplication.shared.windows[0]
        let btmPadding = window.safeAreaInsets.bottom
        let buyBtnHeight = ( self.frame.width - 60 )/4
        let scrollHeight = 60 + 100 + buyBtnHeight
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.nsScroll.constant = -btmPadding + scrollHeight
            self.backgroundColor = UIColor.MainBlackColor().withAlphaComponent(0)
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
