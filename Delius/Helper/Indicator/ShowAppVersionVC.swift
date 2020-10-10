//
//  ShowAppVersionVC.swift
//  Delius
//
//  Created by user on 2020/07/21.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class ShowAppVersionVC:NSObject{
    
    
    var presentingTransition:AlphaTransitionPresent?
    var dismissingTransition:AlphaTransitionDismiss?
    
    var vc:UIViewController!
    let versionVC=AppVersionVC()
    init(viewController:UIViewController) {
        vc = viewController
    }
    func ShowIndicator(){
        versionVC.modalPresentationStyle = .custom
        versionVC.transitioningDelegate = self
        vc.present(versionVC, animated: false, completion: {})
        
    }
}


extension ShowAppVersionVC:UIViewControllerTransitioningDelegate{

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}

