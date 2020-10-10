//
//  SoloChatVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/03.
//  Copyright © 2020 정윤환. All rights reserved.
//
import Firebase
import UIKit
import FirebaseDatabase
import FirebaseAuth
import FirebaseFirestore
class SoloChatVC: UIViewController {
    
    var presentingTransition:UIViewControllerAnimatedTransitioning?
    var dismissingTransition:UIViewControllerAnimatedTransitioning?
    
    var matchArray=[SoloStruct]()
    var messageArray=[SoloListStruct]()
    var contentView:SoloSideChatView!
    var imgArray=[[String:[UIImage]]]()
    
    
    var matchList = [MainListStruct]()
    
    var totalList = [SoloMatchListStruct]()
    
    
    var delegate:SoloChatDelegate? = nil

    var ref:DatabaseReference!
    
    let myId = Auth.auth().currentUser?.uid
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.backgroundColor = .clear
        
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        contentView.chatCollectionView.reloadData()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(false)
        
    }
    func createPartner(data:MainListStruct){
        let totalData = SoloMatchListStruct(soloData: data)
        self.totalList.insert(totalData, at: 0)
        updateTotalList()
        guard let mData = data.mStruct else { return }
        guard let myId = mData.uid else { return }
        guard let partnerId = mData.pid else { return }
        let chatRef = ref.child(myId).child(partnerId)
        chatRef.observe(.value) { (DataSnapshot) in
            if let chatChangeData = DataSnapshot.value as? [String:Any]{
                let data = chatChangeData.merging(["who":partnerId]){(f,_)->Any in f}
                let chatData = SoloChatListStruct(dictionary: data)
                if let find = self.totalList.first(where: {$0.soloData?.soloStruct?.uid! == partnerId}){
                    find.chatData = chatData
                    self.updateTotalList()
                }
            }
        }
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
        
        
        contentView = SoloSideChatView()
        view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.chatCollectionView.register(SoloChatListCell.self, forCellWithReuseIdentifier: "SoloChatListCellid")
        contentView.chatCollectionView.dataSource = self
        contentView.chatCollectionView.delegate = self
    }
    func setData(user:SoloStruct){
        if let data = matchArray.first(where: {$0.uid! == user.uid!}){
            
        }else{
            matchArray.append(user)
            contentView.chatCollectionView.reloadData()
        }
    }
    func removeData(target:MStruct){
        guard let id = target.pid else { return }
        self.totalList.removeAll(where: {$0.soloData?.mStruct?.pid! == id})
        contentView.chatCollectionView.reloadData()
        
    }
    func updateTotalList(){
        totalList.sort { (f, a) -> Bool in
            if f.chatData == nil && a.chatData == nil{
                return f.soloData!.mStruct!.tp!.seconds > a.soloData!.mStruct!.tp!.seconds
            }
            else if f.chatData == nil && a.chatData != nil{
                return f.soloData!.mStruct!.tp!.seconds > Int64(truncating: a.chatData!.tp!)
            }
            else if f.chatData != nil && a.chatData == nil{
                return Int64(truncating: f.chatData!.tp!) > a.soloData!.mStruct!.tp!.seconds
            }
            else {
                return Int64(truncating: f.chatData!.tp!) > Int64(truncating: a.chatData!.tp!)
            }
        }
        contentView.chatCollectionView.reloadData()
    }
    private func setupCell(cell:SoloChatListCell,user:SoloStruct) -> SoloChatListCell{
        if let name = user.na{
            cell.nameLabel.text = name
        }
        if let im = user.im{
            CreateThumbUrl.createImageArray(uid: user.uid!, imArr: im, completion: { (imgs) in
                self.imgArray.append([user.uid!:imgs])
                cell.imgView.image = imgs[0]
                self.contentView.chatCollectionView.reloadData()
            })
        }
        if let actionTp = user.actionTp{
            
        }
        if let message = messageArray.first(where: {$0.who! == user.uid!}){
            cell.messageLabel.text = message.message!
        }
        return cell
    }
    private func configCell(cell:SoloChatListCell,tData:SoloMatchListStruct)->SoloChatListCell{
        guard let mData = tData.soloData else{ return cell}
        guard let soloData = mData.soloStruct else { return cell }
        
        if let im = soloData.im{
            let url = CreateThumbUrl.mainImgUrl(uid: soloData.uid!, imgObjs: im)
            cell.imgView.sd_setImage(with: url)
        }
        var name = ""
        if let na = soloData.na{
            name = na
        }
        if let bt = soloData.bt{
            let age = CalculateAge.returnAge(birth: bt)
            name = name + ", " + age
        }
        
        
        cell.nameLabel.text = name
        
        
        
        
        if let chatData = tData.chatData{
            if let msg = chatData.message{
                cell.messageLabel.text = msg
            }
            if let tp = chatData.tp{
                cell.dateLabel.text = CalculateChatTime.cellTime(seconds: Double(truncating: tp))
                
            }
            if let read = chatData.r, !read{
                cell.badge.isHidden = false
            }else{
                cell.badge.isHidden = true
            }
        }else{
            cell.badge.isHidden = true
            cell.messageLabel.text = "대화해보세요!"
            cell.dateLabel.text = CalculateChatTime.cellTime(seconds: Double(mData.mStruct!.tp!.seconds))
        }
        return cell
        
    }
    private func readChat(pid:String){
        let myRef = ref.child(myId!).child(pid)
        myRef.updateChildValues(["r":true])
    }
}
extension SoloChatVC:UICollectionViewDelegate{
    
}
extension SoloChatVC:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if totalList.count == 0{
            contentView.showEmptyView()
        }
        return totalList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SoloChatListCellid", for: indexPath) as! SoloChatListCell
        let data = totalList[indexPath.row]
        return configCell(cell: cell, tData: data)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let user = totalList[indexPath.row]
        guard let userTotalData = user.soloData else { return }
        guard let userData = userTotalData.soloStruct else { return }
        
        
        self.delegate?.chatWithUser(data: userData)
        if let chatData = user.chatData{
            self.readChat(pid: userData.uid!)
        }
        return;
        
    }
    
    
}

extension SoloChatVC: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}
