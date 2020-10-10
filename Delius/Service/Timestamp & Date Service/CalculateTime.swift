//
//  CalculateTime.swift
//  Delius
//
//  Created by user on 2020/08/23.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class CalculateTime{
    class func groupDateRange(start:Int64,end:Int,label:UILabel){
        let calendar = Calendar.current
        let startDate = Date.init(timeIntervalSince1970: Double(start))
        let endDate = Date.init(timeIntervalSince1970: Double(end))
        
        
        let startComponent = calendar.dateComponents([.year,.month,.day], from: startDate)
        let endComponent = calendar.dateComponents([.year,.month,.day], from: endDate)
        
        let sYear = "\(startComponent.year!)"
        let sMonth = (startComponent.month! < 10) ? "0\(startComponent.month!)" : "\(startComponent.month!)"
        let sDay = (startComponent.day! < 10) ? "0\(startComponent.day!)" : "\(startComponent.day!)"
        
        let eYear = "\(endComponent.year!)"
        let eMonth = (endComponent.month! < 10) ? "0\(endComponent.month!)" : "\(endComponent.month!)"
        let eDay = (endComponent.day! < 10) ? "0\(endComponent.day!)" : "\(endComponent.day!)"
        
        let sString = "\(sYear).\(sMonth).\(sDay)"
        let eString = "\(eYear).\(eMonth).\(eDay)"
        
        label.text = "\(sString) ~ \(eString)"
        
    }
}
