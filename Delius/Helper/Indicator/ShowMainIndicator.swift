//
//  ShowMainIndicator.swift
//  Delius
//
//  Created by 박진호 on 2020/06/20.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class ShowMainIndicator:NSObject{
    var presentingTransition:AlphaTransitionPresent?
    var dismissingTransition:AlphaTransitionDismiss?
    var vc:UIViewController!
    let indicatorController = MainIndicatorVC()
    init(viewController:UIViewController) {
        vc = viewController
    }
    func ShowIndicator(){
        indicatorController.modalPresentationStyle = .custom
        indicatorController.transitioningDelegate = self
        vc.present(indicatorController, animated: false, completion: {})
    }
    func removeIndicator(completion:@escaping()->Void){
        indicatorController.removeView(){
            completion()
        }
    }
}
extension ShowMainIndicator:UIViewControllerTransitioningDelegate{
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}
