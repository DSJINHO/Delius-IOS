//
//  MyProfileVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 19/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class MyProfileVC:UIViewController{
    var contentView:SoloProfileView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setup()
    }
    private func setup(){
        let imgArray = [UIImage(named: "model1")!,UIImage(named: "model2")!,UIImage(named: "model3")!]
        contentView = SoloProfileView(imgArr:imgArray,tagArr:["IOS개발자","연인찾으러옴","상쾌함","연애중","관심사"],name: "정윤환,21", status: "소주한잔해요", extra: "여기는 엄청나게 긴 스트링을 넣을 수 있는 공간입니다", frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.backBtn.addTarget(self, action: #selector(backFunc(_:)), for: .touchUpInside)
    }
    @objc func backFunc(_ sender:UIButton){
        dismiss(animated: true, completion: {})
    }
}
