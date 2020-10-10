//
//  Group3MatchViewController.swift
//  Delius
//
//  Created by user on 2020/08/28.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Group3MatchViewController:UIViewController{
    var contentView:Group3MatchView!
    var groupData:MainListStruct!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
    }
    private func setup(){
        contentView = Group3MatchView(frame: view.bounds)
        view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.closeBtn.addTarget(self, action: #selector(btnFunc(_:)), for: .touchUpInside)
        
        guard let data = groupData.groupStruct else { return }
        guard let firstUser = groupData?.memberStruct?.first(where: {$0.uid! == data.uid1!}) else { return }
        guard let secondUser = groupData?.memberStruct?.first(where: {$0.uid! == data.uid2!}) else { return }
        guard let thirdUser = groupData?.memberStruct?.first(where: {$0.uid! == data.uid3!}) else { return }
        if let im = firstUser.im{
            if let uid = firstUser.uid{
                let url = CreateThumbUrl.mainImgUrl(uid: uid, imgObjs: im)
                contentView.backImgView1.sd_setImage(with: url)
            }
        }
        if let im = secondUser.im{
            if let uid = secondUser.uid{
                let url = CreateThumbUrl.mainImgUrl(uid: uid, imgObjs: im)
                contentView.backImgView2.sd_setImage(with: url)
            }
        }
        if let im = thirdUser.im{
            if let uid = thirdUser.uid{
                let url = CreateThumbUrl.mainImgUrl(uid: uid, imgObjs: im)
                contentView.backImgView3.sd_setImage(with: url)
            }
        }
    }
    @objc func btnFunc(_ sender:UIButton){
        contentView.closeAnimation {
            self.dismiss(animated: false, completion: {})
        }
    }
}
