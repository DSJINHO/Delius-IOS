//
//  EmptyDeliAlertVC.swift
//  Delius
//
//  Created by user on 2020/08/26.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class EmptyDeliAlertVC:UIViewController{
    
    
    var contentView:EmptyDeliAlertView!
    var cashItem:CashItemStruct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        contentView.openAnimation()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapFunc(_:)))
        contentView.addGestureRecognizer(tapGesture)
        
        guard let cashStruct = cashItem else { return }
        let controller = UpdateDeliTimeCount()
        if let deliCount = cashStruct.deli{
            contentView.deliCountLabel.text = "\(deliCount)"
        }
        if let deli2Count = cashStruct.deli2{
            contentView.deli2CountLabel.text = "\(deli2Count)"
        }
        if let dlTp = cashStruct.dltp{
            controller.CalculateTime(from: dlTp.seconds, label: contentView.timeLabel)
        }
    }
    private func setup(){
        contentView = EmptyDeliAlertView(frame: view.bounds)
        view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        
    }
    @objc func tapFunc(_ sender:UITapGestureRecognizer){
        contentView.closeAnimation {
            self.dismiss(animated: false, completion: {})
        }
    }
    
    
    
}
