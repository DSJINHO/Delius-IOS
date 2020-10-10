//
//  CurrentDeliVC.swift
//  Delius
//
//  Created by 박진호 on 2020/06/29.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class CurrentDeliVC:UIViewController{
    var contentView:CurrentDeliView!
    var tapGesture:UITapGestureRecognizer!
    var cashItem:CashItemStruct?
    var updateTimer=UpdateDeliTimeCount()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        appearAnimation()
    }
    private func setup(){
        contentView = CurrentDeliView(frame:view.bounds)
        view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.closeBtn.addTarget(self, action: #selector(buyDeliBtnFunc(_:)), for: .touchUpInside)
        
        guard let cashData = cashItem else { return }
        let deli1Count = cashData.deli!
        let deli2Count = cashData.deli2!
        let dltp = cashData.dltp!.seconds
        
        contentView.dailyCountLabel.text = String(deli1Count)
        contentView.buyCountLabel.text = String(deli2Count)
        updateTimer.CalculateTime(from: dltp, label: contentView.timeCountLabel)
    }
    private func appearAnimation(){
        tapGesture = UITapGestureRecognizer()
        contentView.addGestureRecognizer(tapGesture)
        tapGesture.addTarget(self, action: #selector(disappearAnimation))
        
        contentView.openAnimation()
    }
    @objc func disappearAnimation(_ sender:UITapGestureRecognizer){
        contentView.closeAnimation {
            self.updateTimer.removeTimer()
            self.dismiss(animated: false, completion: {})
        }
    }
    @objc func buyDeliBtnFunc(_ sender:UIButton){
        contentView.closeAnimation {
            self.updateTimer.removeTimer()

            weak var pvc = self.presentingViewController
            self.dismiss(animated: false, completion: {
                let buyController = ShowBuyDeliVC(viewController: pvc!)
                buyController.ShowIndicator()
            })
        }
    }
}
