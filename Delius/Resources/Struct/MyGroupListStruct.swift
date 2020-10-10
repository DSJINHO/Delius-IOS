//
//  MyGroupListStruct.swift
//  Delius
//
//  Created by user on 2020/08/11.
//  Copyright © 2020 정윤환. All rights reserved.
//

import FirebaseFirestore
class MyGroupListStruct{
    
    var listInfo:MyinfoStruct?
    var groupInfo:GroupStruct?
    var memberInfo:[UserStruct]?
    
    init(list:MyinfoStruct,group:GroupStruct,member:[UserStruct]){
        self.listInfo = list
        self.groupInfo = group
        self.memberInfo = member
        
    }
}
