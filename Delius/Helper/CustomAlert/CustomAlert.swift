//
//  Report.swift
//  Delius
//
//  Created by 박진호 on 2020/06/15.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class CustomAlert:NSObject{
    var presentingTransition:AlphaTransitionPresent?
    var dismissingTransition:AlphaTransitionDismiss?
    
    func reportAlert(inViewController vc:UIViewController){
        let alertVC = ReportViewController()
        alertVC.modalPresentationStyle = .custom
        alertVC.transitioningDelegate = self
        vc.present(alertVC,animated: false,completion: {})
    }
    
}
extension CustomAlert: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}
