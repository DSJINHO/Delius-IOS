//
//  CreateGroupListView.swift
//  Delius
//
//  Created by user on 2020/09/09.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class CreateGroupListView:UIView{
    
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.layer.cornerRadius = 20
        v.clipsToBounds = true
        return v
    }()
    var nameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .left
        l.font = UIFont.boldSystemFont(ofSize: 15)
        return l
    }()
    var subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 12)
        return l
    }()
    var answerLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .left
        l.textColor = UIColor.blackType1()
        l.font = UIFont.boldSystemFont(ofSize: 13)
        l.isHidden = true
        return l
    }()
    var arrowImgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "RightArrow")
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    var nsTop:NSLayoutConstraint!
    
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        
    }
    init(frame:CGRect,image:String,title:String,subTitle:String,selected:Bool){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = title
        subLabel.text = subTitle
        if selected{
            nameLabel.textColor = UIColor.blackType1()
            subLabel.textColor = UIColor.blackType2()
            imgView.backgroundColor = UIColor.MainColor()
            arrowImgView.tintColor = UIColor.MainColor()
        }else{
            nameLabel.textColor = UIColor.grayType1()
            subLabel.textColor = UIColor.grayType1()
            imgView.backgroundColor = UIColor.grayType1()
            arrowImgView.tintColor = UIColor.grayType1()
        }
        setup()
    }
    private func setup(){
        
        self.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imgView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: imgView.topAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        
        self.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        subLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(answerLabel)
        answerLabel.centerYAnchor.constraint(equalTo: imgView.centerYAnchor).isActive = true
        answerLabel.leftAnchor.constraint(equalTo: imgView.rightAnchor,constant: -20).isActive = true
        answerLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        answerLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(arrowImgView)
        arrowImgView.centerYAnchor.constraint(equalTo: imgView.centerYAnchor).isActive = true
        arrowImgView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        arrowImgView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        arrowImgView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
    }
    func activateAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.15, curve: .easeOut, animations: {
            
        })
    }
}
