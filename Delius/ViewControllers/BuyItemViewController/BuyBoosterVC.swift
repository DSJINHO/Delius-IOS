//
//  BuyLikeVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/05.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class BuyBoosterVC:UIViewController{
    var contentView:BuyBoosterView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        contentView.appearAnimation()
    }
    private func setup(){
        contentView = BuyBoosterView(frame: view.bounds)
        view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.cancelBtn.addTarget(self, action: #selector(cancelBtnFunc(_:)), for: .touchUpInside)
        
    }
    @objc func cancelBtnFunc(_ sender:UIButton){
        contentView.disappearAnimation(completion: {
            self.dismiss(animated: false, completion: {})
        })
    }
}
