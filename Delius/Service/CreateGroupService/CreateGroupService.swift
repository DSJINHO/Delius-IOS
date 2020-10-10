//
//  CreateGroupService.swift
//  Delius
//
//  Created by user on 2020/09/10.
//  Copyright © 2020 정윤환. All rights reserved.
//



import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFunctions

class CreateGroupService{
    var db:Firestore!
    var user:User!
    var functions:Functions!
    
    var groupName:String?
    var groupStatus:String?
    
    var bt:Int?
    var ind2:Bool?
    var ps:Bool?
    var ms:Bool?
    var uid1:String?
    var uid2:String?
    var uid3:String?
    var uid4:String?
    
    
    var gid:String?
    var ex:String?
    var fo1:Int?
    var fo2:Int?
    var fo3:Int?
    var lo:String?
    var lo1:Int?
    var lo2:Int?
    var ltp:Int?
    var num:Int?
    
    
    
    
    init(){
        db = Firestore.firestore()
        user = Auth.auth().currentUser
        functions = Functions.functions()
    }
    
    func checkUserByPhone(phArray:[String],completion:@escaping([String:Any])->Void){
        let authPhone = user.phoneNumber
        var requestArr = [authPhone]
        requestArr.append(contentsOf: phArray)
        let requestData = ["phs":requestArr]
        
        functions.httpsCallable("CheckPhone").call(requestData) { (result, error) in
            if let error = error as NSError? {
                print(error.localizedDescription,"ERRROR")
                completion(["type":"err"])
                return
            }
            guard let resultObject = (result?.data as? [String: Any]) else { return }
            
            if let resultData = resultObject["info"] as? [String:Any]{
                print(resultData)
                self.bt = resultData["bt"] as? Int
                self.ind2 = resultData["ind2"] as? Bool
                self.ps = resultData["ps"] as? Bool
                self.ms = resultData["ms"] as? Bool
                self.uid1 = resultData["uid1"] as? String
                self.uid2 = resultData["uid2"] as? String
                self.uid3 = resultData["uid3"] as? String
                self.uid4 = resultData["uid4"] as? String
                self.num = requestArr.count
            }
            completion(resultObject)
        }
    }
    func createGroup(completion:@escaping([String:Any])->Void){
        let gid = UUID().uuidString
        let now = Date().timeIntervalSince1970
        let ltp = Int(now) + 86400*14
        let requestData:[String:Any] = [
                            "gid":gid,
                           "bt":self.bt!,
                           "ex":self.ex!,
                           "fo1":self.fo1!,
                           "fo2":self.fo2!,
                           "fo3":self.fo3!,
                           "ind2":self.ind2!,
                           "lo":self.lo!,
                           "lo1":self.lo1!,
                           "lo2":self.lo2!,
                           "ltp":ltp,
                           "ms":self.ms!,
                           "na":self.groupName!,
                           "num":self.num!,
                           "ps":self.ps!,
                           "st":self.groupStatus!,
                           "uid1":self.uid1!,
                           "uid2":self.uid2!,
                           "uid3":self.uid3!,
                           "uid4":self.uid4!
        ]
        print(requestData)
        functions.httpsCallable("CreateGroup").call(requestData){(result,err) in
            if err != nil{
                completion(["type":"err"])
                return
            }
            guard let resultData = (result?.data as? [String:Any]) else { return }
            print(resultData)
            completion(resultData)
            
        }
    }
    
}
