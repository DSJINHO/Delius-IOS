//
//  GetLocationPermission.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 02/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


import CoreLocation
import UIKit
class LocationService: NSObject, CLLocationManagerDelegate {
    var locationManager:CLLocationManager!
    
    
    class func initial()->Bool{
        let permission = CLLocationManager.authorizationStatus()
        if permission == .notDetermined{
            return false
        }else{
            return true
        }
    }
    
    func checkPermission(inViewController viewController:UIViewController){
        if CLLocationManager.authorizationStatus() == .notDetermined{
            getPermission()
        }else{
            moveDeviceSettings(viewController: viewController)
        }
    }
    private func getPermission(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    private func moveDeviceSettings(viewController:UIViewController){
        switch(CLLocationManager.authorizationStatus()) {
        case .authorizedAlways, .authorizedWhenInUse:
            ShowAlert.OnlyDefault(vc: viewController, title: "PermissionAlert001".localize(), message: "")
        case .notDetermined, .restricted, .denied:
            ShowAlert.InduceToDeviceSettingForLocationPermission(inViewController: viewController)
        default:()
        }
        
    }
    func checkStatus()->Bool{
        let status = CLLocationManager.authorizationStatus()
        if status == .notDetermined || status == .restricted || status == .denied{
            return false
        }else{
            return true
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse{
            
        }else{
            
        }
    }
}
