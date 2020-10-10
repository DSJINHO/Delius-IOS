//
//  CreateGroupAlertView.swift
//  Delius
//
//  Created by user on 2020/09/10.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class CreateGroupAlertView:UIView{
    var shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.blackType1()
        v.alpha = 0
        return v
    }()
    var indicator:MainIndicatorView!
    var tempLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.blackType1()
        l.font = UIFont.boldSystemFont(ofSize: 13)
        l.textAlignment = .center
        l.text = "CreateGroupWait001".localize()
        return l
    }()
    var whiteView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 15
        v.alpha = 0
        return v
    }()
    
    var cbLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.blackType1()
        l.font = UIFont.boldSystemFont(ofSize: 13)
        l.textAlignment = .center
        l.alpha = 0
        return l
    }()
    var closeBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("CloseBtn".localize(), for: .normal)
        b.setTitleColor(UIColor.blackType3(), for: .normal)
        b.titleLabel?.font = UIFont.DeliusBoldType2()
        b.alpha = 0
        return b
    }()
    var lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.grayType3()
        v.alpha = 0
        return v
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
        whiteView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        whiteView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        whiteView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        indicator = MainIndicatorView(frame: CGRect(x:0,y:0,width:100,height: 100))
        indicator.translatesAutoresizingMaskIntoConstraints = false
        whiteView.addSubview(indicator)
        indicator.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 20).isActive = true
        indicator.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        indicator.heightAnchor.constraint(equalToConstant: 100).isActive = true
        indicator.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        whiteView.addSubview(tempLabel)
        tempLabel.topAnchor.constraint(equalTo: indicator.bottomAnchor, constant: 20).isActive = true
        tempLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 20).isActive = true
        tempLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -20).isActive = true
        tempLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        whiteView.addSubview(cbLabel)
        cbLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 50).isActive = true
        cbLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor,constant: 20).isActive = true
        cbLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -20).isActive = true
        cbLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        whiteView.addSubview(closeBtn)
        closeBtn.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        closeBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        
        whiteView.addSubview(lineView)
        lineView.bottomAnchor.constraint(equalTo: closeBtn.topAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        lineView.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    func openAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.shadowView.alpha = 0.4
            self.whiteView.alpha = 2
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                self.indicator.TimeAnimation()
            }
        }
    }
    func closeAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.shadowView.alpha = 0
            self.whiteView.alpha = -2
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                completion()
            }
        }
    }
    func stopAnimation(str:String){
        self.indicator.invalidateFunc()
        self.cbLabel.text = str
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.lineView.alpha = 1
            self.indicator.alpha = 0
            self.tempLabel.alpha = 0
            self.closeBtn.alpha = 1
            self.cbLabel.alpha = 1
        })
        Animator.startAnimation()
        
    }
}
