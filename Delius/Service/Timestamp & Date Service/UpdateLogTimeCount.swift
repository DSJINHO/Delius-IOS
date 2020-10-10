//
//  UpdateDeliTimeCount.swift
//  Delius
//
//  Created by 박진호 on 2020/06/29.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

class UpdateLogTimeCount{
    var timer :Timer?
    
    func CalculateTime(from:Int64,label:UILabel){

        let calendar = Calendar.current
        let todayDate = Date()
        var fromSeconds = from
        
//        if from + 86400 < Int64(todayDate.timeIntervalSince1970){
//            label.text = "딜리로 표현하세요"
//            return
//        }

        let fromDate = Date.init(timeIntervalSince1970: Double(fromSeconds + 86400))
        let components = calendar.dateComponents([.hour,.minute,.second], from: todayDate, to: fromDate)
        
        let hour = (components.hour! < 10 ) ? "0\(components.hour!)" : "\(components.hour!)"
        let miniute = (components.minute! < 10) ? "0\(components.minute!)" : "\(components.minute!)"
        let seconds = (components.second! < 10 ) ? "0\(components.second!)" : "\(components.second!)"
        
        let string = "\(hour) : \(miniute) : \(seconds)"
        label.text = string
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (Timer) in

            let fromDate = Date.init(timeIntervalSince1970: Double(fromSeconds))
            let components = calendar.dateComponents([.hour,.minute,.second], from: fromDate, to: todayDate)
            
            let hour = components.hour!
            let miniute = components.minute!
            let seconds = components.second!
            
            let string = "\(hour) : \(miniute) : \(seconds)"
            label.text = string
            print(string)
            fromSeconds += 1
        })
    }
    func removeTimer(){
        if let timer = timer as? Timer{
            timer.invalidate()
        }
    }
    
}

