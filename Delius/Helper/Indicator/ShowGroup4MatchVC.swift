//
//  ShowSoloMatchVC.swift
//  Delius
//
//  Created by user on 2020/08/28.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class ShowGroup4MatchVC:NSObject{
    var presentingTransition:AlphaTransitionPresent?
    var dismissingTransition:AlphaTransitionDismiss?
    var vc:UIViewController!
    let toVC = Group4MatchViewController()
    init(viewController:UIViewController,groupData:MainListStruct) {
        vc = viewController
        toVC.groupData = groupData
    }
    func ShowIndicator(){
        toVC.modalPresentationStyle = .custom
        toVC.transitioningDelegate = self
        vc.present(toVC, animated: false, completion: {})
    }
    func removeIndicator(completion:@escaping()->Void){
        toVC.contentView.closeAnimation {
            completion()
        }
    }
}
extension ShowGroup4MatchVC:UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}











