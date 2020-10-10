//
//  AlphaTransition.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/05.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
import Foundation

class AlphaTransitionDismiss:NSObject,UIViewControllerAnimatedTransitioning{
    let duration:TimeInterval = 0.2
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        let fromView = transitionContext.view(forKey: .from)!
        
        container.addSubview(fromView)
        fromView.frame.origin = .zero
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseIn, animations: {
            
        }, completion: { _ in
            fromView.removeFromSuperview()
            transitionContext.completeTransition(true)
        })
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
}
class AlphaTransitionPresent:NSObject,UIViewControllerAnimatedTransitioning{
    let duration: TimeInterval = 0.2
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        
        container.addSubview(toView)
        toView.frame.origin = CGPoint(x: 0, y: 0)
        
        transitionContext.completeTransition(true)
    }
}

