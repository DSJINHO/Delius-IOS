//
//  SoloMatchViewController.swift
//  Delius
//
//  Created by user on 2020/08/28.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SoloMatchViewController:UIViewController{
    
    var contentView:SoloMatchView!
    var userData:MainListStruct!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        contentView.openAnimation()
        
    }
    private func setup(){
        contentView = SoloMatchView(frame: view.bounds)
        view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.closeBtn.addTarget(self, action: #selector(closeFunc(_:)), for: .touchUpInside)
        
        guard let data = userData.soloStruct else { return }
        if let im = data.im{
            let url = CreateThumbUrl.mainImgUrl(uid: data.uid!, imgObjs: im)
            contentView.backImgView.sd_setImage(with: url)
        }
    }
    @objc func closeFunc(_ sender:UIButton){
        print("close")
        contentView.closeAnimation {
            self.dismiss(animated: false, completion: {
                self.removeFromParent()
                self.view.removeFromSuperview()
            })
        }
    }
    func closeAnimation(completion:@escaping()->Void){
        contentView.closeAnimation {
            self.dismiss(animated: false, completion: {
                self.removeFromParent()
                self.view.removeFromSuperview()
                completion()
            })
        }
    }
}

