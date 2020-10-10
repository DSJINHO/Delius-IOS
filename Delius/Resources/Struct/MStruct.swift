//
//  MStruct.swift
//  Delius
//
//  Created by 박진호 on 2020/06/28.
//  Copyright © 2020 정윤환. All rights reserved.
//
import Firebase
import FirebaseFirestore
class MStruct:NSObject{
    var cdit:Int?
    var in1:Int?
    var in2:Int?
    var ind1:Int?
    var mid:[String]?
    var num:Int?
    var pid:String?
    var psx:Bool?
    var tp:Timestamp?
    var type:Int?
    var uid:String?
    var pids:[String]?
    
    init(dictionary:[String:Any]){
        self.cdit = dictionary["cdit"] as? Int
        self.in1 = dictionary["in1"] as? Int
        self.in2 = dictionary["in2"] as? Int
        self.ind1 = dictionary["ind1"] as? Int
        self.mid = dictionary["mid"] as? [String]
        self.num = dictionary["num"] as? Int
        self.pid = dictionary["pid"] as? String
        self.psx = dictionary["psx"] as? Bool
        self.tp = dictionary["tp"] as? Timestamp
        self.type = dictionary["type"] as? Int
        self.uid = dictionary["uid"] as? String
        self.pids = dictionary["pids"] as? [String]
    }
    
}
