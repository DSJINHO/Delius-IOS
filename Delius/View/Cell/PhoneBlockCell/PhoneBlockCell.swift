//
//  PhoneBlockCell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 31/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class PhoneBlockCell:UICollectionViewCell,UIScrollViewDelegate{
    var scrollView:UIScrollView={
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.showsHorizontalScrollIndicator = false
        return v
    }()
    var nameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainGrayColor()
        l.font = UIFont.DeliusSystemType4()
        l.textAlignment = .center
        return l
    }()
    var phoneLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = .DeliusBoldType4()
        l.textAlignment = .left
        l.textColor = .MainGrayColor()
        return l
    }()
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainLightGrayColor()
        return v
    }()
    var deleteBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("삭제", for: .normal)
        b.setTitleColor(UIColor.white, for: .normal)
        return b
    }()
    let containerView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    var nsWidth:NSLayoutConstraint!
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.backgroundColor = UIColor.MainColor()
        scrollView.delegate = self
        setup(width:frame.width,height:frame.height)
    }
    private func setup(width:CGFloat,height:CGFloat){
        scrollView.contentSize = CGSize(width: width+80, height: height)
        self.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        scrollView.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: width).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        scrollView.addSubview(deleteBtn)
        deleteBtn.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        deleteBtn.leftAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        deleteBtn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        deleteBtn.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        
        
        containerView.addSubview(nameLabel)
        nameLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 30).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        containerView.addSubview(lineView)
        lineView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        lineView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        lineView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 5).isActive = true
        
        containerView.addSubview(phoneLabel)
        phoneLabel.leftAnchor.constraint(equalTo: lineView.rightAnchor, constant: 5).isActive = true
        phoneLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        phoneLabel.leftAnchor.constraint(equalTo: lineView.rightAnchor, constant: 5).isActive =  true
        phoneLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true
        
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x < 0{
            scrollView.contentOffset.x = 0
        }
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if targetContentOffset.pointee.x < 40{
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }else{
            scrollView.setContentOffset(CGPoint(x: 80, y: 0), animated: true)
        }
    }
}
