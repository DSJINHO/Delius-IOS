//
//  MenuVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/03.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class MenuVC: UIViewController {
    var presentingTransition:AlphaTransitionPresent?
    var dismissingTransition:AlphaTransitionDismiss?
    
    var groupArray=[MyinfoStruct]()
    var groupDataArray=[GroupStruct]()
    var userDataArray=[UserStruct]()
    
    
    var cashItem:CashItemStruct!
    var userInfo:UserStruct?
    var contentView:MenuView!
    var userImgs:[UIImage]?
    
    var delegate:MenuDelegate!
    var profileTap:UITapGestureRecognizer!
    
    
    var groupList = [MyGroupListStruct]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        setup()
        
    }
    func setup(){
        contentView = MenuView(frame: view.bounds)
        view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        contentView.groupCollectionView.register(MenuGroup2Cell.self, forCellWithReuseIdentifier: "MenuGroupCell2id")
        contentView.groupCollectionView.register(MenuGroup3Cell.self, forCellWithReuseIdentifier: "MenuGroupCell3id")
        contentView.groupCollectionView.register(MenuGroup4Cell.self, forCellWithReuseIdentifier: "MenuGroupCell4id")
        contentView.groupCollectionView.register(MenuGroupInviteCell.self, forCellWithReuseIdentifier: "MenuGroupInviteCellid")
        contentView.groupCollectionView.register(MenuGroupWaitCell.self, forCellWithReuseIdentifier: "MenuGroupWaitCellid")
        contentView.groupCollectionView.register(MenuGroupRejectCell.self, forCellWithReuseIdentifier: "MenuGroupRejectCellid")
        contentView.groupCollectionView.register(MenuGroupCancelCell.self, forCellWithReuseIdentifier: "MenuGroupCancelCellid")
        
        contentView.groupCollectionView.dataSource = self
        contentView.groupCollectionView.delegate = self
        
        contentView.editProfileBtn.addTarget(self, action: #selector(editProfileBtnFunc(_:)), for: .touchUpInside)
//        contentView.filterBtn.addTarget(self, action: #selector(filterBtnFunc(_:)), for: .touchUpInside)
//        contentView.blockBtn.addTarget(self, action: #selector(blockBtnFunc(_:)), for: .touchUpInside)
        contentView.plusUserBtn.addTarget(self, action: #selector(buyPlusBtnFunc(_:)), for: .touchUpInside)
        contentView.deliBtn.addTarget(self, action: #selector(buyDeliBtnFunc(_:)), for: .touchUpInside)
        contentView.boosterBtn.addTarget(self, action: #selector(buyBoosterBtnFunc(_:)), for: .touchUpInside)
        
        
        contentView.userDeliBtn.addTarget(self, action: #selector(currentDeliBtnFunc(_:)), for: .touchUpInside)
        contentView.userBoosterBtn.addTarget(self, action: #selector(currentBoosterBtnFunc(_:)), for: .touchUpInside)
        
        
        profileTap = UITapGestureRecognizer(target: self, action: #selector(profileTapFunc(_:)))
        contentView.profileView.addGestureRecognizer(profileTap)
        contentView.bringSubviewToFront(contentView.profileView)
        
        
        
    }
    @objc func profileTapFunc(_ sender:UITapGestureRecognizer){
        self.delegate.showMyProfile()
    }
    func setMyData(userInfo:UserStruct){
        guard let uid = userInfo.uid else { return }
        self.userInfo = userInfo
        if let userName = userInfo.na {
            contentView.profileNameLabel.text = userName
        }
        if let statusStr = userInfo.st {
            contentView.profileStatusLabel.text = statusStr
        }
        if let im = userInfo.im {
            let url = CreateThumbUrl.mainImgUrl(uid: uid, imgObjs: im)
            contentView.imgBackView.sd_setImage(with: url)
            contentView.profileImgView.sd_setImage(with: url)
        }
    }
    
    
    
    
    func setupData(userInfo:UserStruct,completion:@escaping()->Void){
        
        guard let uid = userInfo.uid else { return }
        
        if let userName = userInfo.na {
            contentView.profileNameLabel.text = userName
        }
        if let statusStr = userInfo.st {
            contentView.profileStatusLabel.text = statusStr
        }
        if let im = userInfo.im {
            let url = CreateThumbUrl.mainImgUrl(uid: uid, imgObjs: im)
            contentView.imgBackView.sd_setImage(with: url)
            contentView.profileImgView.sd_setImage(with: url)
        }
        completion()
    }
    @objc func buyPlusBtnFunc(_ sender:UIButton){
        
        let controller = ShowPurchaseDeliVC(viewController: self)
        controller.ShowIndicator()
        return
        let vc = BuyPlusUserVC()
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        present(vc,animated: false,completion: {})
    }
    @objc func buyDeliBtnFunc(_ sender:UIButton){
        let controller = ShowPurchaseLikeVC(viewController: self)
        controller.ShowIndicator()
        return 
        let vc = BuyDeliVC()
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        present(vc,animated: false,completion: {})
    }
    @objc func buyBoosterBtnFunc(_ sender:UIButton){
        let controller = ShowPurchaseBoosterVC(viewController: self)
        controller.ShowIndicator()
        return
        let vc = BuyBoosterVC()
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        present(vc,animated: false,completion: {})
    }
    @objc func currentDeliBtnFunc(_ sender:UIButton){
        let vc = CurrentDeliVC()
        vc.cashItem = self.cashItem
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        present(vc, animated: false, completion: {})
    }
    @objc func currentBoosterBtnFunc(_ sender:UIButton){
        let vc = CurrentBoosterVC()
        vc.cashItem = self.cashItem
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        present(vc, animated: false, completion: {})
    }
    @objc func editProfileBtnFunc(_ sender:UIButton){
        return
        guard let user = userInfo else { return }
        let controller = ShowProfileEdit(viewController: self, userData: user)
        controller.ShowIndicator()
    }
    private func configRejectCell(cell:MenuGroupRejectCell,data:MyGroupListStruct)->MenuGroupRejectCell{
        guard let groupData = data.groupInfo else { return cell }
        guard let masterUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        
        if let masterImNames = masterUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: masterUser.uid!, imgObjs: masterImNames)
            cell.backView.sd_setImage(with: url)
        }
        if let groupName = groupData.na{
            cell.nameLabel.text = groupName
        }
        return cell
    }
    private func configCancelCell(cell:MenuGroupCancelCell,data:MyGroupListStruct)->MenuGroupCancelCell{
        guard let groupData = data.groupInfo else { return cell }
        guard let masterUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        
        if let masterImNames = masterUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: masterUser.uid!, imgObjs: masterImNames)
            cell.backView.sd_setImage(with: url)
        }
        if let groupName = groupData.na{
            cell.nameLabel.text = groupName
        }
        return cell
    }
    private func configWaitingCell(cell:MenuGroupWaitCell,data:MyGroupListStruct)->MenuGroupWaitCell{
        
        guard let groupData = data.groupInfo else { return cell }
        guard let masterUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        
        if let masterImNames = masterUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: masterUser.uid!, imgObjs: masterImNames)
            cell.backView.sd_setImage(with: url)
        }
        if let groupName = groupData.na{
            cell.nameLabel.text = groupName
        }
        return cell
        
    }
    private func configInviteCell(cell:MenuGroupInviteCell,data:MyGroupListStruct)->MenuGroupInviteCell{
    
        
        guard let groupData = data.groupInfo else { return cell }
        guard let masterUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        
        
        if let masterImNames = masterUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: masterUser.uid!, imgObjs: masterImNames)
            cell.imgView.sd_setImage(with: url)
        }
        
        if let groupName = groupData.na{
            cell.nameLabel.text = groupName
        }
        if let tp = data.listInfo?.tp{
            let timeStr = CalculateChatTime.cellTime(seconds: Double(tp.seconds))
            cell.dateLabel.text = timeStr
        }
        return cell
    }
    private func configTwoPeopleCell(cell:MenuGroup2Cell,data:MyGroupListStruct)->MenuGroup2Cell{
        
        guard let groupData = data.groupInfo else { return cell }
        guard let firstUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        guard let secondUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid2!}) else { return cell }
        if let firstUserImgNames = firstUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: firstUserImgNames)
            cell.imgView.sd_setImage(with: url)
