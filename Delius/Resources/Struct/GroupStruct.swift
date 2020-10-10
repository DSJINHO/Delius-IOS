//
//  GroupStruct.swift
//  Delius
//
//  Created by 박진호 on 2020/06/28.
//  Copyright © 2020 정윤환. All rights reserved.
//

import Firebase
import FirebaseFirestore
class GroupStruct{
    var bt:Int?
    var ex:String?
    var fo1:Int?
    var fo2:Int?
    var fo3:Int?
    var na:String?
    var gid:String?
    var ind1:Bool?
    var ind2:Bool?
    var lo:String?
    var lo1:Int?
    var lo2:Int?
    var ltp:Int?
    var num:Int?
    var ms:Bool?
    var ps:Bool?
    var st:String?
    var tp:Timestamp?
    var uid1:String?
    var uid2:String?
    var uid3:String?
    var uid4:String?
    
    init(){
        
    }
    
    init(dictionary:[String:Any]) {
        self.bt = dictionary["bt"] as? Int
        self.ex = dictionary["ex"] as? String
        self.fo1 = dictionary["fo1"] as? Int
        self.fo2 = dictionary["fo2"] as? Int
        self.fo3 = dictionary["fo3"] as? Int
        self.na = dictionary["na"] as? String
        self.gid = dictionary["gid"] as? String
        self.ind1 = dictionary["ind1"] as? Bool
        self.ind2 = dictionary["ind2"] as? Bool
        self.lo = dictionary["lo"] as? String
        self.lo1 = dictionary["lo1"] as? Int
        self.lo2 = dictionary["lo2"] as? Int
        self.ltp = dictionary["ltp"] as? Int
        self.num = dictionary["num"] as? Int
        self.ms = dictionary["ms"] as? Bool
        self.ps = dictionary["ps"] as? Bool
        self.st = dictionary["st"] as? String
        self.tp = dictionary["tp"] as? Timestamp
        self.uid1 = dictionary["uid1"] as? String
        self.uid2 = dictionary["uid2"] as? String
        self.uid3 = dictionary["uid3"] as? String
        self.uid4 = dictionary["uid4"] as? String
        
        
    }
}
