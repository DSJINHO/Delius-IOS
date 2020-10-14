//
//  extensionPermissionVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 02/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
extension PermissionVC{
    func setView(){
        permissionView = PermissionView(frame: view.frame)
        permissionView.startBtn.addTarget(self, action: #selector(startFunc(_:)), for: .touchUpInside)
        
        view.addSubview(permissionView)
        permissionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        permissionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        permissionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        permissionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        permissionView.view1.addTarget(self, action: #selector(tapFunc(_:)), for: .touchUpInside)
        permissionView.view2.addTarget(self, action: #selector(tapFunc(_:)), for: .touchUpInside)
        permissionView.view3.addTarget(self, action: #selector(tapFunc(_:)), for: .touchUpInside)
    }
}
