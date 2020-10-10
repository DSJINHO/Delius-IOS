//
//  CurrentBoosterVC.swift
//  Delius
//
//  Created by 박진호 on 2020/06/29.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class CurrentBoosterVC:UIViewController{
    
    var contentView:CurrentBoosterView!
    var tapGesture:UITapGestureRecognizer!
    var cashItem:CashItemStruct?
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        appearAnimation()
    }
    private func setup(){
        
        contentView = CurrentBoosterView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        guard let boosterCount = cashItem?.btr else { return }
        contentView.boosterCountLabel.text = String(boosterCount)
        
    }
    private func appearAnimation(){
        tapGesture = UITapGestureRecognizer()
        contentView.touchView.addGestureRecognizer(tapGesture)
        tapGesture.addTarget(self, action: #selector(tapFunc(_:)))
        contentView.openAnimation()
    }
    @objc func tapFunc(_ sender:UITapGestureRecognizer){
        contentView.closeAnimation {
            self.dismiss(animated: false, completion: {})
        }
    }
}
