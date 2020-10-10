//
//  FirestoreService.swift
//  Delius
//
//  Created by 박진호 on 2020/06/24.
//  Copyright © 2020 정윤환. All rights reserved.
//


import Firebase
import FirebaseFirestore
import FirebaseFunctions
import FirebaseAuth
class FirestoreService{
    
    
    
    
    var myGroupList=[MyinfoStruct]()
    var myGroupData=[GroupStruct]()
    var myGroupUsers=[UserStruct]()
    
    
//    var mainList=[MStruct]()
    var mainGroupDatas=[GroupStruct]()
    var mainSoloDatas=[UserSetStruct]()
    
    var mainList = [MainListStruct]()
    var SoloFeedList = [MainListStruct]()
    var SoloMatchList = [MainListStruct]()
    
    
    
    
    
    
    var cashLogService:RenewalCashItem!
    
    var activeMyGroup=[GroupStruct]()// 101,201,301,500
    var db:Firestore!
    var functions:Functions!
    
    
    var tk:String!
    
    var myGroupListener:ListenerRegistration!
    
    var mainListListener:ListenerRegistration!
    var soloMatchListener:ListenerRegistration!
    var soloLikeListener:ListenerRegistration!
    var soloDeliListener:ListenerRegistration!
    
    var cashItemListener:ListenerRegistration!
    var myinfoListener:ListenerRegistration!
    
    var groupListener=[[String:[ListenerRegistration]]]()
    
    var sideGroupFeedList = [[String:[SideGroupStruct]]]()
    var sideGroupWaitList = [[String:[SideGroupStruct]]]()
    var sideGroupMatchList = [[String:[SideGroupStruct]]]()
    
    var userGroupList = [MyGroupListStruct]()
    var activeGroupList = [MyGroupListStruct]()
    
    
    
    
    var user:User!
    var userInfo:UserStruct!
    var cashItem:CashItemStruct!
    
    
    var groupDataArray:[GroupStruct]!
    var userDataArray:[UserStruct]!
    
    
    var soloMatchArray=[SoloStruct]()
    var soloLikeArray=[SoloStruct]()
    var soloDeliArray=[SoloStruct]()
    var soloNotiArray=[SoloStruct]()
    
    
}
