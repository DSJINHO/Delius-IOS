//
//  ShowDeleteGroupAVC.swift
//  Delius
//
//  Created by user on 2020/08/26.
//  Copyright © 2020 정윤환. All rights reserved.
//



import UIKit
class ShowReportVC:NSObject{
    var presentingTransition:AlphaTransitionPresent?
    var dismissingTransition:AlphaTransitionDismiss?
    var vc:UIViewController!
    let toVC = ReportViewController()
    init(viewController:UIViewController) {
        vc = viewController
    }
    func ShowIndicator(){
        toVC.modalPresentationStyle = .custom
        toVC.transitioningDelegate = self
        vc.present(toVC, animated: false, completion: {})
    }
    func removeIndicator(completion:@escaping()->Void){
        toVC.contentview.closeAnimation {
            completion()
        }
    }
}
extension ShowReportVC:UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}





