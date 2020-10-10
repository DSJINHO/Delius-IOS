//
//  MainListStruct.swift
//  Delius
//
//  Created by user on 2020/08/07.
//  Copyright © 2020 정윤환. All rights reserved.
//

import Firebase
class MainListStruct{
    var mStruct:MStruct?
    var soloStruct:UserStruct?
    var groupStruct:GroupStruct?
    var memberStruct:[UserStruct]?
    
    
    init(m:MStruct,group:GroupStruct,member:[UserStruct]){
        self.mStruct = m
        self.groupStruct = group
        self.memberStruct = member
    }
    
    init(m:MStruct,solo:UserStruct){
        self.mStruct = m
        self.soloStruct = solo
    }
    init(m:MStruct){
        self.mStruct = m
    }
    init(){
        
    }
}
