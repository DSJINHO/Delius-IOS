//
//  ReportViewController.swift
//  Delius
//
//  Created by 박진호 on 2020/06/15.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class ReportViewController:UIViewController{
    var contentview:ReportView!
    var type:Int?
    var targetUid:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        contentview.openAnimation()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapFunc(_:)))
        contentview.shadowView.addGestureRecognizer(tapGesture)
    }
    private func setup(){
        contentview = ReportView(frame:view.bounds)
        self.view.addSubview(contentview)
        contentview.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        contentview.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        contentview.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        contentview.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        
        contentview.btn1.addTarget(self, action: #selector(reportBtnFunc(_:)), for: .touchUpInside)
        contentview.btn2.addTarget(self, action: #selector(reportBtnFunc(_:)), for: .touchUpInside)
        contentview.btn3.addTarget(self, action: #selector(reportBtnFunc(_:)), for: .touchUpInside)
        contentview.btn4.addTarget(self, action: #selector(reportBtnFunc(_:)), for: .touchUpInside)
        
    }
    @objc func reportBtnFunc(_ sender:UIButton){
        if sender == contentview.btn1{
            self.type = 701
        }
        if sender == contentview.btn2{
            self.type = 702
        }
        if sender == contentview.btn3{
            self.type = 703
        }
        if sender == contentview.btn4{
            self.type = 704
        }
    }
    @objc func closeBtnFunc(_ sender:UIButton){
        contentview.closeAnimation {
            self.dismiss(animated: false, completion: {})
        }
    }
    @objc func tapFunc(_ sender:UITapGestureRecognizer){
        contentview.closeAnimation {
            self.dismiss(animated: false, completion: {})
        }
    }
    func closeAnimation(completion:@escaping()->Void){
        contentview.closeAnimation {
            self.dismiss(animated: false, completion: {
                self.removeFromParent()
                self.view.removeFromSuperview()
                completion()
            })
        }
    }
}

