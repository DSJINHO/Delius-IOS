//
//  newImgStruct.swift
//  Delius
//
//  Created by user on 2020/09/05.
//  Copyright © 2020 정윤환. All rights reserved.
//
import UIKit
class newImgStruct{
    var url:URL?
    var uid:String?
    var bucket:String?
    var img:UIImage?
    init(imgName:String,bucket:String,img:UIImage){
        self.uid = imgName
        self.bucket = bucket
        self.img = img
    }
    init(url:URL){
        self.url = url
    }
}
