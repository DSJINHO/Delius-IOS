//
//  GroupMatchListStruct.swift
//  Delius
//
//  Created by user on 2020/08/19.
//  Copyright © 2020 정윤환. All rights reserved.
//

class GroupMatchListStruct{
    var groupData:SideGroupStruct?
    var chatData:GroupChatListStruct?
    init(groupData:SideGroupStruct){
        self.groupData = groupData
    }
}
