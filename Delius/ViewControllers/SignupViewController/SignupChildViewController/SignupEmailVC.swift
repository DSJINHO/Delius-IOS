//
//  SignupEmailVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 06/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

class SignupEmailVC: UIViewController {
    
    var emailAuthView:EmailAuthView!
    var delegate:SignupEmailProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.alpha = 0
        setView()

    }
    func setView(){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let subFrame = CGRect(x:0,y:0,width:view.frame.width,height:view.frame.height-topPadding - 60)
        emailAuthView = EmailAuthView(frame: subFrame)
        
        
        view.addSubview(emailAuthView)
        emailAuthView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        emailAuthView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        emailAuthView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        emailAuthView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }

}
