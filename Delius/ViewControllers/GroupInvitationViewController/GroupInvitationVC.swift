//
//  GroupInvitationVC.swift
//  Delius
//
//  Created by 박진호 on 2020/07/08.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class GroupInvitationVC:UIViewController{
    
    var contentView:GroupInvitationView!
    
    var service:GroupInvitationService!
    
    
    var gData:MyGroupListStruct?
    var myData:UserStruct?
    
    var tapGesture:UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        service = GroupInvitationService()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        contentView.openAnimation()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapFunc(_:)))
        contentView.shadowView.addGestureRecognizer(tapGesture)
        guard let groupData = gData?.groupInfo else { return }
        guard let mData = gData?.listInfo else { return }
        guard let uid = myData?.uid else { return }
        if let num = groupData.num{
            if num == 2{
                if let index = mData.uids!.firstIndex(of: uid){
                    contentView.setup2(requestNumber: index)
                }
                if let firstUser = gData?.memberInfo?.first(where: {$0.uid! == groupData.uid1!}){
                    if let im = firstUser.im{
                        let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: im)
                        contentView.imgView1.sd_setImage(with: url)
                    }
                }
                if let secondUser = gData?.memberInfo?.first(where: {$0.uid! == groupData.uid2!}){
                    if let im = secondUser.im{
                        let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: im)
                        contentView.imgView2.sd_setImage(with: url)
                    }
                }
            }
            if num == 3{
                if let index = mData.uids!.firstIndex(of: uid){
                    contentView.setup3(requestNumber: index)
                }
                if let firstUser = gData?.memberInfo?.first(where: {$0.uid! == groupData.uid1!}){
                    if let im = firstUser.im{
                        let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: im)
                        contentView.imgView1.sd_setImage(with: url)
                    }
                }
                if let secondUser = gData?.memberInfo?.first(where: {$0.uid! == groupData.uid2!}){
                    if let im = secondUser.im{
                        let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: im)
                        contentView.imgView2.sd_setImage(with: url)
                    }
                }
                if let thirdUser = gData?.memberInfo?.first(where: {$0.uid! == groupData.uid3!}){
                    if let im = thirdUser.im{
                        let url = CreateThumbUrl.mainImgUrl(uid: thirdUser.uid!, imgObjs: im)
                        contentView.imgView3.sd_setImage(with: url)
                    }
                }
                
            }
            if num == 4{
                if let index = mData.uids!.firstIndex(of: uid){
                    contentView.setup4(requestNumber: index)
                }
                if let firstUser = gData?.memberInfo?.first(where: {$0.uid! == groupData.uid1!}){
                    if let im = firstUser.im{
                        let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: im)
                        contentView.imgView1.sd_setImage(with: url)
                    }
                }
                if let secondUser = gData?.memberInfo?.first(where: {$0.uid! == groupData.uid2!}){
                    if let im = secondUser.im{
                        let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: im)
                        contentView.imgView2.sd_setImage(with: url)
                    }
                }
                if let thirdUser = gData?.memberInfo?.first(where: {$0.uid! == groupData.uid3!}){
                    if let im = thirdUser.im{
                        let url = CreateThumbUrl.mainImgUrl(uid: thirdUser.uid!, imgObjs: im)
                        contentView.imgView3.sd_setImage(with: url)
                    }
                }
                if let fourthUser = gData?.memberInfo?.first(where: {$0.uid! == groupData.uid4!}){
                    if let im = fourthUser.im{
                        let url = CreateThumbUrl.mainImgUrl(uid: fourthUser.uid!, imgObjs: im)
                        contentView.imgView4.sd_setImage(with: url)
                    }
                }
            }
        }
        if let groupName = groupData.na{
            contentView.groupNameLabel.text = groupName
        }
        if let status = groupData.st{
            contentView.groupStatusLabel.text = status
        }
        if let lo = groupData.lo{
            contentView.locationLabel.text = lo
        }
        if let fo1 = groupData.fo1{
            contentView.fo1Label.text = String.GroupInfo1Array()[fo1]
        }
        if let fo2 = groupData.fo2{
            contentView.fo2Label.text = String.GroupInfo2Array()[fo2]
        }
        if let fo3 = groupData.fo3{
            contentView.fo3Label.text = String.GroupInfo3Array()[fo3]
        }
        if let tp = groupData.tp{
            if let lt = groupData.ltp{
                CalculateTime.groupDateRange(start: tp.seconds, end: lt, label: contentView.timeLabel)
            }
        }
        if let ex = groupData.ex{
            contentView.extraLabel.text = ex
        }
        
        
    }
    private func setup(){
        contentView = GroupInvitationView(frame: view.bounds)
        
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    @objc func rejectBtnFunc(_ sender:UIButton){
        response(response: 801)
    }
    @objc func allowBtnFunc(_ sender:UIButton){
        response(response: 201)
    }
    private func response(response:Int){
    }
    @objc func tapFunc(_ sender:UITapGestureRecognizer){
        contentView.closeAnimation {
            self.dismiss(animated: false, completion: {})
        }
    }
    
}

