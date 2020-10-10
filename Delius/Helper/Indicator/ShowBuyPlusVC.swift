//
//  ShowBuyPlusVC.swift
//  Delius
//
//  Created by 박진호 on 2020/07/06.
//  Copyright © 2020 정윤환. All rights reserved.
//
import UIKit
class ShowBuyPlusVC:NSObject{
    
    var presentingTransition:AlphaTransitionPresent?
    var dismissingTransition:AlphaTransitionDismiss?
    
    var vc:UIViewController!
    let buyPlusVC=BuyPlusUserVC()
    init(viewController:UIViewController) {
        vc = viewController
    }
    func ShowIndicator(){
        buyPlusVC.modalPresentationStyle = .custom
        buyPlusVC.transitioningDelegate = self
        vc.present(buyPlusVC, animated: false, completion: {})
    }
}

extension ShowBuyPlusVC:UIViewControllerTransitioningDelegate{

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}
