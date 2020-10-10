//
//  SoloMatchListStruct.swift
//  Delius
//
//  Created by user on 2020/08/18.
//  Copyright © 2020 정윤환. All rights reserved.
//

class SoloMatchListStruct{
    var soloData:MainListStruct?
    var chatData:SoloChatListStruct?
    init(soloData:MainListStruct){
        self.soloData = soloData
    }
}
