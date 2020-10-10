//
//  UserSetSturct.swift
//  Delius
//
//  Created by user on 2020/08/06.
//  Copyright © 2020 정윤환. All rights reserved.
//

class UserSetStruct{
    var SetSoloUsing:Bool?
    var SetSoloSex:Bool?
    var SetSoloAgeMin:Int?
    var SetSoloAgeMax:Int?
    var SetSoloDistMin:Int?
    var SetSoloDistMax:Int?
    var SetSolofo1:Int?
    var SetSolofo2:Int?
    var SetSolofo3:Int?
    var SetSolofo4:Int?
    var SetGroup2Using:Bool?
    var SetGroup3Using:Bool?
    var SetGroup4Using:Bool?
    var SetGroupSex:Bool?
    var SetGroupAgeMin:Int?
    var SetGroupAgeMax:Int?
    var SetGroupDistMin:Int?
    var SetGroupDistMax:Int?
    var SetGroupfo1:Int?
    var SetGroupfo2:Int?
    var SetGroupfo3:Int?
    
    init(dic:[String:Any]){
        self.SetSoloUsing = dic["SetSoloUsing"] as? Bool
        self.SetSoloSex = dic["SetSoloSex"] as? Bool
        self.SetSoloAgeMin = dic["SetSoloAgeMin"] as? Int
        self.SetSoloAgeMax = dic["SetSoloAgeMax"] as? Int
        self.SetSoloDistMin = dic["SetSoloDistMin"] as? Int
        self.SetSoloDistMax = dic["SetSoloDistMax"] as? Int
        self.SetSolofo1 = dic["SetSolofo1"] as? Int
        self.SetSolofo2 = dic["SetSolofo2"] as? Int
        self.SetSolofo3 = dic["SetSolofo3"] as? Int
        self.SetSolofo4 = dic["SetSolofo4"] as? Int
        self.SetGroup2Using = dic["SetGroup2Using"] as? Bool
        self.SetGroup3Using = dic["SetGroup3Using"] as? Bool
        self.SetGroup4Using = dic["SetGroup4Using"] as? Bool
        self.SetGroupSex = dic["SetGroupSex"] as? Bool
        self.SetGroupAgeMin = dic["SetGroupAgeMin"] as? Int
        self.SetGroupAgeMin = dic["SetGroupAgeMax"] as? Int
        self.SetGroupDistMax = dic["SetGroupDistMin"] as? Int
        self.SetGroupDistMax = dic["SetGroupDistMax"] as? Int
        self.SetGroupfo1 = dic["SetGroupfo1"] as? Int
        self.SetGroupfo2 = dic["SetrRoupfo2"] as? Int
        self.SetGroupfo3 = dic["SetGroupfo3"] as? Int
    }
}
