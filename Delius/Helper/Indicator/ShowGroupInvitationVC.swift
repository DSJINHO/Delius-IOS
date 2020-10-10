//
//  ShowGroupInvitationVC.swift
//  Delius
//
//  Created by 박진호 on 2020/07/08.
//  Copyright © 2020 정윤환. All rights reserved.
//



import UIKit
class ShowGroupInvitationVC:NSObject{
    
    
    var presentingTransition:AlphaTransitionPresent?
    var dismissingTransition:AlphaTransitionDismiss?
    
    var vc:UIViewController!
    
    let invitationVC=GroupInvitationVC()
    init(viewController:UIViewController,groupData:MyGroupListStruct,usersData:UserStruct) {
        vc = viewController
        invitationVC.gData = groupData
        invitationVC.myData = usersData
    }
    func ShowIndicator(){
        invitationVC.modalPresentationStyle = .custom
        invitationVC.transitioningDelegate = self
        vc.present(invitationVC, animated: false, completion: {})
        
    }
}


extension ShowGroupInvitationVC:UIViewControllerTransitioningDelegate{

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}

