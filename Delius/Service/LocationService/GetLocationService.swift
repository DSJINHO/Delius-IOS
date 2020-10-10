//
//  GetLocationService.swift
//  Delius
//
//  Created by 박진호 on 2020/06/21.
//  Copyright © 2020 정윤환. All rights reserved.
//


import CoreLocation
import UIKit
class GetLocationService: NSObject, CLLocationManagerDelegate {
    var locationManager:CLLocationManager!
    var latitude:Int?
    var longitude:Int?
    
    override init() {
        super.init()
        if self.checkPermission(){
            getPermission()
        }
        
    }
    
    func checkPermission()->Bool{
        let permission = CLLocationManager.authorizationStatus()
        if permission == .notDetermined || permission == .denied || permission == .restricted{
            return false
        }else{
            return true
        }
    }
    
    private func getPermission(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
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
    func catchLocation(){
        locationManager.startUpdatingLocation()
    }
    func randomLocation(){
        self.latitude = Int.random(in: 37000000..<38000000)
        self.longitude = Int.random(in: 127000000..<128000000)
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
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locationManager.location?.coordinate{
            self.latitude = Int(floor(coordinate.latitude*1000000))
            self.longitude = Int(floor(coordinate.longitude*1000000))
            if self.latitude != nil && self.longitude != nil{
                locationManager.stopUpdatingLocation()
            }
        }
    }
}
