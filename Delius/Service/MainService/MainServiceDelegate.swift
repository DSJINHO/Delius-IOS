//
//  MainServiceDelegate.swift
//  Delius
//
//  Created by 박진호 on 2020/06/28.
//  Copyright © 2020 정윤환. All rights reserved.
//

import Firebase
protocol MainServiceDelegate {
    func addMyGroupList(groupData:MyinfoStruct)
    func addMyGroupData(groupData:GroupStruct,userData:[UserStruct])
    func createMainList(listData:MStruct,userData:UserStruct)
    func transferCashItem(cashItem:CashItemStruct)
    func transfetUserInfo(userInfo:UserStruct)
    
    
    func addSoloMatchUser(userData:SoloStruct)
    func removeSoloMatchUser(userIdentifier:String)

    func addSoloLikeUser(userData:SoloStruct)
    func removeSoloLikeUser(userIdentifier:String)
    
    func addSoloDeliUser(userData:SoloStruct)
    func removeSoloDeliUser(userIdentifier:String)
    
    
    func AddMainList(mData:MainListStruct)
    func UpdateMainList(mData:MStruct)
    func RemoveSoloMatch(data:MStruct)
    func AddSoloMatch(data:MainListStruct)
    func RemoveSoloFeed(data:MStruct)
    func AddSoloFeed(data:MainListStruct)
    
    func AddMyGroup(data:MyGroupListStruct)
    func ModifyMyGroup(data:MyinfoStruct)
    
    
    
    func AddGroupMatch(gData:SideGroupStruct)
    func AddGroupFeedVote(gData:SideGroupStruct)
    
    
    
    func ControlMainDelegate(resultStr:String,im:[imgStruct])
    
    func ControlUserStateView(type:Int)
    
}