//            cell.backView.sd_setImage(with: url)
        }
        if let secondUserImgNames = secondUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: secondUserImgNames)
            cell.imgView2.sd_setImage(with: url)
        }
        if let status = groupData.st{
            cell.stateLabel.text = status
        }
//        var userNames = ""
//        if let firstUserName = firstUser.na{
//            userNames = firstUserName
//        }
//        if let secondUserName = secondUser.na{
//            userNames = userNames + " / " + secondUserName
//        }
//        cell.memberNameLabel.text = userNames
        if let groupName = groupData.na{
            cell.nameLabel.text = groupName
        }
        if let tp = groupData.tp{
            if let lt = groupData.ltp{
                CalculateTime.groupDateRange(start: tp.seconds, end: lt, label: cell.dateLabel)
            }
        }
        return cell
        
    }
    private func configThreePeopleCell(cell:MenuGroup3Cell,data:MyGroupListStruct)->MenuGroup3Cell{
        guard let groupData = data.groupInfo else { return cell }
        guard let firstUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        guard let secondUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid2!}) else { return cell }
        guard let thirdUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid3!}) else { return cell }
        if let firstUserImgNames = firstUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: firstUserImgNames)
            cell.imgView.sd_setImage(with: url)
//            cell.backView.sd_setImage(with: url)
        }
        if let secondUserImgNames = secondUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: secondUserImgNames)
            cell.imgView2.sd_setImage(with: url)
        }
        if let thirdUserImgNames = thirdUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: thirdUser.uid!, imgObjs: thirdUserImgNames)
            cell.imgView3.sd_setImage(with: url)
        }
        if let status = groupData.st{
            cell.stateLabel.text = status
        }
