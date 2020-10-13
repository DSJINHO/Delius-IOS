//
//  PermissionVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 02/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

class PermissionVC: UIViewController {
    
    
    var permissionView:PermissionView!
    
    private let locationService = LocationService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setView()
    }
    @objc func startFunc(_ sender:UIButton){
        if locationService.checkStatus(){
            let vc = WelcomeVC()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: {})
        }else{
            ShowAlert.OnlyDefault(vc: self, title: "tet", message: "text")
        }
    }
    @objc func tapFunc(_ sender:UIButton){
        switch sender{
        case permissionView.view1:
//            let vc = MatchFilterVC()
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true, completion: {})
            self.locationService.checkPermission(inViewController: self)
        case permissionView.view2:
            ContactPermissionService.requestPermission(viewController: self)
        case permissionView.view3:
             PhotoPermissionService.requestPhotoPermission(viewController: self)
        case permissionView.view4:
            ShowAlert.OnlyDefault(vc: self, title: "text", message: "text")
        default:()
        }
    }
    

}
