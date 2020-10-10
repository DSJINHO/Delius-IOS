//
//  ProfileEdit.swift
//  Delius
//
//  Created by user on 2020/07/23.
//  Copyright © 2020 정윤환. All rights reserved.
//
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFunctions
class ProfileEdit{
    var db:Firestore!
    var functions:Functions!
    var user:User!
    
    var isChanged:Bool = false
    var formerData:UserStruct?
    var uid:String?
    
    var fo1:Int?
    var fo2:Int?
    var fo3:Int?
    var fo4:Int?
    
    var job:String?
    var formerImgArray:[[String]]?
    var imgArray:[[String]]?
    var st:String?
    
    var ex:String?
    
    var totalImgArr = [newImgStruct]()
    
    var uploadImgObjs=[imgStruct]()
    var newUpload:Bool=false
    var newImgs=[UIImage]()
    func checkChangedData()->Bool{
        
        guard let exData = formerData else { return false }
        if let exStatus = exData.st, exStatus != self.st {
            return true
        }
        if let exJob = exData.job, exJob != self.job {
            return true
        }
        if let exFo1 = exData.fo1, exFo1 != self.fo1 {
            return true
        }
        if let exFo2 = exData.fo2, exFo2 != self.fo2 {
            return true
        }
        if let exFo3 = exData.fo3, exFo3 != self.fo3 {
            return true
        }
        if let exFo4 = exData.fo4, exFo4 != self.fo4 {
            return true
        }
        if let exExtra = exData.ex, exExtra != self.ex {
            return true
        }
        if let formerArray = formerImgArray, formerArray != self.imgArray{
            return true
        }
        return false
    }
    func uploadImages(){
        
    }
    
}
