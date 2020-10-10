//
//  Tab0ServiceCode.swift
//  Delius
//
//  Created by user on 2020/08/13.
//  Copyright © 2020 정윤환. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import FirebaseFunctions

class Tab0ServiceCode{
    var db:Firestore!
    var functions:Functions
    var userSex:Bool?
    var myGroups=[MyGroupListStruct]()
    var cashItem:CashItemStruct!
    var userInfo:UserStruct!
    
    var vc:Tab0VC?
    
    var delegate:Tab0ServiceDelegate!
    
    var soloMatchController:SoloMatchViewController!
    var reportVC:ReportViewController!
    var noGroupVC:NoGroupListVC!
    var chooseMyGroupVC:ChooseMyGroupVC!
    
    var likeEmptyVC:EmptyLikeAlertVC!
    var deliEmptyVC:EmptyDeliAlertVC!
    
    
    init(sx:Bool,viewController:Tab0VC) {
        db = Firestore.firestore()
        functions = Functions.functions()
        
        userSex = sx
        
        vc = viewController
    }
    func updateMyGroups(myGroups:[MyGroupListStruct]){
        self.myGroups = myGroups
    }
    func updateMyCashItem(cashItem:CashItemStruct){
        self.cashItem = cashItem
    }
    func updateMyUserData(userData:UserStruct){
        self.userInfo = userData
    }
    
    
    func checkPlusUser()->Bool{
        guard let user = self.userInfo else { return false }
        guard let isPlus = user.ind2 else { return false }
        return isPlus
    }
    func checkUserCash(index:Int) -> Bool{
        guard let userCash = cashItem else { return false }
        if index == 300{
            guard let like = userCash.like else { return false }
            if like == 0{
                let controller = ShowEmptyLikeAVC(viewController: vc!)
                controller.ShowIndicator()
                return false
            }else{
                return true
            }
        }else{
            guard let deli = userCash.deli else {return false }
            guard let deli2 = userCash.deli2 else { return false }
            if deli == 0 && deli2 == 0{
                let controller = ShowEmptyDeliAVC(viewController: vc!, cashItem: self.cashItem!)
                controller.ShowIndicator()
                return false
            }else{
                return true
            }
        }
    }
    func checkLastItem(){
        
    }
    
    func passSolo(targetUid:String){ // noCallBack
        guard let currentUser = Auth.auth().currentUser else { return }
        let ref = db.collection("mlist").document(currentUser.uid).collection("mmlist").document(targetUid)
        let updateData : [String:Any] = ["in1":200,"tp":FieldValue.serverTimestamp()]
        ref.updateData(updateData)
    }
    func reportSolo(targetUid:String,reportType:Int){
        guard let currentUser = Auth.auth().currentUser else { return }
        let ref = db.collection("mlist").document(currentUser.uid).collection("mmlist").document(targetUid)
        let updateData : [String:Any] = ["in1":reportType,"tp":FieldValue.serverTimestamp()]
        ref.updateData(updateData)
    }
    func passGroup(partnerGid:String){
        guard let currentUser = Auth.auth().currentUser else { return }
        let ref = db.collection("mlist").document(currentUser.uid).collection("mmlist").document(partnerGid)
        let updateData : [String:Any] = ["in1":200,"tp":FieldValue.serverTimestamp()]
        ref.updateData(updateData)
    }
    func reportGroup(partnerGid:String,reportType:Int){
        guard let currentUser = Auth.auth().currentUser else { return }
        let ref = db.collection("mlist").document(currentUser.uid).collection("mmlist").document(partnerGid)
        let updateData:[String:Any] = ["in1":reportType,"tp":FieldValue.serverTimestamp()]
        ref.updateData(updateData)
    }
    
