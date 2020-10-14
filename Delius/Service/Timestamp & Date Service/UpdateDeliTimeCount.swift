//
//  UpdateDeliTimeCount.swift
//  Delius
//
//  Created by 박진호 on 2020/06/29.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

class UpdateDeliTimeCount{
    var timer :Timer?
    
    func CalculateTime(from:Int64,label:UILabel){

        let calendar = Calendar.current
        let todayDate = Date()
        var fromSeconds = from
        ///수정
        if from + 86400 < Int64(todayDate.timeIntervalSince1970){
            label.text = "01:00:00"
            return
        }
        ///

        let fromDate = Date.init(timeIntervalSince1970: Double(fromSeconds + 86400))
        let components = calendar.dateComponents([.hour,.minute,.second], from: todayDate, to: fromDate)
        
        let hour = components.hour!
        let miniute = components.minute!
        let seconds = components.second!
        
        let string = "남은 시간 \(hour) : \(miniute) : \(seconds)"
        label.text = string
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (Timer) in

            let fromDate = Date.init(timeIntervalSince1970: Double(fromSeconds))
            let components = calendar.dateComponents([.hour,.minute,.second], from: fromDate, to: todayDate)
            
            let hour = components.hour!
            let miniute = components.minute!
            let seconds = components.second!
            
            let string = "남은 시간 \(hour) : \(miniute) : \(seconds)"
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
