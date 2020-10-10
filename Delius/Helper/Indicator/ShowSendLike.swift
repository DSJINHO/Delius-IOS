//
//  ShowSendLike.swift
//  Delius
//
//  Created by 박진호 on 2020/07/06.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class ShowSendLike:NSObject{
    var presentingTransition:AlphaTransitionPresent?
    var dismissingTransition:AlphaTransitionDismiss?
    var vc:UIViewController!
    let sendLikeController = SendLikeAnimationVC()
    init(viewController:UIViewController) {
        vc = viewController
    }
    func ShowIndicator(){
        sendLikeController.modalPresentationStyle = .custom
        sendLikeController.transitioningDelegate = self
        vc.present(sendLikeController, animated: false, completion: {})
    }
    func removeIndicator(completion:@escaping()->Void){
        sendLikeController.closeAnimation {
            completion()
        }
    }
}
extension ShowSendLike:UIViewControllerTransitioningDelegate{
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}