    func sendSoloLike(targetUid:String,completion:@escaping(String)->Void={_ in }){
        let requestData : [String:Any] = ["targetUid":targetUid,"sx":userSex!]
        functions.httpsCallable("SoloSendLike").call(requestData){ (result,err ) in
            if err != nil{
                completion("internalError")
                return
            }
            if let resultObj = result?.data as? [String:Any]{
                if let type = resultObj["type"] as? String{
                    if type == "noCash"{
                        completion("noCash")
                    }
                    if type == "success"{
                        completion("success")
                    }
                    if type == "error"{
                        completion("error")
                    }
                }
            }
        }
    }
    func sendSoloDeli(targetUid:String,completion:@escaping(String)->Void={_ in }){
        let requestData:[String:Any] = ["targetUid":targetUid]
        functions.httpsCallable("SoloSendDeli").call(requestData){ (result,err) in
            if err != nil{
                completion("internalError")
                return
            }
            if let resultObj = result?.data as? [String:Any]{
                if let type = resultObj["type"] as? String{
                    if type == "noCash"{
                        completion("noCash")
                    }
                    if type == "success"{
                        completion("success")
                    }
                    if type == "error"{
                        completion("error")
                    }
                }
            }
        }
    }
    func onCallGroupSendLike(myGid:String,partnerGid:String,myUids:[String],pUids:[String],completion:@escaping(String)->Void={_ in}){
        let requestData:[String:Any] = ["mySex":userSex!,"myGid":myGid,"partnerGid":partnerGid,"mUids":myUids,"pUids":pUids]
        functions.httpsCallable("GroupSendLike").call(requestData){(result, err) in
            if err != nil{
                completion("internalError")
                return
            }
            if let resultObj = result?.data as? [String:Any]{
                if let type = resultObj["type"] as? String{
                    completion(type)
                }
            }
        }
    }

    func onCallGroupSendDeli(myGid:String,partnerGid:String,myUids:[String],pUids:[String],completion:@escaping(String)->Void={_ in}){
        let requestData:[String:Any] = ["myGid":myGid,"partnerGid":partnerGid,"mUids":myUids,"pUids":pUids]
        functions.httpsCallable("GroupSendDeli").call(requestData){(result,err) in
            if err != nil{
                completion("internalError")
                return
            }
            if let resultObj = result?.data as? [String:Any]{
                if let type = resultObj["type"] as? String {
                    completion(type)
                }
            }
            
        }
    }
    func onCallGroupSendReport(){
        let requestData:[String:Any] = ["asdf":1]
        functions.httpsCallable("GroupReport").call(requestData){(result,err) in
            if err != nil{
                
            }
        }
    }
    
    
    
