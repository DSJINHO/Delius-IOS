//
//  PurchaseDeliView.swift
//  Delius
//
//  Created by user on 2020/08/29.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class PurchaseLikeView:UIView{
    var currentPage = 0
    var shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.blackType1()
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
    var gView:LikeGradationView!
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
        v.backgroundColor = UIColor.grayType3()
        return v
    }()
    var purchaseBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.cornerRadius = 25
        b.setTitle("PurchaseDeliString902".localize(), for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        b.layer.shadowOpacity = 0.7
        b.layer.shadowColor = UIColor.blackType3().cgColor
        b.layer.shadowRadius = 3
        b.layer.shadowOffset = CGSize(width: 2, height: 2)
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
        l.text = "PurchaseDeliString901".localize()
        return l
    }()
    var termBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("PurchaseTerm".localize(), for: .normal)
        b.setTitleColor(UIColor.blackType3(), for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 13)
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
    var purchaseBtn1:PurchaseSubBtn!
    var purchaseBtn2:PurchaseSubBtn!
    var purchaseBtn3:PurchaseSubBtn!
    
    
    let cornerView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.grayType2()
        return v
    }()
    var btnBackView1:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.yellowType1()
        v.isHidden = true
        return v
    }()
    var btnBackView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.yellowType1()
        return v
    }()
    var btnBackView3:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.yellowType1()
        v.isHidden = true
        return v
    }()
    
    
    var nsCenter:NSLayoutConstraint!
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let btnFrame = CGRect(x:0,y:0,width: (self.frame.width-100)/3,height:130)
        purchaseBtn1 = PurchaseSubBtn(frame: btnFrame, tint: UIColor.grayType3(), str1: "PurchaseDeliString101".localize(), str2: "PurchaseDeliString201".localize(), str3: "PurchaseDeliString301".localize())
        purchaseBtn2 = PurchaseSubBtn(frame: btnFrame, tint: UIColor.yellowType1(), str1: "PurchaseDeliString102".localize(), str2: "PurchaseDeliString202".localize(), str3: "PurchaseDeliString302".localize())
        purchaseBtn3 = PurchaseSubBtn(frame: btnFrame, tint: UIColor.grayType3(), str1: "PurchaseDeliString103".localize(), str2: "PurchaseDeliString203".localize(), str3: "PurchaseDeliString303".localize())

        
        
        
        setup(d:(self.frame.width-100)/3)
        
    }
    private func setup(d:CGFloat){
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
        
        gView = LikeGradationView(frame: CGRect(x: 0, y: 0, width: self.frame.width-60, height: 100))
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
        
        
        
        
        
        
        whiteView.addSubview(purchaseBtn2)
        purchaseBtn2.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        purchaseBtn2.widthAnchor.constraint(equalToConstant: d).isActive = true
        purchaseBtn2.heightAnchor.constraint(equalToConstant: 130).isActive = true
        purchaseBtn2.topAnchor.constraint(equalTo: collectionView.bottomAnchor,constant: 20).isActive = true
        
        whiteView.addSubview(purchaseBtn1)
        purchaseBtn1.topAnchor.constraint(equalTo: purchaseBtn2.topAnchor).isActive = true
        purchaseBtn1.bottomAnchor.constraint(equalTo: purchaseBtn2.bottomAnchor).isActive = true
        purchaseBtn1.rightAnchor.constraint(equalTo: purchaseBtn2.leftAnchor, constant: -2).isActive = true
        purchaseBtn1.widthAnchor.constraint(equalToConstant: d).isActive = true
        
        whiteView.addSubview(purchaseBtn3)
        purchaseBtn3.topAnchor.constraint(equalTo: purchaseBtn2.topAnchor).isActive = true
        purchaseBtn3.bottomAnchor.constraint(equalTo: purchaseBtn2.bottomAnchor).isActive = true
        purchaseBtn3.leftAnchor.constraint(equalTo: purchaseBtn2.rightAnchor, constant: 2).isActive = true
        purchaseBtn3.widthAnchor.constraint(equalToConstant: d).isActive = true
        
        whiteView.addSubview(cornerView)
        cornerView.topAnchor.constraint(equalTo: purchaseBtn1.topAnchor, constant: -2).isActive = true
        cornerView.leftAnchor.constraint(equalTo: purchaseBtn1.leftAnchor,constant: -2).isActive = true
        cornerView.rightAnchor.constraint(equalTo: purchaseBtn3.rightAnchor, constant: 2).isActive = true
        cornerView.bottomAnchor.constraint(equalTo: purchaseBtn1.bottomAnchor, constant: 2).isActive = true
        
        whiteView.addSubview(btnBackView1)
        btnBackView1.topAnchor.constraint(equalTo: purchaseBtn1.topAnchor,constant: -2).isActive = true
        btnBackView1.leftAnchor.constraint(equalTo: purchaseBtn1.leftAnchor, constant: -2).isActive = true
        btnBackView1.rightAnchor.constraint(equalTo: purchaseBtn1.rightAnchor,constant: 2).isActive = true
        btnBackView1.bottomAnchor.constraint(equalTo: purchaseBtn1.bottomAnchor,constant: 2).isActive = true
        
        whiteView.addSubview(btnBackView2)
        btnBackView2.topAnchor.constraint(equalTo: purchaseBtn2.topAnchor, constant: -2).isActive = true
        btnBackView2.leftAnchor.constraint(equalTo: purchaseBtn2.leftAnchor, constant: -2).isActive = true
        btnBackView2.rightAnchor.constraint(equalTo: purchaseBtn2.rightAnchor, constant: 2).isActive = true
        btnBackView2.bottomAnchor.constraint(equalTo: purchaseBtn2.bottomAnchor, constant: 2).isActive = true
        
        whiteView.addSubview(btnBackView3)
        btnBackView3.topAnchor.constraint(equalTo: purchaseBtn3.topAnchor, constant: -2).isActive = true
        btnBackView3.leftAnchor.constraint(equalTo: purchaseBtn3.leftAnchor, constant: -2).isActive = true
        btnBackView3.rightAnchor.constraint(equalTo: purchaseBtn3.rightAnchor, constant: 2).isActive = true
        btnBackView3.bottomAnchor.constraint(equalTo: purchaseBtn3.bottomAnchor, constant: 2).isActive = true
        
        
        whiteView.sendSubviewToBack(btnBackView1)
        whiteView.sendSubviewToBack(btnBackView2)
        whiteView.sendSubviewToBack(btnBackView3)
        whiteView.sendSubviewToBack(cornerView)
        
        whiteView.addSubview(purchaseBtn)
        purchaseBtn.topAnchor.constraint(equalTo: purchaseBtn2.bottomAnchor, constant: 15).isActive = true
        purchaseBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        purchaseBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 40).isActive = true
        purchaseBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -40).isActive = true
        
        let btnGraView = PurchaseGradationView(frame: CGRect(x:0,y:0,width:self.frame.width - 140,height:50), startColor: UIColor.yellowType1(), endColor: UIColor.yellowType2())
        purchaseBtn.addSubview(btnGraView)
        purchaseBtn.sendSubviewToBack(btnGraView)
        
        
        whiteView.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: purchaseBtn.bottomAnchor, constant: 15).isActive = true
        subLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 20).isActive = true
        subLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -20).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let termWidth = "Purchase".localize().StringWidth(withConstrainedHeight: 20, font: UIFont.systemFont(ofSize: 13)) + 10
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
        lineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
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
            v.image = UIImage(named: "PurchaseLikeType1")
        }else if currentPage == 1{
            v.image = UIImage(named: "PurchaseLikeType2")
            
        }else{
            v.image = UIImage(named: "PurchaseLikeType3")
            
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
    func typeBtnFunc(type:Int){
        if type == 1{
            btnBackView1.backgroundColor = UIColor.yellowType1()
            btnBackView2.backgroundColor = UIColor.grayType2()
            btnBackView3.backgroundColor = UIColor.grayType2()
            purchaseBtn1.countLabel.textColor = UIColor.yellowType1()
            purchaseBtn1.costLabel.textColor = UIColor.yellowType1()
            purchaseBtn2.countLabel.textColor = UIColor.grayType2()
            purchaseBtn2.costLabel.textColor = UIColor.grayType2()
            purchaseBtn3.countLabel.textColor = UIColor.grayType2()
            purchaseBtn3.costLabel.textColor = UIColor.grayType2()
            btnBackView1.isHidden = false
            btnBackView2.isHidden = true
            btnBackView3.isHidden = true
            return
        }
        if type == 2{
            btnBackView1.backgroundColor = UIColor.grayType2()
            btnBackView2.backgroundColor = UIColor.yellowType1()
            btnBackView3.backgroundColor = UIColor.grayType2()
            purchaseBtn1.countLabel.textColor = UIColor.grayType2()
            purchaseBtn1.costLabel.textColor = UIColor.grayType2()
            purchaseBtn2.countLabel.textColor = UIColor.yellowType1()
            purchaseBtn2.costLabel.textColor = UIColor.yellowType1()
            purchaseBtn3.countLabel.textColor = UIColor.grayType2()
            purchaseBtn3.costLabel.textColor = UIColor.grayType2()
            btnBackView1.isHidden = true
            btnBackView2.isHidden = false
            btnBackView3.isHidden = true
            return
        }
        if type == 3{
            btnBackView1.backgroundColor = UIColor.grayType2()
            btnBackView2.backgroundColor = UIColor.grayType2()
            btnBackView3.backgroundColor = UIColor.yellowType1()
            purchaseBtn1.countLabel.textColor = UIColor.grayType2()
            purchaseBtn1.costLabel.textColor = UIColor.grayType2()
            purchaseBtn2.countLabel.textColor = UIColor.grayType2()
            purchaseBtn2.costLabel.textColor = UIColor.grayType2()
            purchaseBtn3.countLabel.textColor = UIColor.yellowType1()
            purchaseBtn3.costLabel.textColor = UIColor.yellowType1()
            btnBackView1.isHidden = true
            btnBackView2.isHidden = true
            btnBackView3.isHidden = false
            return
        }
    }
}


