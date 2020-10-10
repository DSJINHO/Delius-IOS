//
//  DeleteGroupAlertVC.swift
//  Delius
//
//  Created by user on 2020/08/26.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

class DeleteGroupAlertVC: UIViewController {
    
    
    var contentView:DeleteGroupAlertView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        contentView.openAnimation()
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(tapFunc(_:)))
        contentView.shadowView.addGestureRecognizer(tapGesture)
    }
    private func setup(){
        contentView = DeleteGroupAlertView(frame: view.bounds)
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
