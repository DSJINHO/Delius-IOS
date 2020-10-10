//
//  ShowLicenseVC.swift
//  Delius
//
//  Created by user on 2020/07/21.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class ShowLicenseVC:NSObject{
    
    
    var presentingTransition:AlphaTransitionPresent?
    var dismissingTransition:AlphaTransitionDismiss?
    
    var vc:UIViewController!
    let licenseVC=LicenseVC()
    init(viewController:UIViewController) {
        vc = viewController
    }
    func ShowIndicator(){
        licenseVC.modalPresentationStyle = .custom
        licenseVC.transitioningDelegate = self
        vc.present(licenseVC, animated: false, completion: {})
        
    }
}


extension ShowLicenseVC:UIViewControllerTransitioningDelegate{

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}

