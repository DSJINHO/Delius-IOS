//
//  GroupHideLikeListVC.swift
//  Delius
//
//  Created by user on 2020/08/27.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class GroupHideLikeListVC:UIViewController{
    
    var contentView:GroupHideLikeListView!
    var sampleData:SideGroupStruct!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        contentView.openAnimation()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapFunc(_:)))
        contentView.shadowView.addGestureRecognizer(tapGesture)
        
        setData()
        
    }
    private func setup(){
        contentView = GroupHideLikeListView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    private func setData(){
        guard let data = sampleData else { return }
        guard let groupData = data.group else {return }
        if let num = groupData.num, num == 2{
            guard let firstUser = data.members?.first(where: {$0.uid! == groupData.uid1!}) else { return }
            guard let secondUser = data.members?.first(where: {$0.uid! == groupData.uid2!}) else { return }
            if let im = firstUser.im{
                let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: im)
                contentView.imgView1.sd_setImage(with: url)
            }
            if let im = secondUser.im{
                let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: im)
                contentView.imgView2.sd_setImage(with: url)
            }
            contentView.setup2()
        }
        if let num = groupData.num, num == 3{
            guard let firstUser = data.members?.first(where: {$0.uid! == groupData.uid1!}) else { return }
            guard let secondUser = data.members?.first(where: {$0.uid! == groupData.uid2!}) else { return }
            guard let thirdUser = data.members?.first(where: {$0.uid! == groupData.uid3!}) else { return }
            if let im = firstUser.im{
                let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: im)
                contentView.imgView1.sd_setImage(with: url)
            }
            if let im = secondUser.im{
                let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: im)
                contentView.imgView2.sd_setImage(with: url)
            }
            if let im = secondUser.im{
                let url = CreateThumbUrl.mainImgUrl(uid: thirdUser.uid!, imgObjs: im)
                contentView.imgView3.sd_setImage(with: url)
            }
            contentView.setup3()
        }
        if let num = groupData.num, num == 4{
            guard let firstUser = data.members?.first(where: {$0.uid! == groupData.uid1!}) else { return }
            guard let secondUser = data.members?.first(where: {$0.uid! == groupData.uid2!}) else { return }
            guard let thirdUser = data.members?.first(where: {$0.uid! == groupData.uid3!}) else { return }
            guard let fourthUser = data.members?.first(where: {$0.uid! == groupData.uid4!}) else { return }
            if let im = firstUser.im{
                let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: im)
                contentView.imgView1.sd_setImage(with: url)
            }
            if let im = secondUser.im{
                let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: im)
                contentView.imgView2.sd_setImage(with: url)
            }
            if let im = secondUser.im{
                let url = CreateThumbUrl.mainImgUrl(uid: thirdUser.uid!, imgObjs: im)
                contentView.imgView3.sd_setImage(with: url)
            }
            if let im = secondUser.im{
                let url = CreateThumbUrl.mainImgUrl(uid: fourthUser.uid!, imgObjs: im)
                contentView.imgView4.sd_setImage(with: url)
            }
            contentView.setup4()
        }
    }
    @objc func tapFunc(_ sender:UITapGestureRecognizer){
        contentView.closeAnimation {
            self.dismiss(animated: false, completion: {})
        }
    }
}
