//
//  GroupChatVC1.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/03.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
class GroupChatVC1: UIViewController {
    var contentView:GroupSideChatView!
    
    
    var selectedList = [SideGroupStruct]()
    
    var matchList = [String:[GroupMatchListStruct]]()
    var chatList = [GroupChatListStruct]()
    
    var selectedGid : String?
    var chatArr = [String:[GroupChatListStruct]]()
    var matchArr = [String:[SideGroupStruct]]()
    var myGroupList = [MyGroupListStruct]()
    
    let myId = Auth.auth().currentUser?.uid
    
    var observer = [[String:UInt]]()
    
    var observeArr = [String]()
    
    
    var currentGid : String?
    
    
    var ref:DatabaseReference!
    
    var delegate:GroupChatDelegate? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    private func setup(){
        
        let arr1 = ["A","B","C","D","E","F","G","H","I"]
        let arr2 = ["J","K","L","M","N","O","P","Q","R"]
        let arr3 = ["S","T","U","V","W","X","Y","Z","0"]
        let arr4 = ["1","2","3","4","5","6","7","8","9"]
        guard let currentUser = Auth.auth().currentUser else { return }
        let uid = currentUser.uid
        let firstStr = uid.first!
        let str = firstStr.uppercased()
        if arr1.contains(str){
            ref = Database.database(url: "https://delius-46aa7.firebaseio.com/").reference()
        }else if arr2.contains(str){
            ref = Database.database(url: "https://delius-46aa7-199bd.firebaseio.com/").reference()
            
        }else if arr3.contains(str){
            ref = Database.database(url: "https://delius-46aa7-39305.firebaseio.com/").reference()
            
        }else{
            ref = Database.database(url: "https://delius-46aa7-ce17b.firebaseio.com/").reference()
            
        }
        
        contentView = GroupSideChatView()
        view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.chatCollectionView.register(Group2ChatListCell.self, forCellWithReuseIdentifier: "Group2ChatListCellid")
        contentView.chatCollectionView.register(Group3ChatListCell.self, forCellWithReuseIdentifier: "Group3ChatListCellid")
        contentView.chatCollectionView.register(Group4ChatListCell.self, forCellWithReuseIdentifier: "Group4ChatListCellid")
        
        contentView.chatCollectionView.dataSource = self
        contentView.chatCollectionView.delegate = self
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    func showGroup(gid:String){
        self.currentGid = gid
        self.contentView.chatCollectionView.reloadData()
    }
    func setMyGroup(data:MyGroupListStruct){
        if data.listInfo?.ind2 != 500{
            return
        }
        if self.myGroupList.contains(where: {$0.groupInfo?.gid! == data.groupInfo?.gid!}){
            return;
        }
        guard let gid = data.groupInfo?.gid else { return }
        self.myGroupList.append(data)
        self.matchList.merge([gid:[GroupMatchListStruct]()]){(a,_)->[GroupMatchListStruct] in a}
    }
    func setChatList(data:SideGroupStruct,myGid:String){
        if !self.matchList.contains(where: {$0.key == myGid}){
            return;
        }
        self.matchList[myGid]?.append(GroupMatchListStruct(groupData: data))
        self.sortArray(gid: myGid)
        guard let gl = data.GL else { return }
        guard let pid = gl.targetid else { return }
        guard let size = gl.num else { return }
        let dbRef = ref.child(myId!).child(myGid).child(pid)
        dbRef.observe(.value){ DataSnapshot in
            if let chatChangeData = DataSnapshot.value as? [String:Any]{
                let data = chatChangeData.merging(["groupId":pid]){(f,_) -> Any in f}
                let chatData = GroupChatListStruct(dictionary: data)
                if let find = self.matchList[myGid]?.first(where: {$0.groupData?.GL?.targetid! == pid}){
                    find.chatData = chatData
                    self.sortArray(gid: myGid)
                }
            }
        }
//        if size == 2 {
//            ref = Database.database(url: "https://delius-46aa7-199bd.firebaseio.com/").reference().child(myId!).child(myGid).child(pid)
//
//            ref.observe(.value){ DataSnapshot in
//                if let chatChangeData = DataSnapshot.value as? [String:Any]{
//                    let data = chatChangeData.merging(["groupId":pid]){(f,_) -> Any in f}
//                    let chatData = GroupChatListStruct(dictionary: data)
//                    if let find = self.matchList[myGid]?.first(where: {$0.groupData?.GL?.targetid! == pid}){
//                        find.chatData = chatData
//                        self.sortArray(gid: myGid)
//                    }
//                }
//            }
//        }
//        else if size == 3{
//
//            ref = Database.database(url: "https://delius-46aa7-39305.firebaseio.com/").reference().child(myId!).child(myGid).child(pid)
//            ref.observe(.value){ DataSnapshot in
//                if let chatChangeData = DataSnapshot.value as? [String:Any]{
//                    let data = chatChangeData.merging(["groupId":pid]){(f,_) -> Any in f}
//                    let chatData = GroupChatListStruct(dictionary: data)
//                    if let find = self.matchList[myGid]?.first(where: {$0.groupData?.GL?.targetid! == pid}){
//                        find.chatData = chatData
//                        self.sortArray(gid: myGid)
//                    }
//                }
//            }
//        }
//        else{
//
//            ref = Database.database(url: "https://delius-46aa7-ce17b.firebaseio.com/").reference().child(myId!).child(myGid).child(pid)
//            ref.observe(.value){ DataSnapshot in
//                if let chatChangeData = DataSnapshot.value as? [String:Any]{
//                    let data = chatChangeData.merging(["groupId":pid]){(f,_) -> Any in f}
//                    let chatData = GroupChatListStruct(dictionary: data)
//                    if let find = self.matchList[myGid]?.first(where: {$0.groupData?.GL?.targetid! == pid}){
//                        find.chatData = chatData
//                        self.sortArray(gid: myGid)
//                    }
//                }
//            }
//        }
    }
    func sortArray(gid:String){
        matchList[gid]!.sort{(f,a) -> Bool in
            if f.chatData == nil && a.chatData == nil{
                return f.groupData!.GL!.tp!.seconds > a.groupData!.GL!.tp!.seconds
            }
            else if f.chatData == nil && a.chatData != nil{
                return f.groupData!.GL!.tp!.seconds > Int64(truncating: a.chatData!.tp!)
            }
            else if f.chatData != nil && a.chatData == nil{
                return Int64(truncating: f.chatData!.tp!) > a.groupData!.GL!.tp!.seconds
            }
            else {
                return Int64(truncating: f.chatData!.tp!) > Int64(truncating: a.chatData!.tp!)
            }
        }
        self.contentView.chatCollectionView.reloadData()
    }
    
    
    
    
    
    
    
    
    
    
    
    func sortMatchList(gid:String){
        guard let findItem = matchList[gid] else{ return }
        matchList[gid]!.sort{(f,a) -> Bool in
            if f.chatData == nil && a.chatData == nil{
                return f.groupData!.GL!.tp!.seconds > a.groupData!.GL!.tp!.seconds
            }
            else if f.chatData == nil && a.chatData != nil{
                return f.groupData!.GL!.tp!.seconds > Int64(truncating: a.chatData!.tp!)
            }
            else if f.chatData != nil && a.chatData == nil{
                return Int64(truncating: f.chatData!.tp!) > a.groupData!.GL!.tp!.seconds
            }
            else {
                return Int64(truncating: f.chatData!.tp!) > Int64(truncating: a.chatData!.tp!)
            }
        }
        self.contentView.chatCollectionView.reloadData()
    }
    private func configTwoPeopleCell(cell:Group2ChatListCell,gData:GroupMatchListStruct)->Group2ChatListCell{
        guard let sideData = gData.groupData else { return cell }
        guard let glData = sideData.GL else{ return cell }
        guard let groupData = sideData.group else { return cell }
        guard let firstUser = sideData.members?.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        guard let secondUser = sideData.members?.first(where: {$0.uid! == groupData.uid2!}) else { return cell }
        if let firstUserIm = firstUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: firstUserIm)
            cell.imgView.sd_setImage(with: url)
        }
        if let secondUserIm = secondUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: secondUserIm)
            cell.imgView2.sd_setImage(with: url)
        }
        if let na = groupData.na{
            cell.nameLabel.text = na
        }
        if let chatData = gData.chatData{
            cell.messageLabel.text = chatData.msg
            cell.dateLabel.text = CalculateChatTime.cellTime(seconds: Double(truncating: chatData.tp!))
            if let read = chatData.r, !read{
                cell.badge.isHidden = false
            }else{
                cell.badge.isHidden = true
            }
        }else{
            cell.badge.isHidden = true
            cell.messageLabel.text = "먼저 대화를 해보세요!"
            cell.dateLabel.text = CalculateChatTime.cellTime(seconds: Double(glData.tp!.seconds))
        }
        return cell
        
    }
    private func configThreePeopleCell(cell:Group3ChatListCell,gData:GroupMatchListStruct)->Group3ChatListCell{
        
        guard let sideData = gData.groupData else { return cell }
        guard let glData = sideData.GL else{ return cell }
        guard let groupData = sideData.group else { return cell }
        guard let firstUser = sideData.members?.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        guard let secondUser = sideData.members?.first(where: {$0.uid! == groupData.uid2!}) else { return cell }
        guard let thirdUser = sideData.members?.first(where: {$0.uid! == groupData.uid3!}) else { return cell }
        if let firstUserIm = firstUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: firstUserIm)
            cell.imgView.sd_setImage(with: url)
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
            cell.nameLabel.text = na
        }
        if let chatData = gData.chatData{
            cell.messageLabel.text = chatData.msg
            cell.dateLabel.text = CalculateChatTime.cellTime(seconds: Double(truncating: chatData.tp!))
            if let read = chatData.r, !read{
                cell.badge.isHidden = false
            }else{
                cell.badge.isHidden = true
            }
        }else{
            cell.badge.isHidden = true
            cell.messageLabel.text = "먼저 대화를 해보세요!"
            cell.dateLabel.text = CalculateChatTime.cellTime(seconds: Double(glData.tp!.seconds))
        }
        return cell
        
    }
    private func configFourPeopleCell(cell:Group4ChatListCell,gData:GroupMatchListStruct)->Group4ChatListCell{
        
        guard let sideData = gData.groupData else { return cell }
        guard let glData = sideData.GL else{ return cell }
        guard let groupData = sideData.group else { return cell }
        guard let firstUser = sideData.members?.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        guard let secondUser = sideData.members?.first(where: {$0.uid! == groupData.uid2!}) else { return cell }
        guard let thirdUser = sideData.members?.first(where: {$0.uid! == groupData.uid3!}) else { return cell }
        guard let fourthUser = sideData.members?.first(where: {$0.uid! == groupData.uid4!}) else { return cell }
        if let firstUserIm = firstUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: firstUserIm)
            cell.imgView.sd_setImage(with: url)
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
            cell.nameLabel.text = na
        }
        if let chatData = gData.chatData{
            cell.messageLabel.text = chatData.msg
            cell.dateLabel.text = CalculateChatTime.cellTime(seconds: Double(truncating: chatData.tp!))
            if let read = chatData.r, !read{
                cell.badge.isHidden = false
            }else{
                cell.badge.isHidden = true
            }
        }else{
            cell.badge.isHidden = true
            cell.messageLabel.text = "먼저 대화를 해보세요!"
            cell.dateLabel.text = CalculateChatTime.cellTime(seconds: Double(glData.tp!.seconds))
        }
        return cell
        
    }
    private func readChat(myGid:String,partnerGid:String,groupSize:Int){
        
        var ref : DatabaseReference
        if groupSize == 2 {
            ref = Database.database(url: "https://delius-46aa7-199bd.firebaseio.com/").reference().child(myId!).child(myGid).child(partnerGid)
            ref.updateChildValues(["r":true])
        }
        else if groupSize == 3{
            
            ref = Database.database(url: "https://delius-46aa7-39305.firebaseio.com/").reference().child(myId!).child(myGid).child(partnerGid)
            ref.updateChildValues(["r":true])
        }
        else{
            
            ref = Database.database(url: "https://delius-46aa7-ce17b.firebaseio.com/").reference().child(myId!).child(myGid).child(partnerGid)
            ref.updateChildValues(["r":true])
        }
    }
    
    
    
