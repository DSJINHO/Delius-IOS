//
//  ClassifyCountryCode.swift
//  Delius
//
//  Created by user on 2020/08/05.
//  Copyright © 2020 정윤환. All rights reserved.
//

class ClassifyCountryCode{
    class func ClassifyCountryCode(phoneNumber:String) -> [String]{
        let codeArr = LocalPhoneString.localPhoneArray()
        var returnString = ""
        for code in codeArr{
            print("9999")
            print(code,"&&&&&")
            let isMatch = phoneNumber.contains(code)
            print(isMatch,"&&&")
            if isMatch{
                print("999999")
                returnString = phoneNumber
                for i in 0...code.count-1{
                    returnString.removeFirst()
                    print("9999999999")
                }
                return [code,returnString]
            }
        }
        return ["",""]
    }
}
