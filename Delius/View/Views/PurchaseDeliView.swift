//
//  PurchaseDeliView.swift
//  Delius
//
//  Created by user on 2020/08/29.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class PurchaseDeliView:UIView{
    var currentPage = 0
    var shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainBlackColor()
        v.alpha = 0
        return v
    }()
    var whiteView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.clipsToBounds = true
        v.alpha = 0
        return v
    }()
    var gView:DeliGradationView!
    lazy var collectionView:UICollectionView={
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.clear
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    var circleView1:UIView={
        let c = UIView()
        c.translatesAutoresizingMaskIntoConstraints = false
        c.layer.cornerRadius = 3
        c.backgroundColor = .MainGrayColor()
        c.layer.opacity = 1
        c.clipsToBounds = true
        return c
    }()
    var circleView2:UIView={
        let c = UIView()
        c.translatesAutoresizingMaskIntoConstraints = false
        c.layer.cornerRadius = 3
        c.backgroundColor = .MainGrayColor()
        c.layer.opacity = 0.5
        c.clipsToBounds = true
        return c
    }()
    var circleView3:UIView={
        let c = UIView()
        c.translatesAutoresizingMaskIntoConstraints = false
        c.layer.cornerRadius = 3
        c.backgroundColor = .MainGrayColor()
        c.layer.opacity = 0.5
        c.clipsToBounds = true
        return c
    }()
    var circleView4:UIView={
        let c = UIView()
        c.translatesAutoresizingMaskIntoConstraints = false
        c.layer.cornerRadius = 3
        c.backgroundColor = .MainGrayColor()
        c.layer.opacity = 0.5
        c.clipsToBounds = true
        return c
    }()
    
    let lineView3:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainLightGrayColor()
        return v
    }()
    
    var sumLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainGrayColor()
        l.font = .DeliusSystemType3()
        l.textAlignment = .center
        l.text = "PurchaseDeliString100".localize()
        return l
    }()
    
    
    let lineView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainLightGrayColor()
        return v
    }()
    let costLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .MainPinkColor()
        l.font = .DeliusBoldType0()
        l.textAlignment = .center
        l.baselineAdjustment = .alignBaselines
        l.text = "PurchasePlusString101".localize()
        return l
    }()
    var purchaseBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.cornerRadius = 25
        b.backgroundColor = .MainPinkColor()
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.font = .DeliusBoldType5()
        b.layer.shadowOpacity = 0.3
        b.layer.shadowColor = UIColor.MainBlackColor1().cgColor
        b.layer.shadowOffset = CGSize(width: 2, height: 2)
        b.setTitle("PurchasePlusString102".localize(), for: .normal)
        return b
    }()
    var subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .MainBlackColor1()
        l.font = .DeliusSystemType1()
        l.textAlignment = .center
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.text = "PurchasePlusString201".localize()
        return l
    }()
    var termBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("PurchaseTerm".localize(), for: .normal)
        b.setTitleColor(UIColor.blackType3(), for: .normal)
        b.titleLabel?.font = .DeliusBoldType7()
        return b
    }()
    var closeBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("CloseBtn".localize(), for: .normal)
        b.setTitleColor(UIColor.blackType3(), for: .normal)
        b.titleLabel?.font = UIFont.DeliusBoldType2()
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
        nsCenter = whiteView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -self.frame.height)
        nsCenter.isActive = true
        whiteView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        whiteView.rightAnchor.constraint(equalTo: rightAnchor,constant: -30).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: (self.frame.width - 60)*1.8).isActive = true
        
        gView = DeliGradationView(frame: CGRect(x: 0, y: 0, width: self.frame.width-60, height: 90))
        gView.clipsToBounds = true
        whiteView.addSubview(gView)
        gView.topAnchor.constraint(equalTo: whiteView.topAnchor).isActive = true
        gView.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        gView.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        gView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        whiteView.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: whiteView.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        whiteView.addSubview(circleView2)
        circleView2.topAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        circleView2.rightAnchor.constraint(equalTo: whiteView.centerXAnchor, constant: -3).isActive = true
        circleView2.widthAnchor.constraint(equalToConstant: 6).isActive = true
        circleView2.heightAnchor.constraint(equalToConstant: 6).isActive = true
        
        whiteView.addSubview(circleView1)
        circleView1.topAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        circleView1.rightAnchor.constraint(equalTo: circleView2.leftAnchor, constant: -6).isActive = true
        circleView1.widthAnchor.constraint(equalToConstant: 6).isActive = true
        circleView1.heightAnchor.constraint(equalToConstant: 6).isActive = true
        
        whiteView.addSubview(circleView3)
        circleView3.topAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        circleView3.leftAnchor.constraint(equalTo: whiteView.centerXAnchor, constant: 3).isActive = true
        circleView3.widthAnchor.constraint(equalToConstant: 6).isActive = true
        circleView3.heightAnchor.constraint(equalToConstant: 6).isActive = true
        
        whiteView.addSubview(circleView4)
        circleView4.topAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        circleView4.leftAnchor.constraint(equalTo: circleView3.rightAnchor, constant: 6).isActive = true
        circleView4.widthAnchor.constraint(equalToConstant: 6).isActive = true
        circleView4.heightAnchor.constraint(equalToConstant: 6).isActive = true
        
        
        whiteView.addSubview(lineView3)
        lineView3.topAnchor.constraint(equalTo: circleView2.bottomAnchor, constant: 20).isActive = true
        lineView3.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 30).isActive = true
        lineView3.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -30).isActive = true
        lineView3.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        whiteView.addSubview(sumLabel)
        sumLabel.topAnchor.constraint(equalTo: lineView3.bottomAnchor, constant: 15).isActive = true
        sumLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        sumLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        sumLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        
        whiteView.addSubview(costLabel)
        costLabel.topAnchor.constraint(equalTo: sumLabel.bottomAnchor, constant: 5).isActive = true
        costLabel.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        costLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        costLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        whiteView.addSubview(purchaseBtn)
        purchaseBtn.topAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: 10).isActive = true
        purchaseBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        purchaseBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 30).isActive = true
        purchaseBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -30).isActive = true
        
        
        whiteView.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: purchaseBtn.bottomAnchor, constant: 10).isActive = true
        subLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 20).isActive = true
        subLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -20).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let termWidth = "PurchaseTerm".localize().StringWidth(withConstrainedHeight: 20, font: UIFont.systemFont(ofSize: 13)) + 10
        whiteView.addSubview(termBtn)
        termBtn.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 10).isActive = true
        termBtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
        termBtn.widthAnchor.constraint(equalToConstant: termWidth).isActive = true
        termBtn.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        
        let lineView = UIView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = .MainBlackColor1()
        
        termBtn.addSubview(lineView)
        lineView.bottomAnchor.constraint(equalTo: termBtn.bottomAnchor, constant: -3).isActive = true
        lineView.leftAnchor.constraint(equalTo: termBtn.leftAnchor).isActive = true
        lineView.rightAnchor.constraint(equalTo: termBtn.rightAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        whiteView.addSubview(closeBtn)
        closeBtn.centerYAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -25).isActive = true
        closeBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        closeBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        whiteView.addSubview(lineView2)
        lineView2.bottomAnchor.constraint(equalTo: closeBtn.centerYAnchor, constant: -25).isActive = true
        lineView2.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        lineView2.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        lineView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        
    }
    var timer:Timer!
    private func showAnimation(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (Timer) in
            self.createImgView()
            
        })
    }
    private func createImgView(){
        let v = UIImageView()
        if currentPage == 0{
            v.image = UIImage(named: "PurchasePlusType1")
            circleView1.layer.opacity = 1
            circleView2.layer.opacity = 0.5
            circleView3.layer.opacity = 0.5
            circleView4.layer.opacity = 0.5
        }else if currentPage == 1{
            v.image = UIImage(named: "PurchasePlusType2")
            circleView1.layer.opacity = 0.5
            circleView2.layer.opacity = 1
            circleView3.layer.opacity = 0.5
            circleView4.layer.opacity = 0.5
            
        }else if currentPage == 2{
            v.image = UIImage(named: "PurchasePlusType3")
            circleView1.layer.opacity = 0.5
            circleView2.layer.opacity = 0.5
            circleView3.layer.opacity = 1
            circleView4.layer.opacity = 0.5
        }else if currentPage == 3{
            v.image = UIImage(named: "PurchasePlusType4")
            circleView1.layer.opacity = 0.5
            circleView2.layer.opacity = 0.5
            circleView3.layer.opacity = 0.5
            circleView4.layer.opacity = 1
        }
        v.contentMode = .scaleAspectFit
        let x = CGFloat.random(in: self.frame.width/4..<self.frame.width/4*3)
        let size = CGFloat.random(in: 22..<35)
        v.frame = CGRect(x:x,y:100,width:size,height: size)
        gView.addSubview(v)
        let Animator = UIViewPropertyAnimator(duration: 1.5, curve: .easeIn, animations: {
            v.transform = CGAffineTransform(translationX: 0, y: -150)
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                v.removeFromSuperview()
            }
        }
    }
    func openAnimation(){
        showAnimation()
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.nsCenter.constant = 0
            self.whiteView.alpha = 5
            self.shadowView.alpha = 0.7
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    func closeAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.nsCenter.constant = self.frame.height
            self.shadowView.alpha = -1
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                self.timer.invalidate()
                completion()
            }
        }
    }
}
