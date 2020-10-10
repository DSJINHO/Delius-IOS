//
//  SetUserDefault.swift
//  Delius
//
//  Created by user on 2020/08/06.
//  Copyright © 2020 정윤환. All rights reserved.
//
import Foundation
class SetUserDefault{
    class func whenSignupComplete(isMan:Bool,soloInfo:[Int]){
        let userDefaultObject : [String:Any] = ["SetSoloUsing":true,
                                     "SetSoloSex":!isMan,
                                     "SetSoloAgeMin":18,
                                     "SetSoloAgeMax":40,
                                     "SetSoloDistMin":3,
                                     "SetSoloDistMax":30,
                                     "SetSolofo1":soloInfo[0],
                                     "SetSolofo2":soloInfo[1],
                                     "SetSolofo3":soloInfo[2],
                                     "SetSolofo4":soloInfo[3],
                                     "SetGroup2Using":true,
                                     "SetGroup3Using":true,
                                     "SetGroup4Using":true,
                                     "SetGroupSex":!isMan,
                                     "SetGroupAgeMin":18,
                                     "SetGroupAgeMax":40,
                                     "SetGroupDistMin":3,
                                     "SetGroupDistMax":30,
                                     "SetGroupfo1":Int.random(in: 0..<8),
                                     "SetGroupfo2":Int.random(in: 0..<8),
                                     "SetGroupfo3":Int.random(in: 0..<8)
        ]
        let data = UserSetStruct(dic: userDefaultObject)
        UserDefaults.standard.setValue(data, forKey: "UserSetting")
        
    }
}
