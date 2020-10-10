//
//  SoloListStruc.swift
//  Delius
//
//  Created by 박진호 on 2020/07/04.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SoloListStruct:NSObject{
    var tp:NSNumber?
    var uid:String?
    var r:Bool?
    var message:String?
    var who:String?
    
    init(dictionary:[String:Any]){
        self.tp = dictionary["tp"] as? NSNumber
        self.uid = dictionary["uid"] as? String
        self.r = dictionary["r"] as? Bool
        self.message = dictionary["message"] as? String
        self.who = dictionary["who"] as? String
    }
}
