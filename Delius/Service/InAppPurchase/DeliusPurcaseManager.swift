//
//  DeliusPurcase.swift
//  Delius
//
//  Created by user on 2020/10/05.
//  Copyright © 2020 정윤환. All rights reserved.
//

import StoreKit
import UIKit



class DeliusPurcaseManager : NSObject{
    static let shared = DeliusPurcaseManager()
    
    private override init(){
        super.init()
    }
}

enum DeliusPurchaseManagerError : Error{
    case noProductIDsFound
    case noProductsFound
    case paymentWasCancelled
    case productReqeustFailed
}
