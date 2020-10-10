//
//  Tab3VC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 16/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Tab3VC:UIViewController{
    
    var contentView:Tab3View!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.alpha = 0
        setup()
    }
    private func setup(){
        contentView = Tab3View(frame: view.bounds)
        contentView.frame = view.bounds
        view.addSubview(contentView)
    }
}
