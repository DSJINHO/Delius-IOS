//
//  Tab1VC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 16/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Tab1VC:UIViewController{
    
    var contentView:Tab1View!
    override func viewDidLoad() {
        super.viewDidLoad()
//        setup()
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(false)
//        setup()
//    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        setup()
    }
    private func setup(){
        contentView = Tab1View(frame: CGRect(x:0,y:0,width:view.frame.width,height:view.frame.height))
        contentView.frame = view.bounds
        view.addSubview(contentView)
    }
}
