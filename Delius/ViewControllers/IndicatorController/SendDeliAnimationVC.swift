//
//  SendDeliAnimationVC.swift
//  Delius
//
//  Created by 박진호 on 2020/07/06.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class SendDeliAnimationVC:UIViewController{
    
    var backView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainBlackColor3()
        v.alpha = 0
        return v
    }()
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "MainCheckDeli")
        v.alpha = 0
        return v
    }()
    var nsCenterY:NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        openAnimation()
    }
    private func setup(){
        
        self.view.addSubview(backView)
        backView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        self.view.addSubview(imgView)
        imgView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imgView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nsCenterY = imgView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150)
        nsCenterY.isActive = true
    }
    func openAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.1, curve: .easeOut, animations: {
            self.nsCenterY.constant = -100
            self.backView.alpha = 0.8
            self.imgView.alpha = 1
            self.view.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    func closeAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.1, curve: .easeOut, animations: {
            self.nsCenterY.constant = 150
            self.backView.alpha = 0
            self.imgView.alpha = 0
            self.view.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                self.dismiss(animated: false, completion: {})
                completion()
            }
        }
    }
}
