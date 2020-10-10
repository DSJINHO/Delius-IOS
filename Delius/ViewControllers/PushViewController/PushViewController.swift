//
//  PushViewController.swift
//  Delius
//
//  Created by user on 2020/09/01.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class PushViewController:UIViewController{
    var nsTop:NSLayoutConstraint!
    var requestView:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        setup(pushView: requestView)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        openAnimation()
    }
    
    private func setup(pushView:UIView){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        requestView = pushView
        self.view.addSubview(requestView)
        self.requestView!.heightAnchor.constraint(equalToConstant: topPadding + 70).isActive = true
        self.requestView!.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.requestView!.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.nsTop = requestView!.bottomAnchor.constraint(equalTo: view.topAnchor)
        nsTop.isActive = true
    }
    func openAnimation(completion:@escaping()->Void={}){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        
        UIView.animate(withDuration: 0.2, animations: {
            self.nsTop.constant = topPadding + 70
            self.view.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.2, delay: 1.7, options: .curveEaseIn, animations: {
            self.nsTop.constant = 0
            self.view.layoutIfNeeded()
        }){(isFinish) in
            self.dismiss(animated: false, completion: {
                self.removeFromParent()
                self.view.removeFromSuperview()
                completion()
            })
        }
    }
}
