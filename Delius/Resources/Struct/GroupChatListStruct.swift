//
//  GroupChatListStruct.swift
//  Delius
//
//  Created by user on 2020/08/19.
//  Copyright © 2020 정윤환. All rights reserved.
//
import UIKit
class GroupChatListStruct{
    var senderUid:String?
    var tp:NSNumber?
    var msg:String?
    var r:Bool?
    var groupId:String?
    init(dictionary:[String:Any]){
        self.senderUid = dictionary["senderUid"] as? String
        self.tp = dictionary["tp"] as? NSNumber
        self.msg = dictionary["msg"] as? String
        self.r = dictionary["r"] as? Bool
        self.groupId = dictionary["groupId"] as? String
    }
}
