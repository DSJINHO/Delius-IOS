//
//  SoloActionService.swift
//  Delius
//
//  Created by user on 2020/08/17.
//  Copyright © 2020 정윤환. All rights reserved.
//
import FirebaseFirestore
class SoloActionService{
    var db:Firestore!
    var partner:MainListStruct!
    var user:UserStruct!
    var cashItem:CashItemStruct!
    init(user:UserStruct,cashItem:CashItemStruct,partner:MainListStruct){
        
        self.user = user
        self.cashItem = cashItem
        self.partner = partner
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        
    }
    
    func sendSoloLike(completion:@escaping(Bool)->Void){
        
        guard let currentUser = user else { return }
        guard let partnerUser = partner.soloStruct else { return }
        guard let partnerState = partner.mStruct else { return }
        var defaultLike = currentUser.sx! ? 10 : 15
        if currentUser.ind2!{
            defaultLike = currentUser.sx! ? 20 : 30
        }
        let isUpdateTP = cashItem.like == defaultLike ? true : false
        let mRef = db.collection("mlist").document(currentUser.uid!).collection("mmlist").document(partnerUser.uid!)
        let cashRef = db.collection("cash").document(currentUser.uid!).collection("chlist").document("uch")
        let mlistUpdateData:[String:Any] = ["in1":500,"in2":500,"tp":FieldValue.serverTimestamp()]
        let cashUpdateData:[String:Any] = isUpdateTP ? ["like" : FieldValue.increment(Int64(-1)),"litp":FieldValue.serverTimestamp()] : ["like" : FieldValue.increment(Int64(-1))]
        let asyncGroup = DispatchGroup()
        var isFail = false
        asyncGroup.enter()
        mRef.updateData(mlistUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
        }
        if partnerState.in1 == 300{
            asyncGroup.enter()
            cashRef.updateData(cashUpdateData){(err) in
                if err != nil{
                    isFail = true
                }
                asyncGroup.leave()
            }
        }
        asyncGroup.notify(queue: .main){
            completion(isFail)
        }
    }
    func sendSoloDeli(completion:@escaping(Bool)->Void){
        guard let currentUser = user else { return }
        guard let partnerUser = partner.soloStruct else { return }
        guard let partnerState = partner.mStruct else { return }
        var defaultDeli = 2
        if currentUser.ind2!{
            defaultDeli = 5
        }
        let isUpdateTP = cashItem.deli == defaultDeli ? false : true
        let mRef = db.collection("mlist").document(currentUser.uid!).collection("mmlist").document(partnerUser.uid!)
        let cashRef = db.collection("cash").document(currentUser.uid!).collection("chlist").document("uch")
        let mlistUpdateData:[String:Any] = ["in1":500,"in2":500,"tp":FieldValue.serverTimestamp()]
        var cashUpdateData:[String:Any] = isUpdateTP ? ["deli" : FieldValue.increment(Int64(-1)),"dltp":FieldValue.serverTimestamp()] : ["deli" : FieldValue.increment(Int64(-1))]
        if (cashItem.deli == 0 && cashItem.deli2! > 0){
            cashUpdateData = ["deli2" : FieldValue.increment(Int64(-1))]
        }
        let asyncGroup = DispatchGroup()
        var isFail = false
        asyncGroup.enter()
        mRef.updateData(mlistUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
        }
        if partnerState.in1 == 300{
            asyncGroup.enter()
            cashRef.updateData(cashUpdateData){(err) in
                if err != nil{
                    isFail = true
                }
                asyncGroup.leave()
            }
        }
        asyncGroup.notify(queue: .main){
            completion(isFail)
        }
    }
    func rejectSolo(){
        guard let currentUser = user else { return }
        guard let targetUid = partner.mStruct?.pid else { return }
        let ref = db.collection("mlist").document(currentUser.uid!).collection("mmlist").document(targetUid)
        let updateData : [String:Any] = ["in1":1000,"in2":1000,"tp":FieldValue.serverTimestamp()]
        ref.updateData(updateData)
    }
    func reportSolo(reportType:Int){
        guard let currentUser = user else { return }
        guard let targetUid = partner.mStruct?.pid else { return }
        let ref = db.collection("mlist").document(currentUser.uid!).collection("mmlist").document(targetUid)
        let updateData : [String:Any] = ["in1":reportType,"in2":reportType,"tp":FieldValue.serverTimestamp()]
        ref.updateData(updateData)
    }
    func matchCancel(){
        guard let currentUser = user else { return }
        guard let targetUid = partner.mStruct?.pid else { return }
        let ref = db.collection("mlist").document(currentUser.uid!).collection("mmlist").document(targetUid)
        let updateData : [String:Any] = ["in1":1000,"in2":1000,"tp":FieldValue.serverTimestamp()]
        ref.updateData(updateData)
    }
}
