//
//  MainIndicatorVC.swift
//  Delius
//
//  Created by 박진호 on 2020/06/20.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class MainIndicatorVC:UIViewController{
    var indicator:MainIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        self.view.alpha = 0
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        UIView.animate(withDuration: 0.1, animations: {
            self.view.alpha = 1
        })
        indicator.TimeAnimation()
    }
    private func setup(){
        indicator = MainIndicatorView(frame: CGRect(x:0,y:0,width:100,height:100))
        indicator.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(indicator)
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        indicator.widthAnchor.constraint(equalToConstant: 100).isActive = true
        indicator.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    func removeView(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.view.alpha = 0
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                self.indicator.invalidateFunc()
                self.dismiss(animated: false, completion: {
                    completion()
                })
            }
        }
    }
}
