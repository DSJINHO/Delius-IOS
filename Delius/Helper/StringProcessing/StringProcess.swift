//
//  StringProcess.swift
//  Delius
//
//  Created by user on 2020/08/05.
//  Copyright © 2020 정윤환. All rights reserved.
//

class StringProcess{
    class func filterEmpty(inputStr:String)->String{
        let resultString = inputStr.trimmingCharacters(in: .whitespacesAndNewlines)
        return resultString
    }
}
