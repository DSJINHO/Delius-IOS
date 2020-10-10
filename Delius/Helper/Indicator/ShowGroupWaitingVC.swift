//
//  ShowGroupWaiting.swift
//  Delius
//
//  Created by user on 2020/08/07.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class ShowGroupWaitingVC:NSObject{
    
    var presentingTransition:AlphaTransitionPresent?
    var dismissingTransition:AlphaTransitionDismiss?

    var vc:UIViewController!
    let groupWaitingVC=GroupWaitingVC()
    init(viewController:UIViewController) {
        vc = viewController
    }
    func ShowIndicator(){
        groupWaitingVC.modalPresentationStyle = .custom
        groupWaitingVC.transitioningDelegate = self
        vc.present(groupWaitingVC, animated: false, completion: {})

    }
    
}
extension ShowGroupWaitingVC:UIViewControllerTransitioningDelegate{

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}
