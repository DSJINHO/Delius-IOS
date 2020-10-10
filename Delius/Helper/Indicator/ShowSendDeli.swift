//
//  ShowSendDeli.swift
//  Delius
//
//  Created by 박진호 on 2020/07/06.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class ShowSendDeli:NSObject{
    var presentingTransition:AlphaTransitionPresent?
    var dismissingTransition:AlphaTransitionDismiss?
    var vc:UIViewController!
    let sendDeliController = SendDeliAnimationVC()
    init(viewController:UIViewController) {
        vc = viewController
    }
    func ShowIndicator(){
        sendDeliController.modalPresentationStyle = .custom
        sendDeliController.transitioningDelegate = self
        vc.present(sendDeliController, animated: false, completion: {})
    }
    func removeIndicator(completion:@escaping()->Void){
        sendDeliController.closeAnimation {
            completion()
        }
    }
}
extension ShowSendDeli:UIViewControllerTransitioningDelegate{
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}
