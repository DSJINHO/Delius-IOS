//
//  UserBlockVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 30/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI
import CoreTelephony
class UserBlockVC:UIViewController,CNContactPickerDelegate{

    struct FetchedContact {
        var name:String
        var telephone: String
    }
    var blockUserPhone:String!
    var blockUserNativePhone:String!
    var blockUserName:String!
    var blockCountryCode:String!
    
    
    
    var contentView:UserBlockView!
    var service:PhoneBlockService!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        service = PhoneBlockService()
        service.delegate = self
        
        setup()
    }
    private func setup(){
        contentView = UserBlockView(frame: view.bounds)
        contentView.frame = view.bounds
        view.addSubview(contentView)
        
        contentView.listBtn.addTarget(self, action: #selector(listBtnFunc(_:)), for: .touchUpInside)
        contentView.backBtn.addTarget(self, action: #selector(backBtnFunc(_:)), for: .touchUpInside)
        contentView.listCollectionView.delegate = self
        contentView.listCollectionView.dataSource = self
        contentView.listCollectionView.register(PhoneBlockCell.self, forCellWithReuseIdentifier: "UserPhoneBlockCellid")
        
        contentView.contactBtn.addTarget(self, action: #selector(contactBtnFunc(_:)), for: .touchUpInside)
        contentView.sendCompleteBtn.addTarget(self, action: #selector(sendBtnFunc(_:)), for: .touchUpInside)
        
    }
    
    @objc func listBtnFunc(_ sender:UIButton){
        contentView.Animation(listOpen: true)
    }
    @objc func backBtnFunc(_ sender:UIButton){
        if contentView.opened{
            contentView.Animation(listOpen: false)
        }else{
            dismiss(animated: true, completion: {})
        }
    }
    @objc func pickerBtnFunc(_ sender:UIButton){
        
    }
    @objc func sendBtnFunc(_ sender:UIButton){
        
        print("button clicked")
        
        let intPhone = Int(blockUserNativePhone)
        let nsPhone = intPhone as! NSNumber
        var convertedPhone = nsPhone.stringValue
        
        convertedPhone = blockCountryCode + convertedPhone
        
        
        service.uploadBlockUser(name: blockUserName, phoneNumber: convertedPhone)
    }
    @objc func contactBtnFunc(_ sender:UIButton){
        
        let cnPicker = CNContactPickerViewController()
        cnPicker.delegate = self
        self.present(cnPicker, animated: true, completion: nil)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        
        

        let networkInfo = CTTelephonyNetworkInfo()
        let carrier = networkInfo.subscriberCellularProvider
        let countryCode = carrier?.isoCountryCode
        let upperCase = countryCode?.uppercased()
        print(upperCase,"@@@")
        
        let selected = contact.phoneNumbers[0].value.stringValue
        
        if selected.first == "+" {
            let strs = ClassifyCountryCode.ClassifyCountryCode(phoneNumber: selected)
            self.contentView.phoneEdt.text = strs[1]
            self.contentView.pickerBtn.setTitle(strs[0], for: .normal)
            blockUserPhone = strs[0] + strs[1]
            blockUserNativePhone = strs[1]
        }else{
            self.contentView.phoneEdt.text = selected
            blockUserPhone = selected
            blockUserNativePhone = selected
        }
        blockUserName = contact.familyName + contact.givenName

        blockCountryCode = contentView.pickerBtn.titleLabel?.text
        
        picker.dismiss(animated: true, completion: {
            
        })
    }
    
    func reload(){
        contentView.listCollectionView.reloadData()
    }

}
extension UserBlockVC:UICollectionViewDelegate{
    
}
extension UserBlockVC:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return service.blockedUsers.count
//        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserPhoneBlockCellid", for: indexPath) as! PhoneBlockCell
        cell.nameLabel.text = service.blockedUsers[indexPath.row].name
        cell.phoneLabel.text = service.blockedUsers[indexPath.row].ph
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
}
extension UserBlockVC:PhoneBlockDelegate{
    func reloadCollectionView() {
        reload()
    }
    
    func complete(success: Bool) {
        if success{
            ShowAlert.OnlyDefault(vc: self, title: "Good", message: "Success")
            contentView.phoneEdt.text = ""
        }else{
            ShowAlert.OnlyDefault(vc: self, title: "Error", message: "Error")
        }
    }
    

}
