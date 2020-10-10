//
//  ShowProfileEdit.swift
//  Delius
//
//  Created by 박진호 on 2020/07/07.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class ShowProfileEdit:NSObject{
    
    
    var presentingTransition:AlphaTransitionPresent?
    var dismissingTransition:AlphaTransitionDismiss?
    
    var vc:UIViewController!
    let editUserVC=EditUserProfileVC()
    init(viewController:UIViewController,userData:UserStruct) {
        vc = viewController
        editUserVC.userData = userData
    }
    func ShowIndicator(){
        editUserVC.modalPresentationStyle = .custom
        editUserVC.transitioningDelegate = self
        vc.present(editUserVC, animated: true, completion: {})
        
    }
}


extension ShowProfileEdit:UIViewControllerTransitioningDelegate{

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}
