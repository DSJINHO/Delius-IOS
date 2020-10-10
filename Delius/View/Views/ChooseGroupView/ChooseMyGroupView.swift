//
//  ChooseMyGroupView.swift
//  Delius
//
//  Created by user on 2020/08/16.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class ChooseMyGroupView:UIView{
    
    var shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.gray
        v.alpha = 0
        return v
    }()
    var whiteView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 15
        v.alpha = 0
        v.clipsToBounds = true
        return v
    }()
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        return v
    }()
    let titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "그룹을 선택해주세요"
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .center
        return l
    }()
    let subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "가진 그룹 중 하나만 가능합니다"
        l.textColor = UIColor.lightGray
        l.font = UIFont.systemFont(ofSize: 15)
        l.textAlignment = .center
        return l
    }()
    let subLabel2:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "친구들에게 알려 투표를 마무리하세요"
        l.textColor = UIColor.lightGray
        l.font = UIFont.systemFont(ofSize: 15)
        l.textAlignment = .center
        return l
    }()
    var sendBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = UIColor.MainColor()
        b.setTitle("보내기", for: .normal)
        b.setTitleColor(UIColor.white, for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return b
    }()
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.lightGray
        return v
    }()
    var closeBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("닫기", for: .normal)
        b.setTitleColor(UIColor.MainBlackColor(), for: .normal)
        return b
    }()
    
    
    lazy var collectionView:UICollectionView={
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.clear
        cv.isPagingEnabled = true
        return cv
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
        nsCenter = whiteView.centerYAnchor.constraint(equalTo: centerYAnchor)
        nsCenter.isActive = true
        whiteView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        whiteView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        
        whiteView.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 10).isActive = true
        imgView.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        whiteView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor,constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        whiteView.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        whiteView.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: subLabel.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        whiteView.addSubview(sendBtn)
        sendBtn.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20).isActive = true
        sendBtn.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        sendBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        sendBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        whiteView.addSubview(lineView)
        lineView.topAnchor.constraint(equalTo: sendBtn.bottomAnchor, constant: 20).isActive = true
        lineView.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        lineView.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        whiteView.addSubview(closeBtn)
        closeBtn.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 10).isActive = true
        closeBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        closeBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        whiteView.bottomAnchor.constraint(equalTo: closeBtn.bottomAnchor,constant:10).isActive = true
        
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
