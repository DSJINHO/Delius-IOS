//
//  Tab2VC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 16/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Tab2VC:UIViewController{
    
    var contentView:Tab2View!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.alpha = 0
        setup()
    }
    private func setup(){
        contentView = Tab2View(frame: view.bounds)
        contentView.frame = view.bounds
        view.addSubview(contentView)
    }
}
