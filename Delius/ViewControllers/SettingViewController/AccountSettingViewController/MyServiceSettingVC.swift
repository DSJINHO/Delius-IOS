//
//  MyServiceSettingVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 26/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
import FirebaseAuth
class MyServiceSettingVC: UIViewController {
    
    var contentView:AppSettingStatusView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        setup()
    }
    private func setup(){
        contentView = AppSettingStatusView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.logoutBtn.addTarget(self, action: #selector(logoutFunc(_:)), for: .touchUpInside)
    }
    
    @objc func logoutFunc(_ sender:UIButton){
        let auth = Auth.auth()
        do {
            try auth.signOut()
            exit(0)
        }catch let signOutError as NSError{
            print(signOutError)
        }
    }
}
