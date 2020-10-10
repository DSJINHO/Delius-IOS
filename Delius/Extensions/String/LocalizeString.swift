//
//  LocalizeString.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 11/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
extension String {
    func localize(bundle: Bundle = .main, tableName: String = "LocalizedString") -> String{
        return NSLocalizedString(self, tableName: tableName, value: "\(self)", comment: "")
    }
    
    func toLocal(bundle: Bundle = .main, tableName: String = "toLocal") -> String{
        return NSLocalizedString(self, tableName: tableName, value: "\(self)", comment: "")
    }
}


