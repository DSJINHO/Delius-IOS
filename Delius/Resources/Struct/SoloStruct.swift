//
//  SoloStruct.swift
//  Delius
//
//  Created by 박진호 on 2020/07/02.
//  Copyright © 2020 정윤환. All rights reserved.
//



import Firebase
import FirebaseFirestore
class SoloStruct:NSObject{
    var send:Int?
    var receive:Int?
    var actionTp:Timestamp?
    var bt:Int?
    var ex:String?
    var fo1:Int?
    var fo2:Int?
    var fo3:Int?
    var fo4:Int?
    var im:[[String:Any]]?
    var ind1:Int?
    var ind2:Int?
    var job:String?
    var lc:String?
    var lo1:Int?
    var lo2:Int?
    var lob:Bool?
    var na:String?
    var st:String?
    var sx:Bool?
    var tk:String?
    var ut:Timestamp?
    var uid:String?
    init(dictionary:[String:Any]){
        self.send = dictionary["send"] as? Int
        self.receive = dictionary["receive"] as? Int
        self.actionTp = dictionary["actionTp"] as? Timestamp
        self.bt = dictionary["bt"] as? Int
        self.ex = dictionary["ex"] as? String
        self.fo1 = dictionary["fo1"] as? Int
        self.fo2 = dictionary["fo2"] as? Int
        self.fo3 = dictionary["fo3"] as? Int
        self.fo4 = dictionary["fo4"] as? Int
        self.im = dictionary["im"] as? [[String:Any]]
        self.ind1 = dictionary["ind1"] as? Int
        self.ind2 = dictionary["ind2"] as? Int
        self.job = dictionary["job"] as? String
        self.lc = dictionary["lc"] as? String
        self.lo1 = dictionary["lo1"] as? Int
        self.lo2 = dictionary["lo2"] as? Int
        self.lob = dictionary["lob"] as? Bool
        self.na = dictionary["na"] as? String
        self.st = dictionary["st"] as? String
        self.sx = dictionary["sx"] as? Bool
        self.tk = dictionary["tk"] as? String
        self.ut = dictionary["ut"] as? Timestamp
        self.uid = dictionary["uid"] as? String
    }
}
