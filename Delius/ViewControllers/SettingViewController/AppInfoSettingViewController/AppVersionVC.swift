//
//  AppVersionVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 26/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

class AppVersionVC: UIViewController {
    
    var contentview:AppSettingVersionView!
    var tapGesture:UITapGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        contentview.openAnimation()
        tapGesture = UITapGestureRecognizer()
        contentview.addGestureRecognizer(tapGesture)
        tapGesture.addTarget(self, action: #selector(tapFunc(_:)))
    }
    private func setup(){
        contentview = AppSettingVersionView(frame: view.bounds)
        self.view.addSubview(contentview)
        contentview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }
    @objc func tapFunc(_ sender:UITapGestureRecognizer){
        contentview.closeAnimation {
            self.dismiss(animated: false, completion: {})
        }
    }
    

}
