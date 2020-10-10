//
//  RenewalCashItem.swift
//  Delius
//
//  Created by user on 2020/08/18.
//  Copyright © 2020 정윤환. All rights reserved.
//

import FirebaseFirestore
import FirebaseAuth
class RenewalCashItem{
    var cashItem:CashItemStruct!
    var db:Firestore!
    var sx:Bool?
    
    var likeTimer:Timer!
    var deliTimer:Timer!
    var logTimer:Timer!
    init(cashItem:CashItemStruct,db:Firestore,sx:Bool){
        self.cashItem = cashItem
        self.db = db
        self.sx = sx
        
        checkState()
    }
    private func checkState(){
        let nowSeconds = Date().timeIntervalSince1970
        
        var isLikeUpdate = false
        var isDeliUpdate = false
        var isLogUpdate = false
        
        
        let interval1 = cashItem.litp!.seconds - 86400
        print("interval",interval1)
        
        if let litp = cashItem.litp{
            if let likeCount = cashItem.like{
                var defaultCount = sx! ? 10 : 15
                if cashItem.plus!{
                    defaultCount = sx! ? 10 : 15
                }
                if likeCount != defaultCount{
                    let likeSeconds = litp.seconds
                    let interval = Int64(nowSeconds) - likeSeconds
                    let reverseInterval = 86400 - interval
                    if interval > Int64(24 * 60 * 60){
                        isLikeUpdate = true
                    }else{
                        if likeTimer != nil{
                            likeTimer = Timer.scheduledTimer(withTimeInterval: TimeInterval(reverseInterval), repeats: false, block: { (timer) in
                                self.shotCashLog()
                            })
                            
                        }
                    }
                }
            }
            
        }
        if let dltp = cashItem.dltp{
            if let deliCount = cashItem.deli{
                let defaultCount = cashItem.plus! ? 2 : 5
                if deliCount != defaultCount{
                    let deliSeconds = dltp.seconds
                    let interval = Int64(nowSeconds) - deliSeconds
                    let reverseInterval = 86400 - interval
                    if interval > Int64(24 * 60 * 60){
                        isDeliUpdate = true
                    }else{
                        if deliTimer != nil{
                            deliTimer = Timer.scheduledTimer(withTimeInterval: TimeInterval(reverseInterval), repeats: false, block: { (timer) in
                                self.shotCashLog()
                            })
                        }
                    }
                }
            }
        }
        if let logtp = cashItem.logTp{
            if let logCount = cashItem.log{
                let defaultCount = 3
                if logCount != defaultCount{
                    let logSeconds = logtp.seconds
                    let interval = Int64(nowSeconds) - logSeconds
                    let reverseInterval = 86400 - interval
                    if interval > Int64(24 * 60 * 60){
                        isLogUpdate = true
                    }else{
                        if logTimer == nil{
                            logTimer = Timer.scheduledTimer(withTimeInterval: TimeInterval(reverseInterval), repeats: false, block: { (timer) in
                                self.shotCashLog()
                            })
                        }
                    }
                }
            }
            
        }
        if (isLikeUpdate || isDeliUpdate || isLogUpdate){
            shotCashLog()
        }
        
    }
    private func shotCashLog(){
        guard let currentUser = Auth.auth().currentUser else { return }
        let ref = db.collection("cashlog").document(currentUser.uid).collection("cllist").document()
        let requestData : [String:Any] = ["sx":sx!,"tp":FieldValue.serverTimestamp()]
        ref.setData(requestData)
    }
    
}
