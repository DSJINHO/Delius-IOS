//
//  RandomGenerateService.swift
//  Delius
//
//  Created by 박진호 on 2020/06/21.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class RandomGenerateService{
    class func GeneratePhotoName(length:Int)->String{

        let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let allowedCharsCount = UInt32(allowedChars.count)
        var randomString = ""

        for _ in 0..<length {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
            let newCharacter = allowedChars[randomIndex]
            randomString += String(newCharacter)
        }

        return randomString
    }
}
