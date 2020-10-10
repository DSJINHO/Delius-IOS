//
//  ShowFeedUserProfile.swift
//  Delius
//
//  Created by 박진호 on 2020/07/07.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class ShowFeedUserProfile:NSObject{
    
    
    var presentingTransition:AlphaTransitionPresent?
    var dismissingTransition:AlphaTransitionDismiss?
    
    var vc:UIViewController!
    var userInfo:SoloStruct?
    var imgArray:[UIImage]?
    let feedUserVC=FeedUserProfileVC()
    init(viewController:UIViewController,user:SoloStruct,ims:[UIImage]) {
        vc = viewController
        userInfo = user
        imgArray = ims
    }
    func ShowIndicator(){
        feedUserVC.imgArray = imgArray!
        feedUserVC.userInfo = userInfo!
        feedUserVC.modalPresentationStyle = .custom
        feedUserVC.transitioningDelegate = self
        vc.present(feedUserVC, animated: false, completion: {})
        
    }
}


extension ShowFeedUserProfile:UIViewControllerTransitioningDelegate{

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}
