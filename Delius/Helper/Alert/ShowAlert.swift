//
//  ShowAlert.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 05/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
final class ShowAlert{
    class func InduceToDeviceSettingForLocationPermission(inViewController viewController:UIViewController){
        let alertController = UIAlertController(title: "PermissionAlert002".localize(), message: "", preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Setting".localize(), style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in })
             }
        }
        let cancelAction = UIAlertAction(title: "Cancel".localize(), style: .default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        viewController.present(alertController, animated: true, completion: {})

    }
    class func OnlyDefault(vc:UIViewController,title:String,message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Ok".localize(), style: .default)
        alertController.addAction(settingsAction)
        vc.present(alertController, animated: true, completion: {})
    }
    class func VoidAlert(inViewController vc:UIViewController,title:String,message:String){
        let alertController = UIAlertController(title: title.localize(), message: message, preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Ok".localize(), style: .default) { (_) -> Void in
            vc.dismiss(animated: true, completion: {})
        }
        let cancelAction = UIAlertAction(title: "Cancel".localize(), style: .default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        vc.present(alertController, animated: true, completion: {})
    }
    class func handlerAlert(inViewController vc:UIViewController,title:String,message:String,completion:@escaping()->Void){
        let alertController = UIAlertController(title: title.localize(), message: message.localize(), preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Ok".localize(), style: .default) { (_) -> Void in
            completion()
        }
        let cancelAction = UIAlertAction(title: "Cancel".localize(), style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        vc.present(alertController, animated: true, completion: {})
    }
    
}