    func action(target:MainListStruct,index:Int,completion:@escaping(_ paging:Bool)->Void){
        
        guard let data = target.mStruct else { return }
        if data.type == 101{
            guard let soloData = target.soloStruct else { return }
            if index == 200{
                actionPassSolo(targetUid: soloData.uid!, completion: {
                    completion(true)
                })
            }
            if index == 300{
                actionLikeSolo(target: target){(isPaging) in
                    if isPaging{
                        completion(true)
                    }else{
                        completion(false)
                    }
                }
            }
            if index == 400{
                actionDeliSolo(target: target) { (isPaging) in
                    if isPaging{
                        completion(true)
                    }else{
                        completion(false)
                    }
                }
            }
            if index >= 701 && index <= 704{
                
            }
        }
        if data.type == 201{
            guard let groupData = target.groupStruct else { return }
            if index == 200{
                actionPassGroup(target: target) { (isPaging) in
                    if isPaging{
                        completion(true)
                    }else{
                        completion(false)
                    }
                }
            }
            if index == 300{
                actionLikeGroup(target: target) { (isPaging) in
                    if isPaging{
                        completion(true)
                    }else{
                        completion(false)
                    }
                }
            }
            if index == 400{
                actionDeliGroup(target: target) { (isPaging) in
                    if isPaging{
                        completion(true)
                    }else{
                        completion(false)
                    }
                }
            }
            if index >= 701 && index <= 704{
                
            }
        }
    }
    private func actionPassSolo(targetUid:String,completion:@escaping()->Void){
        self.passSolo(targetUid: targetUid)
        completion()
    }
    private func actionLikeSolo(target:MainListStruct,completion:@escaping(_ paging:Bool)->Void={_ in }){
        
        guard let data = target.mStruct else { return }
        guard let soloData = target.soloStruct else { return }
        if data.in2 == 300 || data.in2 == 400{
            soloMatchController = SoloMatchViewController()
            soloMatchController .userData = target
            vc!.view.addSubview(soloMatchController .view)
            soloMatchController .view.topAnchor.constraint(equalTo: vc!.view.topAnchor).isActive = true
            soloMatchController .view.leftAnchor.constraint(equalTo: vc!.view.leftAnchor).isActive = true
            soloMatchController .view.rightAnchor.constraint(equalTo: vc!.view.rightAnchor).isActive = true
            soloMatchController .view.bottomAnchor.constraint(equalTo: vc!.view.bottomAnchor).isActive = true
            self.sendSoloLike(targetUid: soloData.uid!) { (result) in
                if result == "internalError"{
                    self.soloMatchController.closeAnimation {
                        completion(false)
                    }
                    return
                }
                if result == "noCash"{
                    self.soloMatchController.closeAnimation {
                        let controller = ShowEmptyLikeAVC(viewController: self.vc!)
                        controller.ShowIndicator()
                        completion(false)
                    }
                    return
                }
                if result == "success"{
                    self.soloMatchController.contentView.matchAnimation()
                    completion(true)
                    return
                }
            }
        }
        if data.in2 != 300 && data.in2 != 400{
            self.sendSoloLike(targetUid: soloData.uid!)
            completion(true)
        }
    }
    private func actionDeliSolo(target:MainListStruct,completion:@escaping(_ paging:Bool)->Void){
        
        guard let data = target.mStruct else { return }
        guard let soloData = target.soloStruct else { return }
        if data.in2 == 300 || data.in2 == 400{
            soloMatchController = SoloMatchViewController()
            soloMatchController .userData = target
            vc!.view.addSubview(soloMatchController .view)
            soloMatchController .view.topAnchor.constraint(equalTo: vc!.view.topAnchor).isActive = true
            soloMatchController .view.leftAnchor.constraint(equalTo: vc!.view.leftAnchor).isActive = true
            soloMatchController .view.rightAnchor.constraint(equalTo: vc!.view.rightAnchor).isActive = true
            soloMatchController .view.bottomAnchor.constraint(equalTo: vc!.view.bottomAnchor).isActive = true
            soloMatchController.contentView.closeBtn.addTarget(self, action: #selector(soloMatchCloseBtnFunc(_:)), for: .touchUpInside)
            self.sendSoloDeli(targetUid: soloData.uid!) { (result) in
                if result == "internalError"{
                    self.soloMatchController.closeAnimation {
                        completion(false)
                    }
                    return
                }
                if result == "noCash"{
                    self.soloMatchController.closeAnimation {
                        let controller = ShowEmptyLikeAVC(viewController: self.vc!)
                        controller.ShowIndicator()
                        completion(false)
                    }
                    return
                }
                if result == "success"{
                    self.soloMatchController.contentView.matchAnimation()
                    completion(false)
                    return
                }
            }
        }
        if data.in2 != 300 && data.in2 != 400{
            self.sendSoloDeli(targetUid: soloData.uid!)
            completion(true)
        }
        
    }
    private func actionReportSolo(target:MainListStruct){
        guard let soloData = target.soloStruct else { return }
        reportVC = ReportViewController()
        vc!.view.addSubview(reportVC.view)
        reportVC.view.topAnchor.constraint(equalTo: vc!.view.topAnchor).isActive = true
        reportVC.view.leftAnchor.constraint(equalTo: vc!.view.leftAnchor).isActive = true
        reportVC.view.rightAnchor.constraint(equalTo: vc!.view.rightAnchor).isActive = true
            reportVC.view.bottomAnchor.constraint(equalTo: vc!.view.bottomAnchor).isActive = true
        
        reportVC.targetUid = soloData.uid!
        reportVC.contentview.reportBtn.addTarget(self, action: #selector(reportSoloBtnFunc(_:)), for: .touchUpInside)
        
    }
    private func actionPassGroup(target:MainListStruct,completion:@escaping(_ paging:Bool)->Void){
        guard let groupData = target.groupStruct else { return }
        self.passGroup(partnerGid: groupData.gid!)
        completion(true)
    }
    private func actionLikeGroup(target:MainListStruct,completion:@escaping(_ paging:Bool)->Void){
        guard let data = target.mStruct else { return }
        let groupSize = data.num!
        let myGroupList = myGroups.filter({$0.groupInfo?.num! == groupSize})
        if myGroupList.count == 0 {
            noGroupVC = NoGroupListVC()
            vc!.view.addSubview(noGroupVC.view)
            noGroupVC.view.topAnchor.constraint(equalTo: vc!.view.topAnchor).isActive = true
            noGroupVC.view.leftAnchor.constraint(equalTo: vc!.view.leftAnchor).isActive = true
            noGroupVC.view.rightAnchor.constraint(equalTo: vc!.view.rightAnchor).isActive = true
            noGroupVC.view.bottomAnchor.constraint(equalTo: vc!.view.bottomAnchor).isActive = true
            completion(false)
        }else if myGroupList.count == 1{
            guard let myGroupData = myGroupList[0].listInfo else { return }
            guard let partnerGroupData = target.mStruct else { return }
            let myGid = myGroupData.id!
            let parGid = partnerGroupData.pid!
            let myUids = myGroupData.uids!
            let pUids = partnerGroupData.pids!
            self.onCallGroupSendLike(myGid: myGid, partnerGid: parGid, myUids: myUids, pUids: pUids)
            completion(true)
        }else{
            guard let myGroupData = myGroupList[0].listInfo else { return }
            guard let partnerGroupData = target.mStruct else { return }
            chooseMyGroupVC = ChooseMyGroupVC()
            chooseMyGroupVC.myGroupList = myGroupList
            chooseMyGroupVC.myUids = myGroupData.uids!
            chooseMyGroupVC.partnerUids = partnerGroupData.pids!
            chooseMyGroupVC.partnerGid = partnerGroupData.pid!
            chooseMyGroupVC.isLike = true
            vc!.view.addSubview(chooseMyGroupVC.view)
            chooseMyGroupVC.view.topAnchor.constraint(equalTo: vc!.view.topAnchor).isActive = true
            chooseMyGroupVC.view.leftAnchor.constraint(equalTo: vc!.view.leftAnchor).isActive = true
            chooseMyGroupVC.view.rightAnchor.constraint(equalTo: vc!.view.rightAnchor).isActive = true
            chooseMyGroupVC.view.bottomAnchor.constraint(equalTo: vc!.view.bottomAnchor).isActive = true
            
            chooseMyGroupVC.contentView.sendBtn.addTarget(self, action: #selector(groupSelectBtnFunc(_:)), for: .touchUpInside)
            completion(false)
        }
        
    }
    private func actionDeliGroup(target:MainListStruct,completion:@escaping(_ paging:Bool)->Void){
        guard let data = target.mStruct else { return }
        let groupSize = data.num!
        let myGroupList = myGroups.filter({$0.groupInfo?.num! == groupSize})
        if myGroupList.count == 0 {
            noGroupVC = NoGroupListVC()
            vc!.view.addSubview(noGroupVC.view)
            noGroupVC.view.topAnchor.constraint(equalTo: vc!.view.topAnchor).isActive = true
            noGroupVC.view.leftAnchor.constraint(equalTo: vc!.view.leftAnchor).isActive = true
            noGroupVC.view.rightAnchor.constraint(equalTo: vc!.view.rightAnchor).isActive = true
            noGroupVC.view.bottomAnchor.constraint(equalTo: vc!.view.bottomAnchor).isActive = true
            completion(false)
        }else if myGroupList.count == 1{
            guard let myGroupData = myGroupList[0].listInfo else { return }
            guard let partnerGroupData = target.mStruct else { return }
            let myGid = myGroupData.id!
            let parGid = partnerGroupData.pid!
            let myUids = myGroupData.uids!
            let pUids = partnerGroupData.pids!
            self.onCallGroupSendDeli(myGid: myGid, partnerGid: parGid, myUids: myUids, pUids: pUids)
            completion(true)
        }else{
            chooseMyGroupVC = ChooseMyGroupVC()
            chooseMyGroupVC.myGroupList = myGroupList
            chooseMyGroupVC.isLike = false
            vc!.view.addSubview(chooseMyGroupVC.view)
            chooseMyGroupVC.view.topAnchor.constraint(equalTo: vc!.view.topAnchor).isActive = true
            chooseMyGroupVC.view.leftAnchor.constraint(equalTo: vc!.view.leftAnchor).isActive = true
            chooseMyGroupVC.view.rightAnchor.constraint(equalTo: vc!.view.rightAnchor).isActive = true
            chooseMyGroupVC.view.bottomAnchor.constraint(equalTo: vc!.view.bottomAnchor).isActive = true
            
            
            completion(false)
        }
    }
    private func actionReportGroup(){
        
    }
    @objc func reportSoloBtnFunc(_ sender:UIButton){
        if let typeValue = reportVC.type{
            if let reportedUid = reportVC.targetUid{
                reportSolo(targetUid: reportedUid, reportType: typeValue)
                reportVC.closeAnimation {
                    self.delegate.pagingRight()
                }
            }
        }
    }
    @objc func soloMatchCloseBtnFunc(_ sender:UIButton){
        soloMatchController.closeAnimation {
            self.delegate.pagingRight()
        }
    }
    @objc func groupSelectBtnFunc(_ sender:UIButton){
        guard let myGid = chooseMyGroupVC.selectedGid else {return}
        guard let pGid = chooseMyGroupVC.partnerGid else { return }
        guard let myUids = chooseMyGroupVC.myUids else { return }
        guard let pUids = chooseMyGroupVC.partnerUids else { return }
        onCallGroupSendLike(myGid: myGid, partnerGid: pGid, myUids: myUids, pUids: pUids)
        chooseMyGroupVC.contentView.closeAnimation {
            self.chooseMyGroupVC.dismiss(animated: false, completion: {
                self.chooseMyGroupVC.removeFromParent()
                self.chooseMyGroupVC.view.removeFromSuperview()
                self.delegate.pagingRight()
            })
        }
    }
    

    
    
    
    
    func CheckLikeCount()->Bool{
        guard let userCash = cashItem else { return false }
        guard let like = userCash.like else { return false}
        if like <= 0{
            return false
        }else{
            return true
        }
    }
    func CheckDeliCount()->Bool{
        guard let userCash = cashItem else{ return false }
        guard let deli = userCash.deli else { return false }
        guard let deli2 = userCash.deli2 else { return false }
        if deli <= 0 && deli2 <= 0{
            return false
        }else{
            return true
        }
    }
    func Solo200(uid:String){
        self.passSolo(targetUid: uid)
    }
    func Solo300(uid:String,completion:@escaping(String)->Void={_ in }){
        self.sendSoloLike(targetUid: uid, completion: {resultStr in
            completion(resultStr)
        })
    }
    func Solo400(uid:String,completion:@escaping(String)->Void={_ in }){
        self.sendSoloDeli(targetUid: uid) { (resultStr) in
            completion(resultStr)
        }
    }
    func SoloReport(uid:String,index:Int){
        
    }
    func Group200(gid:String){
        self.passGroup(partnerGid: gid)
    }
    func Group300(myGid:String,myUids:[String],partnerGid:String,pUids:[String],completion:@escaping(String)->Void={_ in}){
        self.onCallGroupSendLike(myGid: myGid, partnerGid: partnerGid, myUids: myUids, pUids: pUids){ resultStr in
            completion(resultStr)
        }
    }
    func Group400(myGid:String,myUids:[String],partnerGid:String,pUids:[String],completion:@escaping(String)->Void={_ in}){
        self.onCallGroupSendDeli(myGid: myGid, partnerGid: partnerGid, myUids: myUids, pUids: pUids){ resultStr in
            completion(resultStr)
        }
    }
    func GroupReport(gid:String,index:Int){
        
    }
}
