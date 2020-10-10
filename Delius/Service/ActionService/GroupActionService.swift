//
//  GroupActionService.swift
//  Delius
//
//  Created by user on 2020/08/17.
//  Copyright © 2020 정윤환. All rights reserved.
//

import FirebaseFirestore
class GroupActionService{
    var db:Firestore!
    var myGid:String!
    var partner:SideGroupStruct!
    var user:UserStruct!
    var cashItem:CashItemStruct!
    init(myGid:String,partner:SideGroupStruct,user:UserStruct,cashItem:CashItemStruct){
        self.myGid = myGid
        self.partner = partner
        self.user = user
        self.cashItem = cashItem
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
    }
    
    func sendGroupLike(completion:@escaping(Bool)->Void){
        guard let groupStruct = partner.GL else { return }
        guard let currentUser = user else { return }
        let groupSize = groupStruct.num!
        let groupState:ClassifyGroupStruct!
        if groupSize == 2{
            groupState = ClassifyGroupState.group2State(groupData: groupStruct, inputState: 300)
        }else if groupSize == 3{
            groupState = ClassifyGroupState.group3State(groupData: groupStruct, inputState: 300)
        }else{
            groupState = ClassifyGroupState.group3State(groupData: groupStruct, inputState: 300)
        }
        if groupState.needGroupUpdate == nil{
            return
        }
        let cashRef = db.collection("cash").document(currentUser.uid!).collection("chlist").document("uch")
        let groupRef = db.collection("gl").document(myGid).collection("ggl").document(groupStruct.targetid!)
        let mlistRef = db.collection("mlist").document(currentUser.uid!).collection("mmlist").document(groupStruct.targetid!)
        let groupUpdateData:[String:Any]!
        var cashUpdateData:[String:Any]!
        let mlistUpdateData:[String:Any]!
        
        
        var defaultLike = user.sx! ? 10 : 15
        if user.ind2!{
            defaultLike = user.sx! ? 20 : 30
        }
        if cashItem.like != 0 && cashItem.like == defaultLike{
            cashUpdateData = ["like" : FieldValue.increment(Int64(-1))]
        }
        if cashItem.like != 0 && cashItem.like != defaultLike{
            cashUpdateData = ["like" : FieldValue.increment(Int64(-1)),"litp":FieldValue.serverTimestamp()]
        }
        if groupState.needGroupUpdate!{
            let state = groupState.groupIndex!
            if state == 500 || state == 1000{
                groupUpdateData = ["ind1":state,"ind2":state, "mid" : FieldValue.arrayUnion([currentUser.uid!,300]),"tp" : FieldValue.serverTimestamp()]
            }else{
                groupUpdateData = ["ind1":state, "mid" : FieldValue.arrayUnion([currentUser.uid!,300]),"tp" : FieldValue.serverTimestamp()]
            }
            
        }else{
            groupUpdateData = [ "mid" : FieldValue.arrayUnion([currentUser.uid!,300]),"tp" : FieldValue.serverTimestamp()]
        }
        mlistUpdateData = ["in1":300,"tp":FieldValue.serverTimestamp()]
        var isFail = false
        let asyncGroup = DispatchGroup()
        asyncGroup.enter()
        groupRef.updateData(groupUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
            
        }
        asyncGroup.enter()
        mlistRef.updateData(mlistUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
        }
        if groupState.needCash!{
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
    func sendGroupDeli(completion:@escaping(Bool)->Void){
        
        guard let groupStruct = partner.GL else { return }
        guard let currentUser = user else { return }
        let groupSize = groupStruct.num!
        let groupState:ClassifyGroupStruct!
        if groupSize == 2{
            groupState = ClassifyGroupState.group2State(groupData: groupStruct, inputState: 400)
        }else if groupSize == 3{
            groupState = ClassifyGroupState.group3State(groupData: groupStruct, inputState: 400)
        }else{
            groupState = ClassifyGroupState.group3State(groupData: groupStruct, inputState: 400)
        }
        if groupState.needGroupUpdate == nil{
            return
        }
        let cashRef = db.collection("cash").document(currentUser.uid!).collection("chlist").document("uch")
        let groupRef = db.collection("gl").document(myGid).collection("ggl").document(groupStruct.targetid!)
        let mlistRef = db.collection("mlist").document(currentUser.uid!).collection("mmlist").document(groupStruct.targetid!)
        let groupUpdateData:[String:Any]!
        var cashUpdateData:[String:Any]!
        let mlistUpdateData:[String:Any]!
        
        let defaultDeli = !user.ind2! ? 2 : 5
        if cashItem.deli != 0 && cashItem.deli == defaultDeli{
            cashUpdateData = ["deli" : FieldValue.increment(Int64(-1))]
        }
        if cashItem.deli != 0 && cashItem.deli != defaultDeli{
            cashUpdateData = ["deli" : FieldValue.increment(Int64(-1)),"dltp":FieldValue.serverTimestamp()]
        }
        if cashItem.deli == 0 && cashItem.deli2! > 0{
            cashUpdateData = ["deli2" : FieldValue.increment(Int64(-1))]
        }
        if groupState.needGroupUpdate!{

            let state = groupState.groupIndex!
            if state == 500 || state == 1000{
                groupUpdateData =  ["ind1":state,"ind2":state, "mid" : FieldValue.arrayUnion([currentUser.uid!,400]),"tp" : FieldValue.serverTimestamp()]
            }else{
                groupUpdateData = ["ind1":state, "mid" : FieldValue.arrayUnion([currentUser.uid!,400]),"tp" : FieldValue.serverTimestamp()]
            }
        }else{

            groupUpdateData = [ "mid" : FieldValue.arrayUnion([currentUser.uid!,400]),"tp" : FieldValue.serverTimestamp()]
        }
        mlistUpdateData = ["in1":400,"tp":FieldValue.serverTimestamp()]
        var isFail = false
        let asyncGroup = DispatchGroup()
        asyncGroup.enter()
        groupRef.updateData(groupUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
            
        }
        asyncGroup.enter()
        mlistRef.updateData(mlistUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
        }
        if groupState.needCash!{
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
    func rejectGroup(completion:@escaping(Bool)->Void){
        
        guard let groupStruct = partner.GL else { return }
        guard let currentUser = user else { return }
        let groupSize = groupStruct.num!
        let groupState:ClassifyGroupStruct!
        if groupSize == 2{
            groupState = ClassifyGroupState.group2State(groupData: groupStruct, inputState: 400)
        }else if groupSize == 3{
            groupState = ClassifyGroupState.group3State(groupData: groupStruct, inputState: 400)
        }else{
            groupState = ClassifyGroupState.group3State(groupData: groupStruct, inputState: 400)
        }
        if groupState.needGroupUpdate == nil{
            return
        }
        let groupRef = db.collection("gl").document(myGid).collection("ggl").document(groupStruct.targetid!)
        let mlistRef = db.collection("mlist").document(currentUser.uid!).collection("mmlist").document(groupStruct.targetid!)
        let groupUpdateData:[String:Any]!
        let mlistUpdateData:[String:Any]!
        
        if groupState.needGroupUpdate!{

            let state = groupState.groupIndex!
            if state == 500 || state == 1000{
                groupUpdateData = ["ind1":state,"ind2":state, "mid" : FieldValue.arrayUnion([currentUser.uid!,901]),"tp" : FieldValue.serverTimestamp()]
            }else{
                groupUpdateData = ["ind1":state, "mid" : FieldValue.arrayUnion([currentUser.uid!,901]),"tp" : FieldValue.serverTimestamp()]
            }
            
        }else{

            groupUpdateData = [ "mid" : FieldValue.arrayUnion([currentUser.uid!,901]),"tp" : FieldValue.serverTimestamp()]
        }
        mlistUpdateData = ["in1":901,"tp":FieldValue.serverTimestamp()]
        
        var isFail = false
        let asyncGroup = DispatchGroup()
        asyncGroup.enter()
        groupRef.updateData(groupUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
            
        }
        asyncGroup.enter()
        mlistRef.updateData(mlistUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
        }
        asyncGroup.notify(queue: .main){
            completion(isFail)
        }
        
    }
    func reportGroup(report:Int,completion:@escaping(Bool)->Void){
        
        guard let groupStruct = partner.GL else { return }
        guard let currentUser = user else { return }
        let groupSize = groupStruct.num!
        let groupState:ClassifyGroupStruct!
        if groupSize == 2{
            groupState = ClassifyGroupState.group2State(groupData: groupStruct, inputState: report)
        }else if groupSize == 3{
            groupState = ClassifyGroupState.group3State(groupData: groupStruct, inputState: report)
        }else{
            groupState = ClassifyGroupState.group3State(groupData: groupStruct, inputState: report)
        }
        if groupState.needGroupUpdate == nil{
            return
        }
        let groupRef = db.collection("gl").document(myGid).collection("ggl").document(groupStruct.targetid!)
        let mlistRef = db.collection("mlist").document(currentUser.uid!).collection("mmlist").document(groupStruct.targetid!)
        let groupUpdateData:[String:Any]!
        let mlistUpdateData:[String:Any]!
        
        if groupState.needGroupUpdate!{
            let state = groupState.groupIndex!
            if state == 500 || state == 1000{
                groupUpdateData = ["ind1":state,"ind2":state,"mid" : FieldValue.arrayUnion([currentUser.uid!,report]),"tp":FieldValue.serverTimestamp()]
            }else{
               groupUpdateData = ["ind1":state,"mid" : FieldValue.arrayUnion([currentUser.uid!,report]),"tp":FieldValue.serverTimestamp()]
            }
        }else{
            groupUpdateData = ["mid" : FieldValue.arrayUnion([currentUser.uid!,report]),"tp":FieldValue.serverTimestamp()]
        }
        mlistUpdateData =  ["in1":report,"tp":FieldValue.serverTimestamp()]
        var isFail = false
        let asyncGroup = DispatchGroup()
        asyncGroup.enter()
        groupRef.updateData(groupUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
            
        }
        asyncGroup.enter()
        mlistRef.updateData(mlistUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
        }
        asyncGroup.notify(queue: .main){
            completion(isFail)
        }
        
    }
}
