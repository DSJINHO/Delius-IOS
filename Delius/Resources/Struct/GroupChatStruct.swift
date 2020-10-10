//
//  GroupChatStruct.swift
//  Delius
//
//  Created by user on 2020/08/13.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class GroupChatStruct{
    var gid:String?
    var message:String?
    var uids:[String]?
    var tp:NSNumber?
    var groupName:String?
    var senderName:String?
    var senderUid:String?
    init(dictionary:[String:Any]){
        self.gid = dictionary["gid"] as? String
        self.message = dictionary["message"] as? String
        self.uids = dictionary["uids"] as? [String]
        self.tp = dictionary["tp"] as? NSNumber
        self.groupName = dictionary["gn"] as? String
        self.senderName = dictionary["sn"] as? String
        self.senderUid = dictionary["su"] as? String
    }
}
