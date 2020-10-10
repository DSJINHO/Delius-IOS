//
//  SignupCompletionVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 14/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SignupCompletionVC:UIViewController{
    
    
    var contentView:SignupCompletionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0
        setup()
    }
    private func setup(){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let subFrame = CGRect(x:0,y:0,width:view.frame.width,height:view.frame.height-topPadding - 60)
        contentView = SignupCompletionView(frame: subFrame)
        view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tempFunc()
    }
    
    
    
    var tempView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        return v
    }()
    var longGesture:UILongPressGestureRecognizer!
    private func tempFunc(){
        longGesture = UILongPressGestureRecognizer(target: self, action: #selector(gestFuc(_:)))
        tempView.addGestureRecognizer(longGesture)
        tempView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tempView)
        tempView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tempView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tempView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tempView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    @objc func gestFuc(_ sender:UILongPressGestureRecognizer){
        let vc = RootVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: {})
    }
    
}
