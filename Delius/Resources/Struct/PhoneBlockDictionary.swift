//
//  PhoneBlockDictionary.swift
//  Delius
//
//  Created by user on 2020/08/05.
//  Copyright © 2020 정윤환. All rights reserved.
//
import FirebaseFirestore
import Foundation
class PhoneBlockDictionary:NSObject{
    var ph:String?
    var name:String?
    var tp:Timestamp?
    init(dictionary:[String:Any]){
        self.ph = dictionary["ph"] as? String
        self.name = dictionary["na"] as? String
        self.tp = dictionary["tp"] as? Timestamp
    }
}
