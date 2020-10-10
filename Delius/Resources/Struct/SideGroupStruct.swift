//
//  SideGroupStruct.swift
//  Delius
//
//  Created by user on 2020/08/11.
//  Copyright © 2020 정윤환. All rights reserved.
//

class SideGroupStruct{
    var group:GroupStruct?
    var members:[UserStruct]?
    var GL:GLStruct?
    
    init(group:GroupStruct,members:[UserStruct],GL:GLStruct){
        self.group = group
        self.members = members
        self.GL = GL
    }
}
