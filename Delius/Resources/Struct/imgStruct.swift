//
//  imgStruct.swift
//  Delius
//
//  Created by user on 2020/07/25.
//  Copyright © 2020 정윤환. All rights reserved.
//

class imgStruct{
    var imgNa : String?
    var tp : Int?
    var isMain : String?
    var bucket:String?
    init(dictionary:[String:Any]){
        self.imgNa = dictionary["imgNa"] as? String
        self.tp = dictionary["tp"] as? Int
        self.isMain = dictionary["isMain"] as? String
        self.bucket = dictionary["bucket"] as? String
    }
}
