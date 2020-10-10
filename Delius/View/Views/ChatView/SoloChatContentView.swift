//
//  SoloChatView.swift
//  Delius
//
//  Created by 박진호 on 2020/07/03.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SoloChatContentView:UIView{
    
    
    let topView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        return v
    }()
    var backBtn:IconButton1!
    
    var shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.black
        v.alpha = 0
        return v
    }()
    var whiteView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 20
        v.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        return v
    }()
    
    var profileImgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.layer.cornerRadius = 20
        v.clipsToBounds = true
        return v
    }()
    var profileImgBackView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 22
        v.layer.shadowColor = UIColor.blackType1().cgColor
        v.layer.shadowRadius = 2
        v.layer.shadowOpacity = 0.2
        return v
    }()
    var moreBtn:IconButton1!
    
    
    var matchCancelBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Match Cancel", for: .normal)
        b.setTitleColor(UIColor.MainColor(), for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        return b
    }()
    
    
    
    lazy var messageCollectionView:UICollectionView={
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.headerReferenceSize = CGSize(width: 0, height: 30)
//        layout.footerReferenceSize = CGSize(width: 0, height: 30)
        layout.minimumLineSpacing = 10
//        layout.headerReferenceSize = CGSize(width: 0, height: 30)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    let containerView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.shadowColor = UIColor.MainBlackAlpha().cgColor
        v.layer.shadowOpacity = 0.2
        v.layer.shadowOffset = CGSize(width: 0, height: -2)
        v.layer.shadowRadius = 2
        return v
    }()
    var sendBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = UIColor.MainColor()
        b.layer.cornerRadius = 17
        b.clipsToBounds = true
        b.setImage(UIImage(named: "RightArrow"), for: .normal)
        b.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        b.tintColor = UIColor.white
        return b
    }()
    let roundView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainBlackAlpha()
        v.layer.cornerRadius = 20
        v.layer.borderColor = UIColor.MainBlackColor().cgColor
        v.layer.borderWidth = 1
        return v
    }()
    var inputField:UITextField={
        let f = UITextField()
        f.translatesAutoresizingMaskIntoConstraints = false
        f.textColor = UIColor.MainBlackColor1()
        return f
    }()
    
    
    var nsBtm:NSLayoutConstraint!
    var nsWhite:NSLayoutConstraint!
    
    required init?(coder:NSCoder){
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        
        backBtn = IconButton1(imgName: "LeftArrow", color: .black, frame: CGRect(x:0,y:0,width:30,height:30))
        moreBtn = IconButton1(imgName: "Report", color: .black, frame: CGRect(x:0,y:0,width:30,height:30))
        setup()
        
    }
    private func setup(){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let btmPadding = window.safeAreaInsets.bottom
        
        self.addSubview(topView)
        topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: topPadding + 60).isActive = true
        topView.addSubview(backBtn)
        backBtn.centerYAnchor.constraint(equalTo: topView.bottomAnchor, constant: -30).isActive = true
        backBtn.leftAnchor.constraint(equalTo: topView.leftAnchor,constant: 30).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        topView.addSubview(profileImgBackView)
        profileImgBackView.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor).isActive = true
        profileImgBackView.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        profileImgBackView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        profileImgBackView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        profileImgBackView.addSubview(profileImgView)
        profileImgView.topAnchor.constraint(equalTo: profileImgBackView.topAnchor, constant: 2).isActive = true
        profileImgView.leftAnchor.constraint(equalTo: profileImgBackView.leftAnchor, constant: 2).isActive = true
        profileImgView.rightAnchor.constraint(equalTo: profileImgBackView.rightAnchor, constant: -2).isActive = true
        profileImgView.bottomAnchor.constraint(equalTo: profileImgBackView.bottomAnchor, constant: -2).isActive = true
        
        topView.addSubview(moreBtn)
        moreBtn.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor).isActive = true
        moreBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        moreBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        moreBtn.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -30).isActive = true
        
        self.addSubview(containerView)
        nsBtm = containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        nsBtm.isActive = true
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: btmPadding + 50).isActive = true
        
        containerView.addSubview(roundView)
        roundView.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 5).isActive = true
        roundView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        roundView.rightAnchor.constraint(equalTo: containerView.rightAnchor,constant: -20).isActive = true
        roundView.bottomAnchor.constraint(equalTo: roundView.topAnchor, constant: 40).isActive = true
        
        roundView.addSubview(sendBtn)
        sendBtn.topAnchor.constraint(equalTo: roundView.topAnchor, constant: 3).isActive = true
        sendBtn.widthAnchor.constraint(equalToConstant: 34).isActive = true
        sendBtn.heightAnchor.constraint(equalToConstant: 34).isActive = true
        sendBtn.rightAnchor.constraint(equalTo: roundView.rightAnchor, constant: -3).isActive = true
        
        roundView.addSubview(inputField)
        inputField.topAnchor.constraint(equalTo: sendBtn.topAnchor).isActive = true
        inputField.leftAnchor.constraint(equalTo: roundView.leftAnchor, constant: 20).isActive = true
        inputField.rightAnchor.constraint(equalTo: sendBtn.leftAnchor, constant: -10).isActive = true
        inputField.bottomAnchor.constraint(equalTo: inputField.topAnchor, constant: 34).isActive = true
        
        self.addSubview(messageCollectionView)
        messageCollectionView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        messageCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        messageCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        messageCollectionView.bottomAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        
        
        self.addSubview(shadowView)
        shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shadowView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        shadowView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(whiteView)
        nsWhite = whiteView.topAnchor.constraint(equalTo: bottomAnchor)
        nsWhite.isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: btmPadding + 200).isActive = true
        whiteView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        whiteView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        whiteView.addSubview(matchCancelBtn)
        matchCancelBtn.centerYAnchor.constraint(equalTo: whiteView.centerYAnchor).isActive = true
        matchCancelBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        matchCancelBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        matchCancelBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        
        
    }
    func openWhiteView(completion:@escaping()->Void={}){
        let window = UIApplication.shared.windows[0]
        let btmPadding = window.safeAreaInsets.bottom
        let Animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut, animations: {
            self.nsWhite.constant = -btmPadding - 200
            self.shadowView.alpha = 0.3
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                completion()
            }
        }
    }
    func closeWhiteView(completion:@escaping()->Void={}){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut, animations: {
            self.nsWhite.constant = 0
            self.shadowView.alpha = 0
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