//    private func setObserve(){
//        guard let group = myGroup.groupInfo else { return }
//        guard let gid = group.gid else { return }
//        var ref:DatabaseReference
//        if group.num! == 2{
//            ref = Database.database(url: "https://delius-46aa7-199bd.firebaseio.com/").reference()
//        }else if group.num! == 3{
//            ref = Database.database(url: "https://delius-46aa7-39305.firebaseio.com/").reference()
//        }else{
//            ref = Database.database(url: "https://delius-46aa7-ce17b.firebaseio.com/").reference()
//        }
//
//        let myRef = ref.child(myId!).child(gid)
//        let chatObserver = myRef.observe(.childAdded, with: {(snapshot) in
//            let messageId = snapshot.key
//            if let chatData = snapshot.value as? [String:Any]{
//                let data = chatData.merging(["groupId":messageId]){(f,_)->Any in f}
//                let chatData = GroupChatListStruct(dictionary:data)
//                if let findItem = self.matchList[messageId]{
//                    if let find = findItem.first(where: {$0.groupData?.group?.gid! == messageId}){
//                        find.chatData = chatData
//                        self.updateTotalList(list: self.selectedList)
//                    }
//                }
//            }
//            let messageRef = myRef.child(messageId)
//            messageRef.observe(.value, with: {(Datasnapshot) in
//                if let chatChangedData = Datasnapshot.value as? [String:Any]{
//                    let data = chatChangedData.merging(["groupId":messageId]){(f,_) -> Any in f}
//                    let chatData = GroupChatListStruct(dictionary: data)
//                    if let findItem = self.matchList[messageId]{
//                        if let find = findItem.first(where: {$0.groupData?.group?.gid! == messageId}){
//                            find.chatData = chatData
//                            self.updateTotalList(list: self.selectedList)
//                        }
//                    }
//                }
//            })
//        })
//        observer.append([gid:chatObserver])
//
//    }


}
extension GroupChatVC1:UICollectionViewDelegate{
    
}
extension GroupChatVC1:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        guard let gid = currentGid else { return 0}
        guard let findItem = matchList[gid] else { return 0}
        return findItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let gid = currentGid else{ return UICollectionViewCell()}
        guard let myGroup = myGroupList.first(where: {$0.groupInfo?.gid! == gid}) else { return UICollectionViewCell()}
        guard let findItem = matchList[gid] else { return UICollectionViewCell()}
        let selected = findItem[indexPath.row]
        if myGroup.listInfo?.num! == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Group2ChatListCellid", for: indexPath) as! Group2ChatListCell
            return configTwoPeopleCell(cell: cell, gData: selected)
        }else if myGroup.listInfo?.num! == 3{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Group3ChatListCellid", for: indexPath) as! Group3ChatListCell
            return configThreePeopleCell(cell: cell, gData: selected)
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Group4ChatListCellid", for: indexPath) as! Group4ChatListCell
            return configFourPeopleCell(cell: cell, gData: selected)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:view.frame.width,height:80)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let gid = currentGid else{ return}
        guard let myGroup = myGroupList.first(where: {$0.groupInfo?.gid! == gid}) else { return }
        guard let findItem = matchList[gid] else { return }
        let selected = findItem[indexPath.row]
        if myGroup.listInfo?.num! == 2{
            self.delegate?.chatWithGroup(data: selected.groupData!, groupSize: 2, myGroup: myGroup)
            if let chatData = selected.chatData{
                self.readChat(myGid: gid, partnerGid: chatData.groupId!, groupSize: 2)
            }
        }else if myGroup.listInfo?.num! == 3{
            self.delegate?.chatWithGroup(data: selected.groupData!, groupSize: 3, myGroup: myGroup)
            if let chatData = selected.chatData{
                self.readChat(myGid: gid, partnerGid: chatData.groupId!, groupSize: 3)
            }
        }else{
            self.delegate?.chatWithGroup(data: selected.groupData!, groupSize: 4, myGroup: myGroup)
            if let chatData = selected.chatData{
                self.readChat(myGid: gid, partnerGid: chatData.groupId!, groupSize: 4)
            }
        }
        
    }
}
