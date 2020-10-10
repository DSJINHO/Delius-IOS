//
//  GroupWaitingVC.swift
//  Delius
//
//  Created by user on 2020/08/07.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class GroupWaitingVC:UIViewController{
    
    var contentView:GroupWaitingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        contentView.OpenAnimation()
    }
    private func setup(){
        
        contentView = GroupWaitingView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}
