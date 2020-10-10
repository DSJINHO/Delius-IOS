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
class SoloChatContentVC:UIViewController,UITextFieldDelegate{
    var contentView:SoloChatContentView!
    
    var partner:SoloStruct!
    var messages = [SoloChatStruct]()
    var chatUser:UserStruct!
    
    var ref:DatabaseReference!
    var partnerRef:DatabaseReference!

    let myId = Auth.auth().currentUser?.uid
    
    var myName:String?
    
    var tap:UITapGestureRecognizer!
    var profileTap:UITapGestureRecognizer!
    var shadowTap:UITapGestureRecognizer!
    
    var delegate:SoloChatContentDelegate? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        self.delegate?.appearAnimation()
        setupKeyboardObservers()
        scrollToBottom(animation: false)
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
        
        guard let currentUser = Auth.auth().currentUser else { return }
        let uid = currentUser.uid
        let firstStr = uid.first!
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
        guard let partnerUid = chatUser.uid else { return }
        let partnerStr = partnerUid.first!
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
        
        
        
        
        contentView = SoloChatContentView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.messageCollectionView.delegate = self
        contentView.messageCollectionView.dataSource = self
        contentView.messageCollectionView.register(MySoloChatCell.self, forCellWithReuseIdentifier: "MySoloChatCellid")
        contentView.messageCollectionView.register(PartnerSoloChatCell.self, forCellWithReuseIdentifier: "PartnerSoloChatCellid")

