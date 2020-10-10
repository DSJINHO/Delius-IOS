//
//  ShowMatchUserProfile.swift
//  Delius
//
//  Created by 박진호 on 2020/07/06.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class ShowMatchUserProfile:NSObject{
    
    var presentingTransition:AlphaTransitionPresent?
    var dismissingTransition:AlphaTransitionDismiss?
    
    var vc:UIViewController!
    var userInfo:SoloStruct?
    var imgArray:[UIImage]?
    let buyPlusVC=MatchUserProfileVC()
    init(viewController:UIViewController,user:SoloStruct,ims:[UIImage]) {
        vc = viewController
        userInfo = user
        imgArray = ims
    }
    func ShowIndicator(){
        buyPlusVC.imgArray = imgArray!
        buyPlusVC.userInfo = userInfo!
        buyPlusVC.modalPresentationStyle = .custom
        buyPlusVC.transitioningDelegate = self
        vc.present(buyPlusVC, animated: false, completion: {})
    }
}

extension ShowMatchUserProfile:UIViewControllerTransitioningDelegate{

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}
