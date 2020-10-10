//
//  AddingGroupService.swift
//  Delius
//
//  Created by 박진호 on 2020/06/23.
//  Copyright © 2020 정윤환. All rights reserved.
//

import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseFunctions

class AddingGroupService:AddingGroup{
    
    override init() {
        super.init()
        
        db = Firestore.firestore()
        
        user = Auth.auth().currentUser
        
        functions = Functions.functions()
    }
    func checkUserByPhone(phArray:[String],completion:@escaping([String:Any])->Void){
        let requestData = ["phs":phArray]
        
        functions.httpsCallable("CheckPhone").call(requestData) { (result, error) in
            print(result,"이윤수")
            if let error = error as NSError? {
                print(error,"이윤수")
                completion(["type":"err"])
                return
                
            }
            guard let resultObject = (result?.data as? [String: Any]) else { return }
            if let resultData = resultObject["info"] as? [String:Any]{
                print(resultData)
                self.ag = resultData["bt"] as? Int
                self.ind2 = resultData["ind2"] as? Bool
                self.ps = resultData["ps"] as? Bool
                self.ms = resultData["ms"] as? Bool
                self.uid1 = resultData["uid1"] as? String
                self.uid2 = resultData["uid2"] as? String
                self.uid3 = resultData["uid3"] as? String
                self.uid4 = resultData["uid4"] as? String
            }
            
            completion(resultObject)
            
        }
    }
    func createGroup(completion:@escaping([String:Any])->Void){
        let requestData:[String:Any] = [
                            "gid":self.gid!,
                           "bt":self.ag!,
                           "ex":self.ex!,
                           "fo1":self.fo1!,
                           "fo2":self.fo2!,
                           "fo3":self.fo3!,
                           "ind2":self.ind2!,
                           "lo":self.lo!,
                           "lo1":self.lo1!,
                           "lo2":self.lo2!,
                           "ltp":self.ltp!,
                           "ms":self.ms!,
                           "na":self.na!,
                           "num":self.num!,
                           "ps":self.ps!,
                           "st":self.st!,
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
