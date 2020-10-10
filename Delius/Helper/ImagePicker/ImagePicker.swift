//
//  ImagePicker.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 04/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
import Photos
class ImagePicker:UIImagePickerController{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        delegate = self
        sourceType = .photoLibrary
        mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        checkPermission()
    }
    func checkPermission(){
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization({status in
                if status == .authorized{
                }else {
                    
                }
            })
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        self.dismiss(animated: true, completion: nil)
    }
}
extension ImagePicker:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
}