        contentView.moreBtn.addTarget(self, action: #selector(moreBtnFunc(_:)), for: .touchUpInside)
        
        contentView.backBtn.addTarget(self, action: #selector(backBtnFunc(_:)), for: .touchUpInside)
        contentView.sendBtn.addTarget(self, action: #selector(sendBtnFunc(_:)), for: .touchUpInside)
        contentView.inputField.delegate = self
        
        contentView.messageCollectionView.keyboardDismissMode = .interactive
        
        tap = UITapGestureRecognizer()
        contentView.messageCollectionView.addGestureRecognizer(tap)
        tap.addTarget(self, action: #selector(tapFunc(_:)))
        
        profileTap = UITapGestureRecognizer(target: self, action: #selector(profileTapFunc(_:)))
        contentView.profileImgBackView.addGestureRecognizer(profileTap)
        
        shadowTap = UITapGestureRecognizer(target: self, action: #selector(shadowTapFunc(_:)))
        contentView.shadowView.addGestureRecognizer(shadowTap)
        
        obeserveMessages()
        setData()
        
    }
    
    @objc func shadowTapFunc(_ sender:UITapGestureRecognizer){
        contentView.closeWhiteView {
            self.shadowTap.isEnabled = false
        }
    }
    
    @objc func profileTapFunc(_ sender:UITapGestureRecognizer){
        self.delegate?.showProfile(userData: chatUser)
    }
    
    @objc func tapFunc(_ sender:UIButton){
        contentView.inputField.resignFirstResponder()
    }
    
    @objc func moreBtnFunc(_ sender:UIButton){
        contentView.openWhiteView(){
            self.shadowTap.isEnabled = true
        }
    }
    
    @objc func sendBtnFunc(_ sender:UIButton){
        handleFunc()
    }
    
    func obeserveMessages(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let partnerId = chatUser.uid else { return }
        let myRef = ref.child(uid).child(partnerId)
        
        myRef.observe(.childAdded, with: { (snapshot) in
            print("added")
            let messageId = snapshot.key
            let messageRef = myRef.child(messageId)
            messageRef.observeSingleEvent(of: .value, with: { ( snap ) in
                
                guard let dictionary = snap.value as? [String:AnyObject] else { return }
                let message = SoloChatStruct(dictionary: dictionary)
                self.messages.append(message)
                let currentOffset = self.contentView.messageCollectionView.contentSize.height
                let currentHeight = self.contentView.messageCollectionView.frame.height
                if currentOffset > currentHeight{
                    self.contentView.messageCollectionView.setContentOffset(CGPoint(x: 0, y:currentOffset + self.controledOffset(message: message) - currentHeight), animated: true)
                }
                self.contentView.messageCollectionView.reloadData()
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
        
        
        guard let partnerId = chatUser.uid else { return }
        
        let myRef = ref.child(myId!).child(partnerId).childByAutoId()
        let pRef = partnerRef.child(partnerId).child(myId!).childByAutoId()
        let timestamp = Int(Date().timeIntervalSince1970)
        let willUploadMyMessage : [String:Any] = ["tp":timestamp,"uid":myId!,"message":text,"name":self.myName!]
        let messageData = SoloChatStruct(dictionary: willUploadMyMessage)
        
        
        let async = DispatchGroup()
        async.enter()
        myRef.updateChildValues(willUploadMyMessage){ (err, ref) in
            async.leave()
            if err != nil{
                return
            }
        }
        async.enter()
        pRef.updateChildValues(willUploadMyMessage){ (err, ref) in
            async.leave()
            if err != nil{
                return
            }
        }
        async.notify(queue: .main, execute: {
//            let currentOffset = self.contentView.messageCollectionView.contentSize.height
//            if currentOffset > self.contentView.messageCollectionView.frame.height{
//                self.contentView.messageCollectionView.setContentOffset(CGPoint(x: 0, y: self.controledOffset(message: messageData)), animated: true)
//            }
        })
    }
    func setData(){
        if chatUser == nil{
            return
        }
        if let im = chatUser.im{
            let url = CreateThumbUrl.mainImgUrl(uid: chatUser.uid!, imgObjs: im)
            contentView.profileImgView.sd_setImage(with: url)
        }
    }
    private func controledOffset(message:SoloChatStruct) -> CGFloat{
        guard let lastChat = self.messages.last else { return 0 }
        if lastChat.uid! == myId!{
            if let text = lastChat.message{
                let height = estimateFrameForText(text).height + 14
                return height + 10
            }else{
                return 0 + 10
            }
        }else{
            if messages.count > 0{
                let formerMessage = messages[messages.count - 2]
                if formerMessage.uid! == lastChat.uid!{
                    if let text = lastChat.message{
                        let height = estimateFrameForText(text).height + 14
                        return height + 10
                    }else{
                        return 0 + 10
                    }
                }else{
                    if let text = lastChat.message{
                        let height = estimateFrameForText(text).height + 40
                        return height + 10
                    }else{
                        return 0 + 10
                    }
                }
            }else{
                if let text = lastChat.message{
                    let height = estimateFrameForText(text).height + 40
                    return height + 10
                }else{
                    return 0 + 10
                }
            }
        }
    }
    @objc func backBtnFunc(_ sender:UIButton){
        self.dismiss(animated: true, completion: {})
    }
    
    func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func scrollToBottom(animation:Bool){
        let offset = contentView.messageCollectionView.contentSize.height - contentView.messageCollectionView.frame.height
        if offset < 0 {
            return
        }
        print("AAAA",contentView.messageCollectionView.frame.height)
        print("AAAA",contentView.messageCollectionView.contentSize.height)
        contentView.messageCollectionView.contentOffset.y = offset
    }
    
    @objc func handleKeyboardWillHide(_ notification: Notification) {
        let keyboardDuration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue
        
        contentView.nsBtm.constant = 0
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
extension SoloChatContentVC:UICollectionViewDelegate{
    
}
extension SoloChatContentVC:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let message = messages[indexPath.row]
        if message.uid! == myId{

            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MySoloChatCellid", for: indexPath) as! MySoloChatCell
            

            let currentTp = CalculateChatTime.CalculateChatTime(seconds: message.tp as! Double)
            if let text = message.message{
                myCell.textLabel.text = text
                myCell.nsLeft.constant = -estimateFrameForText(text).width-30
                myCell.tpLabel.text = currentTp
            }
            if indexPath.row < messages.count - 1 {
                
                let afterMessage = messages[indexPath.row + 1]
                if afterMessage.uid! == myId{
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

            return myCell
        }else{
            let partnerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PartnerSoloChatCellid", for: indexPath) as! PartnerSoloChatCell
            
            if let im = chatUser.im{
                let url = CreateThumbUrl.mainImgUrl(uid: chatUser.uid!, imgObjs: im)
                partnerCell.profileImgView.sd_setImage(with: url)
            }
            let currentTp = CalculateChatTime.CalculateChatTime(seconds: message.tp as! Double)
            if let text = message.message{
                partnerCell.textLabel.text = text
                partnerCell.nsRight.constant = estimateFrameForText(text).width+30
                partnerCell.tpLabel.text = currentTp
                partnerCell.nameLabel.text = chatUser.na!
            }
            if indexPath.row < messages.count - 1 {
                let afterMessage = messages[indexPath.row + 1]
                if afterMessage.uid! == message.uid{
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
                if formerMessage.uid! == message.uid{
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
        if message.uid! == myId!{
            if let text = messages[indexPath.row].message{
                height = estimateFrameForText(text).height + 14
            }
            return CGSize(width: collectionView.frame.width, height: height)
        }else{
            if indexPath.row > 0 {
                let formerMessage = messages[indexPath.row - 1]
                if formerMessage.uid! == message.uid{
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
