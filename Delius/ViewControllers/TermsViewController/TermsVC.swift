//
//  TermsVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 04/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

class TermsVC: UIViewController {
    
    var contentView:TermsView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.MainColor()
        setView()
    }
    func setView(){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let btmPadding = window.safeAreaInsets.bottom
        let subFrame = CGRect(x:0,y:0,width:view.frame.width,height:view.frame.height-topPadding - btmPadding)
        
        contentView = TermsView(frame: subFrame)
        view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
}
