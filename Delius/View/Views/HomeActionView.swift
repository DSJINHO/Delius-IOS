//
//  HomeActionView.swift
//  Delius
//
//  Created by user on 2020/09/12.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class HomeActionView:UIView{
    
    private var passLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainColor()
        l.font = UIFont.boldSystemFont(ofSize: 20)
        l.textAlignment = .center
        l.text = "PASS"
        return l
    }()
    private var likeLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainColor()
        l.font = UIFont.boldSystemFont(ofSize: 20)
        l.textAlignment = .center
        l.text = "LIKE"
        return l
    }()
    private var deliLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainColor()
        l.font = UIFont.boldSystemFont(ofSize: 20)
        l.textAlignment = .center
        l.text = "DELI"
        return l
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
        self.addSubview(likeLabel)
        likeLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        likeLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        likeLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        likeLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(deliLabel)
        deliLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        deliLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        deliLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        deliLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(passLabel)
        passLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        passLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        passLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        passLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    func setupDefault(){
        self.likeLabel.alpha = 0
        self.deliLabel.alpha = 0
        self.passLabel.alpha = 0
        self.likeLabel.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        self.deliLabel.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        self.passLabel.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
    }
    func setupPASS(){
        self.passLabel.alpha = 1
        self.passLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
    }
    func setupLIKE(){
        self.likeLabel.alpha = 1
        self.likeLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
    }
    func setupDELI(){
        self.deliLabel.alpha = 1
        self.deliLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
    }
    func passAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut, animations: {
            self.passLabel.alpha = 1
            self.passLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                completion()
            }
        }
    }
    func likeAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut, animations: {
            self.likeLabel.alpha = 1
            self.likeLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                completion()
            }
        }
        
        
    }
    func deliAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut, animations: {
            self.deliLabel.alpha = 1
            self.deliLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
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
