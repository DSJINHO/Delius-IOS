//
//  MyinfoStruct.swift
//  Delius
//
//  Created by 박진호 on 2020/06/28.
//  Copyright © 2020 정윤환. All rights reserved.
//

import Firebase
import FirebaseFirestore
class MyinfoStruct:NSObject{
    var id:String?
    var ind1:Bool?
    var ind2:Int?
    var num:Int?
    var tp:Timestamp?
    var uid:String?
    var uids:[String]?
    
    init(dictionary:[String:Any]){
        self.id = dictionary["id"] as? String
        self.ind1 = dictionary["ind1"] as? Bool
        self.ind2 = dictionary["ind2"] as? Int
        self.num = dictionary["num"] as? Int
        self.tp = dictionary["tp"] as? Timestamp
        self.uid = dictionary["uid"] as? String
        self.uids = dictionary["uids"] as? [String]
    }
}
