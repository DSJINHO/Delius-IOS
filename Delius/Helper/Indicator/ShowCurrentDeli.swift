//
//  ShowCurrentDeli.swift
//  Delius
//
//  Created by 박진호 on 2020/07/06.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class ShowCurrentDeli:NSObject{
    var presentingTransition:AlphaTransitionPresent?
    var dismissingTransition:AlphaTransitionDismiss?
    var vc:UIViewController!
    let currentDeliController = CurrentDeliVC()
    var userCash:CashItemStruct!
    init(viewController:UIViewController,cashItem:CashItemStruct) {
        vc = viewController
        userCash = cashItem
    }
    func ShowIndicator(){
        currentDeliController.cashItem = userCash
        currentDeliController.modalPresentationStyle = .custom
        currentDeliController.transitioningDelegate = self
        vc.present(currentDeliController, animated: false, completion: {})
    }
}
extension ShowCurrentDeli:UIViewControllerTransitioningDelegate{
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}
