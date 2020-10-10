//
//  GroupNotiVC1.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/03.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

class GroupNotiVC1: UIViewController {
    
    
    var contentView : GroupSideNotiView!
    
    
    var isFeed:Bool = true
    
    var totalWaitList = [String:[SideGroupStruct]]()
    var totalFeedList = [String:[SideGroupStruct]]()
    var myGroupList = [MyGroupListStruct]()
    var currentGid : String?
    
    
    var userProfileVC:FeedUserProfileVC!
    
    var delegate:GroupNotiDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    func reloadCollectionView(){
        if isFeed{
            contentView.feedCollectionView.reloadData()
        }else{
            contentView.waitCollectionView.reloadData()
        }
    }
    private func setup(){
        contentView = GroupSideNotiView()
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.feedCollectionView.delegate = self
        contentView.feedCollectionView.dataSource = self
        contentView.waitCollectionView.delegate = self
        contentView.waitCollectionView.dataSource = self
        
        contentView.feedCollectionView.register(Group2FeedCell.self, forCellWithReuseIdentifier: "Group2FeedCellid")
        contentView.feedCollectionView.register(Group3FeedCell.self, forCellWithReuseIdentifier: "Group3FeedCellid")
        contentView.feedCollectionView.register(Group4FeedCell.self, forCellWithReuseIdentifier: "Group4FeedCellid")
        
        contentView.waitCollectionView.register(Group2VoteCell.self, forCellWithReuseIdentifier: "Group2VoteCellid")
        contentView.waitCollectionView.register(Group3VoteCell.self, forCellWithReuseIdentifier: "Group3VoteCellid")
        contentView.waitCollectionView.register(Group4VoteCell.self, forCellWithReuseIdentifier: "Group4VoteCellid")
        
        contentView.feedCollectionView.register(Group2FeedHideCell.self, forCellWithReuseIdentifier: "Group2FeedHideCellid")
        contentView.feedCollectionView.register(Group3FeedHideCell.self, forCellWithReuseIdentifier: "Group3FeedHideCellid")
        contentView.feedCollectionView.register(Group4FeedHideCell.self, forCellWithReuseIdentifier: "Group4FeedHideCellid")
        
        contentView.feedBtn.addTarget(self, action: #selector(btnFunc(_:)), for: .touchUpInside)
        contentView.waitBtn.addTarget(self, action: #selector(btnFunc(_:)), for: .touchUpInside)
    }
    @objc func btnFunc(_ sender:UIButton){
        if sender == contentView.feedBtn{
            isFeed = true
            if contentView.feedCollectionView.isHidden == false{
                return
            }
            contentView.feedBtn.setTitleColor(UIColor.MainColor(), for: .normal)
            contentView.waitBtn.setTitleColor(UIColor.lightGray, for: .normal)
            contentView.feedCollectionView.isHidden = false
            contentView.waitCollectionView.isHidden = true
            contentView.feedCollectionView.reloadData()
        }else{
            isFeed = false
            if contentView.waitCollectionView.isHidden == false{
                return
            }
            contentView.waitBtn.setTitleColor(UIColor.MainColor(), for: .normal)
            contentView.feedBtn.setTitleColor(UIColor.lightGray, for: .normal)
            contentView.feedCollectionView.isHidden = true
            contentView.waitCollectionView.isHidden = false
            contentView.waitCollectionView.reloadData()
        }
    }
    func showGroup(gid:String){
        self.currentGid = gid
        self.contentView.waitCollectionView.reloadData()
        self.contentView.feedCollectionView.reloadData()
    }
    func setMyGroupData(data:MyGroupListStruct){
        if data.listInfo?.ind2 != 500{
            return
        }
        if self.myGroupList.contains(where: {$0.groupInfo?.gid! == data.groupInfo?.gid!}){
            return;
        }
        guard let gid = data.groupInfo?.gid else{ return }
        self.myGroupList.append(data)
        self.totalFeedList.merge([gid : [SideGroupStruct]()]){(a,_) -> [SideGroupStruct] in a }
        self.totalWaitList.merge([gid : [SideGroupStruct]()]){(a,_) -> [SideGroupStruct] in a }
    }
    func setFeedList(data:SideGroupStruct,myGid:String){
        if self.totalFeedList.contains(where: {$0.key == myGid}){
            self.totalFeedList[myGid]?.append(data)
            self.sortFeedArray()
        }
    }
    func setWaitList(data:SideGroupStruct,myGid:String){
        if self.totalWaitList.contains(where: {$0.key == myGid}){
            self.totalWaitList[myGid]?.append(data)
            self.sortWaitArray()
        }
    }
    func sortWaitArray(){
        self.contentView.waitCollectionView.reloadData()
    }
    func sortFeedArray(){
        self.contentView.feedCollectionView.reloadData()
    }
    private func presentUserVC(userData:MainListStruct){
        
    }
    private func configWaitCell2(cell:Group2VoteCell,gData:SideGroupStruct)->Group2VoteCell{
        guard let glData = gData.GL else { return cell}
        guard let memberData = gData.members else { return cell }
        guard let groupData = gData.group else{ return cell}
        guard let firstUser = memberData.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        guard let secondUser = memberData.first(where: {$0.uid! == groupData.uid2!}) else { return cell }
        if let firstUserIm = firstUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: firstUserIm)
            cell.imgView1.sd_setImage(with: url)
        }
        if let secondUserIm = secondUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: secondUserIm)
            cell.imgView2.sd_setImage(with: url)
        }
        if let na = groupData.na{
            cell.titleLabel.text = na
        }
        if let st = groupData.st{
            cell.subLabel.text = st
        }
        if let mid = glData.mid{
            let count = mid.count
            print("COUNT",count)
            let percentStr = String(Int(floor(Double(count) * 100/2)))
            print("PERCENT",percentStr)
            cell.countLabel.text = percentStr
        }
        
        return cell
    }
    private func configWaitCell3(cell:Group3VoteCell,gData:SideGroupStruct)->Group3VoteCell{
        print("GROUP3##")
        guard let glData = gData.GL else { return cell }
        print("GROUP4##")
        guard let memberData = gData.members else { return cell }
        print("GROUP5##")
        guard let groupData = gData.group else { return cell }
        print("GROUP6##")
        guard let firstUser = memberData.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        print("GROUP7##")
        guard let secondUser = memberData.first(where: {$0.uid! == groupData.uid2!}) else { return cell }
        print("GROUP8##")
        guard let thirdUser = memberData.first(where: {$0.uid! == groupData.uid3!}) else { return cell }
        print("GROUP9##")
        if let firstUserIm = firstUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: firstUserIm)
            cell.imgView1.sd_setImage(with: url)
        }
        if let secondUserIm = secondUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: secondUserIm)
            cell.imgView2.sd_setImage(with: url)
        }
        if let thirdUserIm = thirdUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: thirdUser.uid!, imgObjs: thirdUserIm)
            cell.imgView3.sd_setImage(with: url)
            
        }
        if let na = groupData.na{
            cell.titleLabel.text = na
        }
        if let st = groupData.st{
            cell.subLabel.text = st
        }
        if let mid = glData.mid{
            let count = mid.count
            let percentStr = String(Int(floor(Double(count) * 100/3)))
            cell.countLabel.text = percentStr
        }
        return cell
    }
    private func configWaitCell4(cell:Group4VoteCell,gData:SideGroupStruct)->Group4VoteCell{
        guard let glData = gData.GL else{ return cell }
        guard let groupData = gData.group else { return cell }
        guard let memberData = gData.members else { return cell }
        guard let firstUser = memberData.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        guard let secondUser = memberData.first(where: {$0.uid! == groupData.uid2!}) else { return cell }
        guard let thirdUser = memberData.first(where: {$0.uid! == groupData.uid3!}) else { return cell }
        guard let fourthUser = memberData.first(where: {$0.uid! == groupData.uid4!}) else { return cell }
        if let firstUserIm = firstUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: firstUserIm)
            cell.imgView1.sd_setImage(with: url)
        }
        if let secondUserIm = secondUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: secondUserIm)
            cell.imgView2.sd_setImage(with: url)
        }
        if let thirdUserIm = thirdUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: thirdUser.uid!, imgObjs: thirdUserIm)
            cell.imgView3.sd_setImage(with: url)
        }
        if let fourthUserIm = fourthUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: fourthUser.uid!, imgObjs: fourthUserIm)
            cell.imgView4.sd_setImage(with: url)
        }
        if let na = groupData.na{
            cell.titleLabel.text = na
        }
        if let st = groupData.st{
            cell.subLabel.text = st
        }
        if let mid = glData.mid{
            let count = mid.count
            let percentStr = String(Int(floor(Double(count) * 100/4)))
            cell.countLabel.text = percentStr
        }
        return cell
    }
    private func configFeedCell2(cell:Group2FeedCell,gData:SideGroupStruct)->Group2FeedCell{
        
        guard let glData = gData.GL else { return cell}
        guard let memberData = gData.members else { return cell }
        guard let groupData = gData.group else{ return cell}
        guard let firstUser = memberData.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        guard let secondUser = memberData.first(where: {$0.uid! == groupData.uid2!}) else { return cell }
        if let firstUserIm = firstUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: firstUserIm)
            cell.imgView1.sd_setImage(with: url)
        }
        if let secondUserIm = secondUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: secondUserIm)
            cell.imgView2.sd_setImage(with: url)
        }
        if let na = groupData.na{
            cell.titleLabel.text = na
        }
        if let st = groupData.st{
            cell.subLabel.text = st
        }
        if let index = glData.ind2{
            if index == 300{
                cell.logoImgView.image = UIImage(named: "NotiLike")
            }
            if index == 400{
                cell.logoImgView.image = UIImage(named: "NotiDeli")
                
            }
        }
        
        return cell
    }
    private func configFeedCell3(cell:Group3FeedCell,gData:SideGroupStruct)->Group3FeedCell{
        
        guard let glData = gData.GL else { return cell }
        guard let memberData = gData.members else { return cell }
        guard let groupData = gData.group else { return cell }
        guard let firstUser = memberData.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        guard let secondUser = memberData.first(where: {$0.uid! == groupData.uid2!}) else { return cell }
        guard let thirdUser = memberData.first(where: {$0.uid! == groupData.uid3!}) else { return cell }
        if let firstUserIm = firstUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: firstUserIm)
            cell.imgView1.sd_setImage(with: url)
        }
        if let secondUserIm = secondUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: secondUserIm)
            cell.imgView2.sd_setImage(with: url)
        }
        if let thirdUserIm = thirdUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: thirdUser.uid!, imgObjs: thirdUserIm)
            cell.imgView3.sd_setImage(with: url)
        }
        if let na = groupData.na{
            cell.titleLabel.text = na
        }
        if let st = groupData.st{
            cell.subLabel.text = st
        }
        if let index = glData.ind2{
            if index == 300{
                cell.logoImgView.image = UIImage(named: "NotiLike")
            }
            if index == 400{
                cell.logoImgView.image = UIImage(named: "NotiDeli")
            }
        }
        return cell
    }
    private func configFeedCell4(cell:Group4FeedCell,gData:SideGroupStruct)->Group4FeedCell{
        
        guard let glData = gData.GL else{ return cell }
        guard let groupData = gData.group else { return cell }
        guard let memberData = gData.members else { return cell }
        guard let firstUser = memberData.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        guard let secondUser = memberData.first(where: {$0.uid! == groupData.uid2!}) else { return cell }
        guard let thirdUser = memberData.first(where: {$0.uid! == groupData.uid3!}) else { return cell }
        guard let fourthUser = memberData.first(where: {$0.uid! == groupData.uid4!}) else { return cell }
        if let firstUserIm = firstUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: firstUserIm)
            cell.imgView1.sd_setImage(with: url)
        }
        if let secondUserIm = secondUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: secondUserIm)
            cell.imgView2.sd_setImage(with: url)
        }
        if let thirdUserIm = thirdUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: thirdUser.uid!, imgObjs: thirdUserIm)
            cell.imgView3.sd_setImage(with: url)
        }
        if let fourthUserIm = fourthUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: fourthUser.uid!, imgObjs: fourthUserIm)
            cell.imgView4.sd_setImage(with: url)
        }
        if let na = groupData.na{
            cell.titleLabel.text = na
        }
        if let st = groupData.st{
            cell.subLabel.text = st
        }
        if let index = glData.ind2{
            if index == 300{
                cell.logoImgView.image = UIImage(named: "NotiLike")
            }
            if index == 400{
                cell.logoImgView.image = UIImage(named: "NotiDeli")
                
            }
        }
        return cell
    }
    private func configFeedHideCell2(cell:Group2FeedHideCell,gData:SideGroupStruct,count:Int)->Group2FeedHideCell{
        
        guard let memberData = gData.members else { return cell }
        guard let groupData = gData.group else{ return cell}
        guard let firstUser = memberData.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        guard let secondUser = memberData.first(where: {$0.uid! == groupData.uid2!}) else { return cell }
        if let firstUserIm = firstUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: firstUserIm)
            cell.imgView1.sd_setImage(with: url)
        }
        if let secondUserIm = secondUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: secondUserIm)
            cell.imgView2.sd_setImage(with: url)
        }
        let countString = "+\(count)"
        cell.countLabel.text = countString
        
        return cell
    }
    private func configFeedHideCell3(cell:Group3FeedHideCell,gData:SideGroupStruct,count:Int)->Group3FeedHideCell{
        guard let memberData = gData.members else { return cell }
        guard let groupData = gData.group else { return cell }
        guard let firstUser = memberData.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        guard let secondUser = memberData.first(where: {$0.uid! == groupData.uid2!}) else { return cell }
        guard let thirdUser = memberData.first(where: {$0.uid! == groupData.uid3!}) else { return cell }
        if let firstUserIm = firstUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: firstUserIm)
            cell.imgView1.sd_setImage(with: url)
        }
        if let secondUserIm = secondUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: secondUserIm)
            cell.imgView2.sd_setImage(with: url)
        }
        if let thirdUserIm = thirdUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: thirdUser.uid!, imgObjs: thirdUserIm)
            cell.imgView3.sd_setImage(with: url)
        }
        let countString = "+\(count)"
        cell.countLabel.text = countString
        return cell
    }
    private func configFeedHideCell4(cell:Group4FeedHideCell,gData:SideGroupStruct,count:Int)->Group4FeedHideCell{
        
        guard let memberData = gData.members else { return cell }
        guard let groupData = gData.group else { return cell }
        guard let firstUser = memberData.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        guard let secondUser = memberData.first(where: {$0.uid! == groupData.uid2!}) else { return cell }
        guard let thirdUser = memberData.first(where: {$0.uid! == groupData.uid3!}) else { return cell }
        guard let fourthUser = memberData.first(where: {$0.uid! == groupData.uid4!}) else { return cell }
        if let firstUserIm = firstUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: firstUserIm)
            cell.imgView1.sd_setImage(with: url)
        }
        if let secondUserIm = secondUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: secondUserIm)
            cell.imgView2.sd_setImage(with: url)
        }
        if let thirdUserIm = thirdUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: thirdUser.uid!, imgObjs: thirdUserIm)
            cell.imgView3.sd_setImage(with: url)
        }
        if let fourthUserIm = fourthUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: fourthUser.uid!, imgObjs: fourthUserIm)
            cell.imgView4.sd_setImage(with: url)
        }
        let countString = "+\(count)"
        cell.countLabel.text = countString
        return cell
    }


}
extension GroupNotiVC1:UICollectionViewDelegate{
    
}
extension GroupNotiVC1:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == contentView.waitCollectionView{
            
//            contentView.showVoteEmptyView()
//            return 0
            if let gid = currentGid {
                if let selectedWaitList = totalWaitList[gid]{
                    return selectedWaitList.count
                }else{
                    return 0
                }
            }else{
                return 0
            }
            
        }else{
            
//            contentView.showFeedEmptyView()
//            return 0
            guard let gid = currentGid else { return 0 }
            guard let selectedFeedList = totalFeedList[gid] as? [SideGroupStruct] else { return 0}
            guard let myGroup = myGroupList.first(where: {$0.groupInfo?.gid! == currentGid}) else { return 0}
            if let ind2 = myGroup.groupInfo?.ind2,ind2{
                return selectedFeedList.count
            }else{
                let deliArray = selectedFeedList.filter({$0.GL?.ind2! == 400})
                let likeArray = selectedFeedList.filter({$0.GL?.ind2! == 300})
                if likeArray.count == 0{
                    return deliArray.count
                }else{
                    return deliArray.count + 1
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == contentView.waitCollectionView{
            
            guard let gid = currentGid else { return UICollectionViewCell() }
            guard let selectedWaitList = totalWaitList[gid] else { return UICollectionViewCell() }
            let selected = selectedWaitList[indexPath.row]
            
            guard let myGroup = myGroupList.first(where: {$0.groupInfo?.gid! == currentGid}) else { return UICollectionViewCell()}
            if myGroup.listInfo?.num == 2{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Group2VoteCellid", for: indexPath) as! Group2VoteCell
                return configWaitCell2(cell: cell, gData: selected)
            }else if myGroup.listInfo?.num == 3{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Group3VoteCellid", for: indexPath) as! Group3VoteCell
                return configWaitCell3(cell: cell, gData: selected)
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Group4VoteCellid", for: indexPath) as! Group4VoteCell
                return configWaitCell4(cell: cell, gData: selected)
            }
        }else{
            
            guard let myGroup = myGroupList.first(where: {$0.groupInfo?.gid! == currentGid}) else { return UICollectionViewCell()}
            guard let gid = currentGid else { return UICollectionViewCell() }
            guard let selectedFeedList = totalFeedList[gid] else { return UICollectionViewCell() }
            
            if let ind2 = myGroup.groupInfo?.ind2,ind2{

                let selected = selectedFeedList[indexPath.row]
                
                if myGroup.listInfo?.num == 2{
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Group2FeedCellid", for: indexPath) as! Group2FeedCell
                    return configFeedCell2(cell: cell, gData: selected)
                }else if myGroup.listInfo?.num == 3{
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Group3FeedCellid", for: indexPath) as! Group3FeedCell
                    return configFeedCell3(cell: cell, gData: selected)
                }else{
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Group4FeedCellid", for: indexPath) as! Group4FeedCell
                    return configFeedCell4(cell: cell, gData: selected)
                }
                
            }else{
                let deliArray = selectedFeedList.filter({$0.GL?.ind2! == 400})
                let likeArray = selectedFeedList.filter({$0.GL?.ind2! == 300})
                if likeArray.count == 0{
                    
                    
                    let selected = deliArray[indexPath.row]
                    if myGroup.listInfo?.num == 2{
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Group2FeedCellid", for: indexPath) as! Group2FeedCell
                        return configFeedCell2(cell: cell, gData: selected)
                    }else if myGroup.listInfo?.num == 3{
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Group3FeedCellid", for: indexPath) as! Group3FeedCell
                        return configFeedCell3(cell: cell, gData: selected)
                    }else{
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Group4FeedCellid", for: indexPath) as! Group4FeedCell
                        return configFeedCell4(cell: cell, gData: selected)
                    }
                    
                }else{
                    if indexPath.row == 0{

                        let selected = likeArray[0]
                        if myGroup.listInfo?.num == 2{
                            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Group2FeedHideCellid", for: indexPath) as! Group2FeedHideCell
                            return configFeedHideCell2(cell: cell, gData: selected, count: likeArray.count)
                        }else if myGroup.listInfo?.num == 3{
                            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Group3FeedHideCellid", for: indexPath) as! Group3FeedHideCell
                            return configFeedHideCell3(cell: cell, gData: selected, count: likeArray.count)
                        }else{
                            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Group4FeedHideCellid", for: indexPath) as! Group4FeedHideCell
                            return configFeedHideCell4(cell: cell, gData: selected, count: likeArray.count)
                        }
                    }else{

                        let selected = deliArray[indexPath.row-1]
                        if myGroup.listInfo?.num == 2{
                            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Group2FeedCellid", for: indexPath) as! Group2FeedCell
                            return configFeedCell2(cell: cell, gData: selected)
                        }else if myGroup.listInfo?.num == 3{
                            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Group3FeedCellid", for: indexPath) as! Group3FeedCell
                            return configFeedCell3(cell: cell, gData: selected)
                        }else{
                            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Group4FeedCellid", for: indexPath) as! Group4FeedCell
                            return configFeedCell4(cell: cell, gData: selected)
                        }
                    }
                    
                    
                }
            }
            
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let margin:CGFloat = 20
        let term:CGFloat = 5
        let spacing:CGFloat = 2
        
        let circleDiameter1 = ( collectionView.frame.width - margin*2 - term * 2 )/3
        let circleDiameter2 = circleDiameter1 - spacing*2
        
        let width = collectionView.frame.width
        let height:CGFloat =  85 + circleDiameter1
        guard let myGroup = myGroupList.first(where: {$0.groupInfo?.gid! == currentGid}) else { return CGSize.zero}
        
        if collectionView == contentView.waitCollectionView{
            let d = ( collectionView.frame.width - 60 ) / 4
            let height = d + 120
            return CGSize(width: collectionView.frame.width, height: height)
            
        }
        else {
            
            guard let gid = currentGid else { return CGSize.zero }
            guard let selectedFeedList = totalFeedList[gid] else { return CGSize.zero}
            if let ind2 = myGroup.groupInfo?.ind2,ind2{
                
                if myGroup.groupInfo?.num == 2{
                    return CGSize(width:width,height:width/2 + 75)
                }else if myGroup.groupInfo?.num == 3{
                    return CGSize(width:width,height:width/3 + 75)
                }else{
                    return CGSize(width:width,height:width/4 + 75)
                }
                
            }
            
            let deliArray = selectedFeedList.filter({$0.GL?.ind2! == 400})
            let likeArray = selectedFeedList.filter({$0.GL?.ind2! == 300})
            
            if likeArray.count == 0{

                if myGroup.groupInfo?.num == 2{
                    return CGSize(width:width,height:width/2 + 75)
                }else if myGroup.groupInfo?.num == 3{
                    return CGSize(width:width,height:width/3 + 75)
                }else{
                    return CGSize(width:width,height:width/4 + 75)
                }
            }else{
                if indexPath.row == 0{
                    if myGroup.groupInfo?.num == 2{
                        return CGSize(width:width,height:width/2)
                    }else if myGroup.groupInfo?.num == 3{
                        return CGSize(width:width,height:width/3)
                    }else{
                        return CGSize(width:width,height:width/4)
                    }
                }else{
                    if myGroup.groupInfo?.num == 2{
                        return CGSize(width:width,height:width/2 + 75)
                    }else if myGroup.groupInfo?.num == 3{
                        return CGSize(width:width,height:width/3 + 75)
                    }else{
                        return CGSize(width:width,height:width/4 + 75)
                    }
                }
            }
        }
        
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let myGroup = myGroupList.first(where: {$0.groupInfo?.gid! == currentGid}) else { return }
        if collectionView == contentView.waitCollectionView{
            guard let gid = currentGid else { return  }
            guard let selectedWaitList = totalWaitList[gid] else { return }
            let gData = selectedWaitList[indexPath.row]
            let groupId = myGroup.groupInfo?.gid!
            delegate.openGroupProfile(gData: gData,myGid:groupId!)
            return
        }
        if collectionView == contentView.feedCollectionView{
            
            guard let gid = currentGid else { return }
            guard let selectedFeedList = totalFeedList[gid] else { return  }
            if let ind2 = myGroup.groupInfo?.ind2,ind2{

                let gData = selectedFeedList[indexPath.row]
                let groupId = myGroup.groupInfo?.gid!
                delegate.openGroupProfile(gData: gData,myGid:groupId!)
                return
                
            }

            let deliArray = selectedFeedList.filter({$0.GL?.ind2! == 400})
            let likeArray = selectedFeedList.filter({$0.GL?.ind2! == 300})
            
            if likeArray.count == 0{
                let gData = selectedFeedList[indexPath.row]
                let groupId = myGroup.groupInfo?.gid!
                delegate.openGroupProfile(gData: gData,myGid:groupId!)
                return
            }else{
                if indexPath.row == 0{
                    let controller = ShowGroupLikeHideListAVC(viewController: self, groupData: selectedFeedList[indexPath.row])
                    controller.ShowIndicator()
                    return
                }else{
                    let gData = deliArray[indexPath.row-1]
//                    presentUserVC(userData: gData)
//                    delegate.openGroupProfile(gData: gData,myGid:groupId!)
                    return
                }
            }
            
        }
    }
    
}
