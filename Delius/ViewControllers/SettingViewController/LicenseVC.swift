//
//  LicenseVC.swift
//  Delius
//
//  Created by user on 2020/07/21.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class LicenseVC:UIViewController{
    
    var contentView:AppSettingLicenseView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        contentView.openAnimation()
    }
    private func setup(){
        contentView = AppSettingLicenseView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.completeBtn.addTarget(self, action: #selector(closeAnimation(_:)), for: .touchUpInside)
    }
    @objc func closeAnimation(_ sender:UIButton){
        contentView.closeAnimation {
            self.dismiss(animated: false, completion: {})
        }
    }
}
