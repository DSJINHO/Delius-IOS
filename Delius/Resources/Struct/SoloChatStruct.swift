//
//  SoloChatStruct.swift
//  Delius
//
//  Created by 박진호 on 2020/07/04.
//  Copyright © 2020 정윤환. All rights reserved.
//
import UIKit
class SoloChatStruct{
    
    
    var tp:NSNumber?
    var name:String?
    var message:String?
    var uid:String?
    
    init(dictionary:[String:Any]){
        self.name = dictionary["name"] as? String
        self.tp = dictionary["tp"] as? NSNumber
        self.message = dictionary["message"] as? String
        self.uid = dictionary["uid"] as? String
    }
    
    
}