//        var userNames = ""
//        if let firstUserName = firstUser.na{
//            userNames = firstUserName
//        }
//        if let secondUserName = secondUser.na{
//            userNames = userNames + " / " + secondUserName
//        }
//        if let thirdUserName = thirdUser.na{
//            userNames = userNames + " / " + thirdUserName
//        }
//        cell.memberNameLabel.text = userNames
        if let groupName = groupData.na{
            cell.nameLabel.text = groupName
        }
        if let tp = groupData.tp{
            if let lt = groupData.ltp{
                CalculateTime.groupDateRange(start: tp.seconds, end: lt, label: cell.dateLabel)
            }
        }
        return cell
        
    }
    private func configFourPeopleCell(cell:MenuGroup4Cell,data:MyGroupListStruct)->MenuGroup4Cell{
        guard let groupData = data.groupInfo else { return cell }
        guard let firstUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        guard let secondUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid2!}) else { return cell }
        guard let thirdUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid3!}) else { return cell }
        guard let fourthUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid4!}) else { return cell }
        if let firstUserImgNames = firstUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: firstUserImgNames)
            cell.imgView.sd_setImage(with: url)
//            cell.backView.sd_setImage(with: url)
        }
        if let secondUserImgNames = secondUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: secondUserImgNames)
            cell.imgView2.sd_setImage(with: url)
        }
        if let thirdUserImgNames = thirdUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: thirdUser.uid!, imgObjs: thirdUserImgNames)
            cell.imgView3.sd_setImage(with: url)
        }
        if let fourthUserImgNames = fourthUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: fourthUser.uid!, imgObjs: fourthUserImgNames)
            cell.imgView4.sd_setImage(with: url)
        }
        if let status = groupData.st{
            cell.stateLabel.text = status
        }
