//
//  ContactPermissionService.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 05/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
import Contacts
final class ContactPermissionService{
    class func initial()->Bool{
        let permission = CNContactStore.authorizationStatus(for: .contacts)
        if permission == .notDetermined{
            return false
        }else{
            return true
        }
        
    }
    class func requestPermission(viewController:UIViewController){
        let store = CNContactStore()
        let status = CNContactStore.authorizationStatus(for: .contacts)
        switch status{
        case .notDetermined:
            store.requestAccess(for: .contacts){(granted,error) in
                
            }
        case .denied, .restricted:
            ShowAlert.InduceToDeviceSettingForLocationPermission(inViewController: viewController)
        case .authorized:
            ShowAlert.OnlyDefault(vc: viewController, title: "PermissionAlert001".localize(), message: "")
        @unknown default:()
        }
    }
}
