//
//  WelcomeVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 02/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {
    
    var contentView:WelcomeView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setView()
        

    }
    func setView(){
        contentView = WelcomeView(frame: view.bounds)
        view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        setProperty()
    }
    func setProperty(){
        contentView.emailLoginBtn.addTarget(self, action: #selector(emailBtnFunc(_:)), for: .touchUpInside)
        contentView.phoneLoginBtn.addTarget(self, action: #selector(phoneBtnFunc(_:)), for: .touchUpInside)
    }
    @objc func phoneBtnFunc(_ sender: UIButton){
        let vc = TermVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated:true,completion:{})
    }
    @objc func emailBtnFunc(_ sender:UIButton){
        let vc = LoginVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: {})
    }
    
    
    
    
}
