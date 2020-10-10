//
//  AddingGroupTagView.swift
//  Delius
//
//  Created by 박진호 on 2020/06/14.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class AddingGroupTagView:UIView{
    let titleView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let titleImgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "AddGroupIcon2")
        v.contentMode = .scaleAspectFit
        return v
    }()
    let completeBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(UIColor.MainGrayColor(), for: .normal)
        b.titleLabel!.font = .DeliusBoldType1()
        b.contentHorizontalAlignment = .right
        b.setTitle("Complete".localize(), for: .normal)
        return b
    }()
    
    
    var shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.blackType1()
        v.alpha = 0
        return v
    }()
    var contentView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        return v
    }()
    let nameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainGrayColor()
        l.font = .DeliusBoldType1()
        l.textAlignment = .left
        l.text = "AddingGroupTagView001".localize()
        return l
    }()
    let Descriptionlabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.lightGray
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 14)
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.text = "AddingGroupTagView002".localize()
        return l
    }()
    //let line:UILabel={
    //    let l = UILabel()
    //    l.translatesAutoresizingMaskIntoConstraints = false
    //    l.backgroundColor = UIColor.MainBlackColor3()
    //    return l
    //}()
    var nsLeft:NSLayoutConstraint!
    
    
    var saveBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = UIColor.MainColor()
        b.setTitle("Complete".localize(), for: .normal)
        b.setTitleColor(UIColor.white, for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return b
    }()
    
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
        
        self.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nsLeft = contentView.leftAnchor.constraint(equalTo: leftAnchor, constant: self.frame.width)
        nsLeft.isActive = true
        contentView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        contentView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        contentView.addSubview(Descriptionlabel)
        Descriptionlabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        Descriptionlabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        Descriptionlabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        Descriptionlabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        let window = UIApplication.shared.windows[0]
        let btmPadding = window.safeAreaInsets.bottom
        
        contentView.addSubview(saveBtn)
        saveBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -btmPadding).isActive = true
        saveBtn.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        saveBtn.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        saveBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    func openAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.nsLeft.constant = 0
            self.shadowView.alpha = 0.4
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    func closeAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.nsLeft.constant = self.frame.width
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
