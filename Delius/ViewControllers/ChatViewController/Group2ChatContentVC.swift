//
//  SoloChatVC.swift
//  Delius
//
//  Created by 박진호 on 2020/07/03.
//  Copyright © 2020 정윤환. All rights reserved.
//
import Firebase
import FirebaseAuth
import FirebaseDatabase
import UIKit
class Group2ChatContentVC:UIViewController,UITextFieldDelegate{
    var contentView:Group2ChatContentView!
    
    var messages = [GroupChatStruct]()
    var partnerGroup : SideGroupStruct?
    var myGroup : MyGroupListStruct?
    
    var ref:DatabaseReference!
    var partnerRef:DatabaseReference!

    let myId = Auth.auth().currentUser?.uid
    
    var delegate:GroupChatContentDelegate? = nil
    
    var tap:UITapGestureRecognizer!
    var profileTap:UITapGestureRecognizer!
    var shadowTap:UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        setupKeyboardObservers()
        scrollToBottom(animation: false)
        self.delegate?.showGroupChat()
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    override var canBecomeFirstResponder : Bool {
        return true
    }
    private func setup(){
        let arr1 = ["A","B","C","D","E","F","G","H","I"]
        let arr2 = ["J","K","L","M","N","O","P","Q","R"]
        let arr3 = ["S","T","U","V","W","X","Y","Z","0"]
        let arr4 = ["1","2","3","4","5","6","7","8","9"]
        
        guard let currentGroup = myGroup else { return }
        guard let myGid = currentGroup.groupInfo?.gid else { return }
        let firstStr = myGid.first!
        let str = firstStr.uppercased()
        if arr1.contains(str){
            ref = Database.database(url: "https://delius-46aa7-da4dc.firebaseio.com/").reference()
        }else if arr2.contains(str){
            ref = Database.database(url: "https://delius-46aa7-e14a5.firebaseio.com/").reference()
            
        }else if arr3.contains(str){
            ref = Database.database(url: "https://delius-46aa7-eb111.firebaseio.com/").reference()
            
        }else{
            ref = Database.database(url: "https://delius-46aa7-fef51.firebaseio.com/").reference()
            
        }
        guard let pGroup = partnerGroup else { return }
        guard let pGid = pGroup.group?.gid else { return }
        let partnerStr = pGid.first!
        let pStr = partnerStr.uppercased()
        if arr1.contains(pStr){
            partnerRef = Database.database(url: "https://delius-46aa7-da4dc.firebaseio.com/").reference()
        }else if arr2.contains(pStr){
            partnerRef = Database.database(url: "https://delius-46aa7-e14a5.firebaseio.com/").reference()
        }else if arr3.contains(pStr){
            partnerRef = Database.database(url: "https://delius-46aa7-eb111.firebaseio.com/").reference()
        }else{
            partnerRef = Database.database(url: "https://delius-46aa7-fef51.firebaseio.com/").reference()
        }
        
        contentView = Group2ChatContentView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.messageCollectionView.delegate = self
        contentView.messageCollectionView.dataSource = self
        contentView.messageCollectionView.register(MyGroupChatCell.self, forCellWithReuseIdentifier: "MyGroupChatCellid")
        contentView.messageCollectionView.register(PartnerGroupChatCell.self, forCellWithReuseIdentifier: "PartnerGroupChatCellid")

        contentView.sendBtn.addTarget(self, action: #selector(sendBtnFunc(_:)), for: .touchUpInside)
        contentView.inputField.delegate = self
        
        contentView.messageCollectionView.keyboardDismissMode = .interactive
        tap = UITapGestureRecognizer()
        contentView.messageCollectionView.addGestureRecognizer(tap)
        tap.addTarget(self, action: #selector(tapFunc(_:)))
        
        profileTap = UITapGestureRecognizer(target: self, action: #selector(profileTapFunc(_:)))
        contentView.profileTapView.addGestureRecognizer(profileTap)
        
        shadowTap = UITapGestureRecognizer(target: self, action: #selector(shadowTapFunc(_:)))
        contentView.shadowView.addGestureRecognizer(shadowTap)
        
        contentView.moreBtn.addTarget(self, action: #selector(moreBtnFunc(_:)), for: .touchUpInside)
        
        
        obeserveMessages()
        
    }
    @objc func tapFunc(_ sender:UIButton){
        contentView.inputField.resignFirstResponder()
    }
    @objc func profileTapFunc(_ sender:UITapGestureRecognizer){
        guard let groupSize = myGroup?.groupInfo?.num else { return }
        guard let partner = partnerGroup else{ return }
        self.delegate?.showProfile(groupData: partner, groupSize: groupSize)
    }
    @objc func shadowTapFunc(_ sender:UITapGestureRecognizer){
        self.contentView.closeWhiteView(){
            self.shadowTap.isEnabled = false
        }
    }
    @objc func moreBtnFunc(_ sender:UIButton){
        self.contentView.openWhiteView(){
            self.shadowTap.isEnabled = true
        }
    }
    @objc func sendBtnFunc(_ sender:UIButton){
        
        handleFunc()
    }
    func obeserveMessages(){
        guard let myGid = myGroup?.listInfo?.id else { return }
        guard let partnerId = partnerGroup?.GL?.targetid else { return }
        print("TARGETID",partnerId)
        let myRef = ref.child(myGid).child(partnerId)
        
        myRef.observe(.childAdded, with: { (snapshot) in
            let messageId = snapshot.key
            let messageRef = myRef.child(messageId)
            messageRef.observeSingleEvent(of: .value, with: { ( snap ) in
                
                guard let dictionary = snap.value as? [String:AnyObject] else { return }
                let message = GroupChatStruct(dictionary: dictionary)
                print(dictionary)
                self.messages.append(message)
                self.contentView.messageCollectionView.reloadData()
                self.scrollToBottom(animation: true)
            }, withCancel: nil)
        }, withCancel: nil)
    }
    func setupDB(){
        
    }
    func handleFunc(){
        
        if contentView.inputField.text == nil || contentView.inputField.text == ""{
            return
        }
        let text = contentView.inputField.text!
        contentView.inputField.text = nil
        
        
        guard let partnerId = partnerGroup?.GL?.targetid else { return }
        guard let myGid = myGroup?.listInfo?.id else { return }
        guard let uids = myGroup?.listInfo?.uids else { return }
        guard let pids = partnerGroup?.GL?.uids else { return }
        guard let myGroupName = myGroup?.groupInfo?.na else{ return }
        guard let myData = myGroup?.memberInfo?.first(where: {$0.uid! == myId}) else { return }
        let myRef = ref.child(myGid).child(partnerId).childByAutoId()
        let pRef = partnerRef.child(partnerId).child(myGid).childByAutoId()
        let timestamp = Int(Date().timeIntervalSince1970)
        let willUploadMyMessage : [String:Any] = ["gid":myGid,"message":text,"uids":uids,"tp":timestamp,"gn":myGroupName,"sn":myData.na!,"su":myId!]
        let willUploadPartnerMessage : [String:Any] = ["gid":myGid,"message":text,"uids":pids,"tp":timestamp,"gn":myGroupName,"sn":myData.na!,"su":myId!]
        
        let async = DispatchGroup()
        async.enter()
        myRef.updateChildValues(willUploadMyMessage){ (err, ref) in
            async.leave()
            if err != nil{
                return
            }
        }
        async.enter()
        pRef.updateChildValues(willUploadPartnerMessage){ (err, ref) in
            async.leave()
            if err != nil{
                return
            }
        }
        async.notify(queue: .main, execute: {

        })
    }
    func setData(data:SideGroupStruct,myGroup:MyGroupListStruct){
        self.partnerGroup = data
        self.myGroup = myGroup
        guard let groupData = data.group else { return }
        guard let memberData = data.members else { return }
        guard let user1 = memberData.first(where: {$0.uid! == groupData.uid1!}) else { return }
        guard let user2 = memberData.first(where: {$0.uid! == groupData.uid2!}) else { return }
        if let im = user1.im{
            let url = CreateThumbUrl.mainImgUrl(uid: user1.uid!, imgObjs: im)
            contentView.imgView1.sd_setImage(with: url)
        }
        if let im = user2.im{
            let url = CreateThumbUrl.mainImgUrl(uid: user2.uid!, imgObjs: im)
            contentView.imgView2.sd_setImage(with: url)
        }
    }
    
    func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print(messages.count)
        return true
    }
    func scrollToBottom(animation:Bool){
        let offset = contentView.messageCollectionView.contentSize.height - contentView.messageCollectionView.frame.height
        if offset < 0 {
            return
        }
        contentView.messageCollectionView.contentOffset.y = offset
    }
    
    @objc func handleKeyboardWillHide(_ notification: Notification) {
        let keyboardDuration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue
        
        contentView.nsBtm.constant = 0
//        scrollToBottom(animation: true)
        UIView.animate(withDuration: keyboardDuration!, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @objc func handleKeyboardWillShow(_ notification: Notification) {
        let window = UIApplication.shared.windows[0]
        let btmPadding = window.safeAreaInsets.bottom
        let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
        let keyboardDuration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue
        
        var offset = contentView.messageCollectionView.contentSize.height - contentView.messageCollectionView.frame.height + keyboardFrame!.height
        if offset < 0{
           offset = 0
        }
        contentView.nsBtm.constant = -keyboardFrame!.height + btmPadding
        scrollToBottom(animation: true)
        UIView.animate(withDuration: keyboardDuration!, animations: {
            self.contentView.messageCollectionView.contentOffset = CGPoint(x:0,y:offset)
            self.view.layoutIfNeeded()
        })
    }
    
    fileprivate func estimateFrameForText(_ text: String) -> CGRect {
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: text).boundingRect(with: size, options: options, attributes: convertToOptionalNSAttributedStringKeyDictionary([convertFromNSAttributedStringKey(NSAttributedString.Key.font): UIFont.systemFont(ofSize: 14)]), context: nil)
    }
    
}
extension Group2ChatContentVC:UICollectionViewDelegate{
    
}
extension Group2ChatContentVC:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let message = messages[indexPath.row]
        let myGid = myGroup?.listInfo?.id
        if message.gid == myGid{

            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyGroupChatCellid", for: indexPath) as! MyGroupChatCell

            let currentTp = CalculateChatTime.CalculateChatTime(seconds: message.tp as! Double)
            if let text = message.message{
                myCell.textLabel.text = text
                myCell.nsLeft.constant = -estimateFrameForText(text).width-30
                myCell.tpLabel.text = currentTp
            }
            if message.senderUid == myId{
                myCell.backView.backgroundColor = UIColor.MainColor()
                myCell.nameLabel.text = "나"
            }else{
                if let sender = myGroup?.memberInfo?.first(where: {$0.uid! == message.senderUid}){
                    myCell.nameLabel.text = sender.na!
                }
            }
            if indexPath.row < messages.count - 1 {
                
                let afterMessage = messages[indexPath.row + 1]
                if afterMessage.gid! == myGid{
                    let afterTP = CalculateChatTime.CalculateChatTime(seconds: afterMessage.tp as! Double)
                    if afterTP == currentTp{
                        myCell.tpLabel.isHidden = true
                    }else{
                        myCell.tpLabel.isHidden = false
                    }
                }else{
                    myCell.tpLabel.isHidden = false
                }
            }else{
                myCell.tpLabel.isHidden = false
            }
            
            if indexPath.row > 0 {
                let formerMessage = messages[indexPath.row - 1]
                if formerMessage.senderUid! == message.senderUid{
                    myCell.nsTop1?.isActive = true
                    myCell.nsTop2?.isActive = false
                    myCell.nameLabel.isHidden = true
                }else{
                    myCell.nsTop1?.isActive = false
                    myCell.nsTop2?.isActive = true
                    myCell.nameLabel.isHidden = false
                }
                
            }else{

                myCell.nsTop1?.isActive = false
                myCell.nsTop2?.isActive = true
                myCell.nameLabel.isHidden = false
            }
            

            return myCell
        }else{
            let partnerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PartnerGroupChatCellid", for: indexPath) as! PartnerGroupChatCell
            if let sender = partnerGroup?.members?.first(where: {$0.uid! == message.senderUid}){
                if let im = sender.im{
                    let url = CreateThumbUrl.mainImgUrl(uid: sender.uid!, imgObjs: im)
                    partnerCell.profileImgView.sd_setImage(with: url)
                    partnerCell.nameLabel.text = sender.na!
                }
            }
            let currentTp = CalculateChatTime.CalculateChatTime(seconds: message.tp as! Double)
            if let text = message.message{
                partnerCell.textLabel.text = text
                partnerCell.nsRight.constant = estimateFrameForText(text).width+30
                partnerCell.tpLabel.text = currentTp
            }
            if indexPath.row < messages.count - 1 {
                let afterMessage = messages[indexPath.row + 1]
                if afterMessage.gid! == message.gid{
                    let afterTP = CalculateChatTime.CalculateChatTime(seconds: afterMessage.tp as! Double)
                    
                    if afterTP == currentTp{
                        partnerCell.tpLabel.isHidden = true
                    }else{
                        partnerCell.tpLabel.isHidden = false
                    }
                }else{
                    partnerCell.tpLabel.isHidden = false
                }
            }else{
                partnerCell.tpLabel.isHidden = false
            }
            if indexPath.row > 0 {
                let formerMessage = messages[indexPath.row - 1]
                if formerMessage.senderUid! == message.senderUid{
                    partnerCell.nsTop1?.isActive = true
                    partnerCell.nsTop2?.isActive = false
                    partnerCell.profileImgView.isHidden = true
                    partnerCell.nameLabel.isHidden = true
                }else{
                    partnerCell.nsTop1?.isActive = false
                    partnerCell.nsTop2?.isActive = true
                    partnerCell.profileImgView.isHidden = false
                    partnerCell.nameLabel.isHidden = false
                }
                
            }else{

                partnerCell.nsTop1?.isActive = false
                partnerCell.nsTop2?.isActive = true
                partnerCell.profileImgView.isHidden = false
                partnerCell.nameLabel.isHidden = false
            }
            return partnerCell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height : CGFloat = 34
        
        let message = messages[indexPath.row]
        let myGid = myGroup?.groupInfo?.gid!
        if message.gid! == myGid!{
            if indexPath.row > 0 {
                let formerMessage = messages[indexPath.row - 1]
                if formerMessage.senderUid! == message.senderUid{
                    if let text = messages[indexPath.row].message{
                        height = estimateFrameForText(text).height + 14
                    }
                    return CGSize(width: collectionView.frame.width, height: height)
                }else{
                    if let text = messages[indexPath.row].message{
                        height = estimateFrameForText(text).height + 40
                    }
                    return CGSize(width: collectionView.frame.width, height: height)
                }
            }else{
                if let text = messages[indexPath.row].message{
                    height = estimateFrameForText(text).height + 40
                }
                return CGSize(width: collectionView.frame.width, height: height)
            }
        }else{
            if indexPath.row > 0 {
                let formerMessage = messages[indexPath.row - 1]
                if formerMessage.senderUid! == message.senderUid{
                    if let text = messages[indexPath.row].message{
                        height = estimateFrameForText(text).height + 14
                    }
                    return CGSize(width: collectionView.frame.width, height: height)
                }else{
                    if let text = messages[indexPath.row].message{
                        height = estimateFrameForText(text).height + 40
                    }
                    return CGSize(width: collectionView.frame.width, height: height)
                }
            }else{
                if let text = messages[indexPath.row].message{
                    height = estimateFrameForText(text).height + 40
                }
                return CGSize(width: collectionView.frame.width, height: height)
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
    guard let input = input else { return nil }
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
    return input.rawValue
}

