//
//  SideMenuButton.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 16/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
final class SideMenuButton:UIButton{
    
    private var lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    private var nsRight:NSLayoutConstraint!
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    init(txt:String,frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.DeliusBoldType0()
        self.setTitle(txt, for: .normal)
        self.contentHorizontalAlignment = .left
        setup(txt:txt)
    }
    private func setup(txt:String){
        self.addSubview(lineView)
        lineView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: self.titleLabel!.leftAnchor).isActive = true
        nsRight = lineView.rightAnchor.constraint(equalTo: lineView.leftAnchor, constant: 0 )
        nsRight.isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    func expandLineView(length:CGFloat,reverse:Bool){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            if reverse{
//                self.nsLeft.constant = 80 - length
                self.nsRight.constant = 0
            }else{
//                self.nsLeft.constant = 0
                self.nsRight.constant = length
            }
            self.layoutIfNeeded()
            
        })
        Animator.startAnimation()
    }
}

