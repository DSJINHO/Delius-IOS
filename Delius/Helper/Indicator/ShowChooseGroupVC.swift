//
//  ShowGroupWaiting.swift
//  Delius
//
//  Created by user on 2020/08/07.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class ShowChooseGroupVC:NSObject{
    
    var presentingTransition:AlphaTransitionPresent?
    var dismissingTransition:AlphaTransitionDismiss?

    var vc:UIViewController!
    let chooseVC=ChooseMyGroupVC()
    var myGroups:[MyGroupListStruct]!
    init(viewController:UIViewController,listData:[MyGroupListStruct],isLike:Bool) {
        vc = viewController
        chooseVC.myGroupList = listData
        chooseVC.isLike = isLike
        
    }
    func ShowIndicator(){
        chooseVC.modalPresentationStyle = .custom
        chooseVC.transitioningDelegate = self
        vc.present(chooseVC, animated: false, completion: {
            
        })
    }
    
}
extension ShowChooseGroupVC:UIViewControllerTransitioningDelegate{

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}

