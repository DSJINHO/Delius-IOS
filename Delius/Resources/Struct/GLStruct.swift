//
//  GLStruct.swift
//  Delius
//
//  Created by user on 2020/08/11.
//  Copyright © 2020 정윤환. All rights reserved.
//
import FirebaseFirestore
class GLStruct{
    var targetid:String?
    var gid:String?
    var uids:[String]?
    var ind1:Int?
    var ind2:Int?
    var mid:[[String:Any]]?
    var num:Int?
    var tp:Timestamp?
    var r:[[String]]?
    
    init(dictionary:[String:Any]){
        self.targetid = dictionary["targetid"] as? String
        self.uids = dictionary["uids"] as? [String]
        self.gid = dictionary["gid"] as? String
        self.ind1 = dictionary["ind1"] as? Int
        self.ind2 = dictionary["ind2"] as? Int
        self.mid = dictionary["mid"] as? [[String:Any]]
        self.num = dictionary["num"] as? Int
        self.tp = dictionary["tp"] as? Timestamp
        self.r = dictionary["r"] as? [[String]]
        
    }
}
