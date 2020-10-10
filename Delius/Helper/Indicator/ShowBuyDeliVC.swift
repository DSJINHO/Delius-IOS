//
//  ShowBuyPlusVC.swift
//  Delius
//
//  Created by 박진호 on 2020/07/06.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class ShowBuyDeliVC:NSObject{
    var presentingTransition:AlphaTransitionPresent?
    var dismissingTransition:AlphaTransitionDismiss?
    var vc:UIViewController!
    let buyDeliVC=BuyDeliVC()
    init(viewController:UIViewController) {
        vc = viewController
    }
    func ShowIndicator(){
        buyDeliVC.modalPresentationStyle = .custom
        buyDeliVC.transitioningDelegate = self
        vc.present(buyDeliVC, animated: false, completion: {})
    }
}
extension ShowBuyDeliVC:UIViewControllerTransitioningDelegate{

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}