//        var userNames = ""
//        if let firstUserName = firstUser.na{
//            userNames = firstUserName
//        }
//        if let secondUserName = secondUser.na{
//            userNames = userNames + " / " + secondUserName
//        }
//        if let thirdUserName = thirdUser.na{
//            userNames = userNames + " / " + thirdUserName
//        }
//        if let fourthUserName = fourthUser.na{
//            userNames = userNames + " / " + fourthUserName
//        }
//        cell.memberNameLabel.text = userNames
        if let groupName = groupData.na{
            cell.nameLabel.text = groupName
        }
        if let tp = groupData.tp{
            if let lt = groupData.ltp{
                CalculateTime.groupDateRange(start: tp.seconds, end: lt, label: cell.dateLabel)
            }
        }
        return cell
        
    }

}
extension MenuVC:UICollectionViewDelegate{
    
}
extension MenuVC:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if groupList == nil || groupList.count == 0{
            contentView.defaultGroupView.isHidden = false
            return 0
        }else{
            contentView.defaultGroupView.isHidden = true
            return groupList.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let selected = groupList[indexPath.row].listInfo else { return UICollectionViewCell()}
        if selected.ind2! == 101 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuGroupInviteCellid", for: indexPath) as! MenuGroupInviteCell
            return configInviteCell(cell: cell, data: groupList[indexPath.row])

        }else if selected.ind2! == 301 || groupList[indexPath.row].listInfo?.ind2! == 201{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuGroupWaitCellid", for: indexPath) as! MenuGroupWaitCell
            return configWaitingCell(cell: cell, data: groupList[indexPath.row])
        }else if selected.ind2! == 801{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuGroupRejectCellid", for: indexPath) as! MenuGroupRejectCell
            return cell
        }else if selected.ind2! == 901{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuGroupCancelCellid", for: indexPath) as! MenuGroupCancelCell
            return cell
        }else{
            if selected.num! == 2{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuGroupCell2id", for: indexPath) as! MenuGroup2Cell
                return configTwoPeopleCell(cell: cell, data: groupList[indexPath.row])
            }else if selected.num! == 3{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuGroupCell3id", for: indexPath) as! MenuGroup3Cell
                return configThreePeopleCell(cell: cell, data: groupList[indexPath.row])
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuGroupCell4id", for: indexPath) as! MenuGroup4Cell
                return configFourPeopleCell(cell: cell, data: groupList[indexPath.row])
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 60
        return CGSize(width:width,height:collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let index = groupList[indexPath.row].listInfo?.ind2
        let number = groupList[indexPath.row].listInfo?.num
        if index == 500{
            if number == 2{
                
            }
            if number == 3{
                
            }
            if number == 4{
                
            }
        }
        if index == 101{
            let controller = ShowGroupInvitationVC(viewController: self, groupData: groupList[indexPath.row], usersData: userInfo!)
            controller.ShowIndicator()
        }
        if index == 201{
            
        }
        if index == 301{
            
        }
        
        
        return
        
        
        
//        let gid = groupArray[indexPath.row].id!
//        let state = groupArray[indexPath.row].ind2!
//        let uid = groupArray[indexPath.row].uid
//        let uids = groupArray[indexPath.row].uids!
//        guard let groupData = groupDataArray.first(where:{$0.gid! == gid}) else { return }
//        var usersData = [UserStruct]()
//        if groupData.num! == 2{
//            let user1 = userDataArray.first(where:{$0.uid! == groupData.uid1})
//            let user2 = userDataArray.first(where:{$0.uid! == groupData.uid2})
//            usersData = [user1!,user2!]
//        }
//
//
//        if groupArray[indexPath.row].ind2! == 101 {
//            let controller = ShowGroupInvitationVC(viewController: self,gid:gid,order:1, state:state,groupData: groupData,usersData:usersData)
//            controller.ShowIndicator()
//        }else if groupArray[indexPath.row].ind2! == 301 || groupArray[indexPath.row].ind2 == 201{
//
//        }else{
//            if groupArray[indexPath.row].num == 2{
//            }else if groupArray[indexPath.row].num == 3{
//            }else{
//            }
//        }
    }
    
    
}

extension MenuVC: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}
