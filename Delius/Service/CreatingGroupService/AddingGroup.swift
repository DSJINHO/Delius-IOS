//
//  AddingGroup.swift
//  Delius
//
//  Created by 박진호 on 2020/06/23.
//  Copyright © 2020 정윤환. All rights reserved.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFunctions
class AddingGroup{
    var db:Firestore!
    var functions:Functions!
    var user:User?
    
    var ag:Int?
    var ex:String?
    var fo1:Int?
    var fo2:Int?
    var fo3:Int?
    var gid:String?
    var ind1:Bool?
    var ind2:Bool?
    var lo:String?
    var lo1:Int?
    var lo2:Int?
    var ltp:Int?
    var ms:Bool?
    var na:String?
    var num:Int?
    var ps:Bool?
    var st:String?
    var tp:Timestamp?
    var uid1:String?
    var uid2:String?
    var uid3:String?
    var uid4:String?
    
    var ph1:String?
    var ph2:String?
    var ph3:String?
    var ph4:String?
    
    
    
    func checkData()->String{
        if self.na == nil || self.st == nil{
            return "string"
        }
        if self.ag == nil || self.ind2 == nil || self.ms == nil || self.ps == nil || self.uid1 == nil || self.uid2 == nil || self.uid3 == nil || self.uid4 == nil{
            return "member"
        }
        if self.fo1 == nil || self.fo2 == nil || self.fo3 == nil{
            return "tag"
        }
        if self.ltp == nil{
            return "date"
        }
        if self.lo == nil || self.lo1 == nil || self.lo2 == nil{
            return "location"
        }
        if self.ex == nil{
            return "extra"
        }
        return "complete"
    }
}
