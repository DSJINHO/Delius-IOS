//
//  CashItemStruct.swift
//  Delius
//
//  Created by 박진호 on 2020/06/29.
//  Copyright © 2020 정윤환. All rights reserved.
//

import Firebase
import FirebaseFirestore
class CashItemStruct:NSObject{
    var btr:Int?
    var deli:Int?
    var deli2:Int?
    var dltp:Timestamp?
    var like:Int?
    var litp:Timestamp?
    var plus:Bool?
    var log:Int?
    var logTp:Timestamp?
    var uid:String?
    
    init(dictionary:[String:Any]){
        self.btr = dictionary["btr"] as? Int
        self.deli = dictionary["deli"] as? Int
        self.deli2 = dictionary["deli2"] as? Int
        self.dltp = dictionary["dltp"] as? Timestamp
        self.like = dictionary["like"] as? Int
        self.litp = dictionary["litp"] as? Timestamp
        self.plus = dictionary["plus"] as? Bool
        self.uid = dictionary["uid"] as? String
        self.log = dictionary["log"] as? Int
        self.logTp = dictionary["logtp"] as? Timestamp
    }
}
