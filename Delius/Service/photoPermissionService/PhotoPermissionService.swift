//
//  PhotoPermissionService.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 05/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import Photos
import UIKit
final class PhotoPermissionService{
    class func initial()->Bool{
        let permission = PHPhotoLibrary.authorizationStatus()
        if permission == .notDetermined{
            return false
        }else{
            return true
        }
    }
    class func requestPhotoPermission(viewController:UIViewController){
        let photos = PHPhotoLibrary.authorizationStatus()
        switch photos{
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({status in
                if status == .authorized{
                }else {
                    
                }
            })
        case .restricted,.denied:
            ShowAlert.InduceToDeviceSettingForLocationPermission(inViewController: viewController)
        case .authorized:
            ShowAlert.OnlyDefault(vc: viewController, title: "PermissionAlert001".localize(), message: "")
        @unknown default:()
        }
    }
}
