//
//  PermissionListView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 02/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class PermissionListView:UIButton{
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "c")
        v.tintColor = UIColor.MainBlackColor()
        v.transform = CGAffineTransform(scaleX: 1, y: 1)
        return v
    }()
    
    var topLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    var subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        return l
    }()
    var sub2Label:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        return l
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(img:UIImage,str1:String,str2:String,str3:String,frame:CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = img
        topLabel.DeliusLabel(txt: str1, txtAlignment: .left, ft: UIFont.DeliusBoldType4(), txtColor: .MainBlackColor())
        subLabel.DeliusLabel(txt: str2, txtAlignment: .left, ft: UIFont.DeliusSystemType1(), txtColor: .MainBlackColor())
        sub2Label.DeliusLabel(txt: str3, txtAlignment: .left, ft: UIFont.DeliusSystemType1(), txtColor: .MainBlackColor())
        setView(str1: str1, str2: str2, str3:str3)
    }
    private func setView(str1:String,str2:String,str3:String){
        self.addSubview(imgView)
        imgView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: frame.width/4).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imgView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        self.addSubview(topLabel)
        topLabel.topAnchor.constraint(equalTo: imgView.topAnchor, constant: 5).isActive = true
        topLabel.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 20).isActive = true
        topLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        topLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.addSubview(sub2Label)
        sub2Label.topAnchor.constraint(equalTo: topLabel.topAnchor).isActive = true
        sub2Label.leftAnchor.constraint(equalTo: topLabel.rightAnchor).isActive = true
        sub2Label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        sub2Label.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
    
        self.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor).isActive = true
        subLabel.bottomAnchor.constraint(equalTo: imgView.bottomAnchor).isActive = true
        subLabel.leftAnchor.constraint(equalTo: topLabel.leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.backgroundColor = UIColor.MainBlackAlpha()
        imageViewAnimationOpen()
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.backgroundColor = UIColor.clear
        imageViewAnimationClose()
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.backgroundColor = UIColor.clear
        imageViewAnimationClose()
        sendActions(for: .touchUpInside)
    }
    private func imageViewAnimationOpen(){
        let Animator = UIViewPropertyAnimator(duration: 0.1, curve: .easeOut, animations: {

            self.backgroundColor = UIColor.MainBlackAlpha()
            self.imgView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    private func imageViewAnimationClose(){
        let Animator1 = UIViewPropertyAnimator(duration: 0.1, curve: .easeOut, animations: {
            self.backgroundColor = UIColor.MainBlackAlpha()
            self.imgView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            self.layoutIfNeeded()
        })
        let Animator2 = UIViewPropertyAnimator(duration: 0.1, curve: .easeOut, animations: {
            self.backgroundColor = UIColor.clear
            self.imgView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.layoutIfNeeded()
            
        })
        Animator1.startAnimation()
        Animator1.addCompletion{position in
            if position == .end{
                Animator2.startAnimation()
            }
        }
    }
}
