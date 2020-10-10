//
//  CalculateAge.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 13/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import Foundation
final class CalculateAge{
    class func CalculateAgeFromBirth(Year y:Int,Month m:Int, Day d:Int)->String{
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year,.month,.day], from: date)
        let year = components.year!
        let month = components.month!
        let day = components.day!
        
        var age = year - y
        if m > month{
            age += 0
        }else{
            if d > day{
               age += 0
            }else{
                age -= 1
            }
        }
        
        return String(age)
    }
    class func returnAge(birth:Int)->String{
        let y = Int(birth/10000)
        let m = Int(birth/100) - y*100
        let d = birth - y*10000 - m*100
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year,.month,.day], from: date)
        let year = components.year!
        let month = components.month!
        let day = components.day!
        
        var age = year - y
        if m > month{
            age += 0
        }else{
            if d > day{
               age += 0
            }else{
                age -= 1
            }
        }
        return String(age)
        
    }
}
class CalculateChatTime{
    class func CalculateChatTime(seconds:Double) -> String{

        let calendar = Calendar.current
        let fromDate = Date.init(timeIntervalSince1970: Double(seconds))
        let component = calendar.dateComponents([.hour,.minute], from: fromDate)
        let hour = component.hour!
        let minute = component.minute!
        if minute < 10{
            return "\(hour):0\(minute)"
        }else{
            return "\(hour):\(minute)"
        }
    }
    class func cellTime(seconds:Double) -> String{
        let calendar = Calendar.current
        
        let todayDate = Date()
        let todayComponent = calendar.dateComponents([.month,.day], from: todayDate)
        
        
        let fromDate = Date.init(timeIntervalSince1970: Double(seconds))
        let component = calendar.dateComponents([.month,.day,.hour,.minute], from: fromDate)
        
        
        if todayComponent.month! == component.month! && todayComponent.day! == component.day!{
            let hour = component.hour!
            let minute = component.minute!
            if minute < 10{
                return "\(hour):0\(minute)"
            }else{
                return "\(hour):\(minute)"
            }
            
        }else{
            let month = component.month!
            let day = component.day!
            return "\(month)월 \(day)일"
        }
    }
}
