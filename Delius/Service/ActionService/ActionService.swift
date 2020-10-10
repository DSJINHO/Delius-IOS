//
//  ActionService.swift
//  Delius
//
//  Created by 박진호 on 2020/06/28.
//  Copyright © 2020 정윤환. All rights reserved.
//
import Firebase
import FirebaseFunctions
import FirebaseFirestore
class ActionService:NSObject{
    
    var functions:Functions!
    override init(){
        functions = Functions.functions()
    }
    func sendLikeSolo(uid:String,completion:@escaping([String:Any])->Void){
        let requestData = ["partnerUid":uid]
        
        functions.httpsCallable("SoloSendLike").call(requestData) { (result, error) in
            if let error = error as NSError? {
                completion(["type":"err"])
                return
                
            }
            guard let resultObject = (result?.data as? [String: Any]) else { return }
            
            completion(resultObject)
            
        }
    }
    func sendDeliSolo(uid:String,completion:@escaping([String:Any])->Void){
        let requestData = ["partnerUid":uid]
        
        functions.httpsCallable("SoloSendDeli").call(requestData) { (result, error) in
            if let error = error as NSError? {
                completion(["type":"err"])
                return
                
            }
            guard let resultObject = (result?.data as? [String: Any]) else { return }
            
            completion(resultObject)
        }
    }
    
    func sendPassSolo(uid:String,completion:@escaping([String:Any])->Void){
        let requestData = ["partnerUid":uid]
        
        functions.httpsCallable("SoloSendPass").call(requestData) { (result, error) in
            if let error = error as NSError? {
                completion(["type":"err"])
                return
                
            }
            guard let resultObject = (result?.data as? [String: Any]) else { return }
            
            completion(resultObject)
        }
    }
    func sendReportSolo(uid:String,type:Int,completion:@escaping([String:Any])->Void){
        let requestData = ["partnerUid":uid,"report":type] as [String:Any]
        
        functions.httpsCallable("SoloSendReport").call(requestData) { (result, error) in
            if let error = error as NSError? {
                completion(["type":"err"])
                return
                
            }
            guard let resultObject = (result?.data as? [String: Any]) else { return }
            
            completion(resultObject)
            
        }
    }
}
