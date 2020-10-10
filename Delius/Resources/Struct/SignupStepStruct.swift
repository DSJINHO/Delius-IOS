//
//  SignupStepStruct.swift
//  Delius
//
//  Created by user on 2020/07/27.
//  Copyright © 2020 정윤환. All rights reserved.
//

import FirebaseFirestore
class SignupStepStruct{
    var bt:Int?
    var em:String?
    var ind:Int?
    var na:String?
    var ph:String?
    var plus:Bool?
    var s1tp:Timestamp?
    var s2tp:Timestamp?
    var s3tp:Timestamp?
    var sx:Bool?
    var uid:String?
    
    init(dictionary:[String:Any]){
        self.bt = dictionary["bt"] as? Int
        self.em = dictionary["em"] as? String
        self.ind = dictionary["ind"] as? Int
        self.na = dictionary["na"] as? String
        self.ph = dictionary["ph"] as? String
        self.plus = dictionary["plus"] as? Bool
        self.s1tp = dictionary["s1tp"] as? Timestamp
        self.s2tp = dictionary["s2tp"] as? Timestamp
        self.s3tp = dictionary["s3tp"] as? Timestamp
        self.sx = dictionary["sx"] as? Bool
        self.uid = dictionary["uid"] as? String
    }
    
}
