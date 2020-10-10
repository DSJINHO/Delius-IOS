//
//  ClassifyGroupStruct.swift
//  Delius
//
//  Created by user on 2020/08/15.
//  Copyright © 2020 정윤환. All rights reserved.
//

class ClassifyGroupStruct{
    var needCash:Bool?
    var needGroupUpdate:Bool?
    var groupIndex:Int?
    
    init(){
        
    }
    init(cash:Bool,groupUpdate:Bool,index:Int){
        self.needCash = cash
        self.needGroupUpdate = groupUpdate
        self.groupIndex = index
    }
}
