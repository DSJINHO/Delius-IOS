//
//  CreateGroupNoInfoVC.swift
//  Delius
//
//  Created by user on 2020/09/11.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class CreateGroupNoInfoVC:UIViewController{
    var contentView:CreateGroupNoInfoView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        contentView.openAnimation()
    }
    private func setup(){
        contentView = CreateGroupNoInfoView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

