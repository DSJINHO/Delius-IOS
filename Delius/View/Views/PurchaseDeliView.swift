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
        v.layer.cornerRadius = 15
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
        return cv
    }()
    let lineView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.lightGray
        return v
    }()
    let costLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.pinkType1()
        l.font = UIFont.boldSystemFont(ofSize: 33)
        l.textAlignment = .center
        l.baselineAdjustment = .alignBaselines
        l.text = "PurchasePlusString101".localize()
        return l
    }()
    var purchaseBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.cornerRadius = 25
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        b.layer.shadowOpacity = 0.7
        b.layer.shadowColor = UIColor.blackType3().cgColor
        b.layer.shadowRadius = 3
        b.layer.shadowOffset = CGSize(width: 2, height: 2)
        b.setTitle("PurchasePlusString102".localize(), for: .normal)
        return b
    }()
    var subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.grayType1()
        l.font = UIFont.systemFont(ofSize: 14)
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
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
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
        
        gView = DeliGradationView(frame: CGRect(x: 0, y: 0, width: self.frame.width-60, height: 100))
        gView.clipsToBounds = true
        whiteView.addSubview(gView)
        gView.topAnchor.constraint(equalTo: whiteView.topAnchor).isActive = true
        gView.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        gView.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        gView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        whiteView.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: whiteView.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 230).isActive = true
        
        
        whiteView.addSubview(costLabel)
        costLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 35).isActive = true
        costLabel.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        costLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        costLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        whiteView.addSubview(purchaseBtn)
        purchaseBtn.topAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: 15).isActive = true
        purchaseBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        purchaseBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 40).isActive = true
        purchaseBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -40).isActive = true
        
        let btnGraView = PurchaseGradationView(frame: CGRect(x: 0, y: 0, width: self.frame.width-140, height: 50), startColor: UIColor.pinkType1(), endColor: UIColor.pinkType2())
        purchaseBtn.addSubview(btnGraView)
        purchaseBtn.sendSubviewToBack(btnGraView)
        
        whiteView.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: purchaseBtn.bottomAnchor, constant: 15).isActive = true
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
        lineView.backgroundColor = UIColor.blackType3()
        
        termBtn.addSubview(lineView)
        lineView.bottomAnchor.constraint(equalTo: termBtn.bottomAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: termBtn.leftAnchor).isActive = true
        lineView.rightAnchor.constraint(equalTo: termBtn.rightAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        whiteView.addSubview(lineView2)
        lineView2.topAnchor.constraint(equalTo: termBtn.bottomAnchor, constant: 10).isActive = true
        lineView2.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        lineView2.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        lineView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        whiteView.addSubview(closeBtn)
        closeBtn.topAnchor.constraint(equalTo: lineView2.bottomAnchor).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        closeBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        
        whiteView.bottomAnchor.constraint(equalTo: closeBtn.bottomAnchor).isActive = true
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
        }else if currentPage == 1{
            v.image = UIImage(named: "PurchasePlusType2")
            
        }else if currentPage == 2{
            v.image = UIImage(named: "PurchasePlusType3")
            
        }else if currentPage == 3{
            v.image = UIImage(named: "PurchasePlusType4")
            
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
            self.shadowView.alpha = 0.3
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
