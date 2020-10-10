//
//  HorizontalTransition.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 10/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

class HorizontalTransitionLtoR:NSObject,UIViewControllerAnimatedTransitioning{
    
    let duration: TimeInterval = 0.2
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        let fromView = transitionContext.view(forKey: .from)!
        
        container.addSubview(fromView)
        fromView.frame.origin = .zero
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseIn, animations: {
            fromView.frame.origin = CGPoint(x: fromView.frame.width, y: 0)
        }, completion: { _ in
            fromView.removeFromSuperview()
            transitionContext.completeTransition(true)
        })
    }
}

class HorizontalTransitionRtoL:NSObject,UIViewControllerAnimatedTransitioning{
    
    let duration: TimeInterval = 0.2
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        
        container.addSubview(toView)
        toView.frame.origin = CGPoint(x: toView.frame.width, y: 0)
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
            toView.frame.origin = CGPoint(x: 0, y: 0)
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
    }
}
