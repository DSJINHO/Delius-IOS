//
//  Signup.swift
//  Delius
//
//  Created by 정윤환 on 2020/06/10.
//  Copyright © 2020 정윤환. All rights reserved.
//
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFunctions
class Signup{
    var db:Firestore!
    var functions:Functions!
    var user:User!
    
    
    var SignupListener:ListenerRegistration!
    var verifiedID:String?
    
    var uid:String?
    var userPhone:String?
    
    var bt:Int?
    var fo1:Int?
    var fo2:Int?
    var fo3:Int?
    var fo4:Int?
    
    var job:String?
    var lc:String?
    var lo1:Int?
    var lo2:Int?
    var na:String?
    var st:String?
    var sx:Bool?
    var tk:String?
    
    
    var email:String?
    
    func checkUserData()->String{
        na = StringProcess.filterEmpty(inputStr: na!)
        if na == nil || na!.count == 0 || na!.count > 15{
            return "profile_na"
        }
        job = StringProcess.filterEmpty(inputStr: job!)
        if job == nil || job!.count == 0 || job!.count > 20{
            return "profile_job"
        }
        if sx == nil{
            return "profile_sx"
        }
        if bt == nil{
            return "profile_bt"
        }
        st = StringProcess.filterEmpty(inputStr: st!)
        if st == nil || st!.count == 0 || st!.count > 20{
            return "profile_st"
        }
        if fo1 == nil{
            return "profile_fo1"
        }
        if fo2 == nil{
            return "profile_fo2"
        }
        if fo3 == nil{
            return "profile_fo3"
        }
        if fo4 == nil{
            return "profile_fo4"
        }
        if lo1 == nil{
            lo1 = 37000000
        }
        if lo2 == nil{
            lo2 = 121000000
        }
        if lc == nil{
            lc = "kr"
        }
        return "complete"
        
    }
}
