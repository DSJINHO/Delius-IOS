//
//  GroupInvitationService.swift
//  Delius
//
//  Created by user on 2020/07/26.
//  Copyright © 2020 정윤환. All rights reserved.
//

import Firebase
import FirebaseFunctions
class GroupInvitationService:NSObject{
    var functions:Functions!
    
    override init(){
        super.init()
        functions = Functions.functions()
        
    }
    func httpsResponseToInvitation(gid:String,state:Int,uids:[String],completion:@escaping([String:Any])->Void){
        let requestData:[String:Any] = ["gid":gid,"state":state,"uids":uids]
        functions.httpsCallable("ResponseToMyGroup").call(requestData){(result,err) in
            if let err = err as NSError?{
                print("here",err)
                completion(["type":"error"])
            }
            if let resultData = result?.data as? [String:Any]{
                print("here!",resultData)
                completion(resultData)
            }
        }
    }
    
}
