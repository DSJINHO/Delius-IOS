//
//  TestVC.swift
//  Delius
//
//  Created by user on 2020/08/02.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
import FirebaseAnalytics
import Firebase
class TestVC:UIViewController{
    
    var analytics:Analytics!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseAnalytics.Analytics.logEvent("TestEvent", parameters: ["name":"yoonhwan"])
        FirebaseAnalytics.Analytics.setUserProperty("man", forName: "sex")
    }
    private func sample(){
        
    }
    
}
