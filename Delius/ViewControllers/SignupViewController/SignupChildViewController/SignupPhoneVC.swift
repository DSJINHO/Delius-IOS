//
//  SignupPhoneVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 06/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

class SignupPhoneVC: UIViewController {
    
    var phoneAuthView:PhoneAuthView!
    var delegate:SignupPhoneProtocol?=nil
    
    var pickerArray = LocalPhoneString.localPhonePickerArray()
    var phoneStringArray = LocalPhoneString.localPhoneArray()
    var localPhoneString = "+82"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        setView()
        
    }
    func setKeyboard(){
        
        phoneAuthView.verifyEdtView.tf1.becomeFirstResponder()
    }
    func setView(){
        
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let subFrame = CGRect(x:0,y:0,width:view.frame.width,height:view.frame.height-topPadding - 60)
        
        phoneAuthView = PhoneAuthView(frame: subFrame)
        view.addSubview(phoneAuthView)
        phoneAuthView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        phoneAuthView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 0).isActive = true
        phoneAuthView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        phoneAuthView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        phoneAuthView.sendCompleteBtn.addTarget(self, action: #selector(sendFunc(_:)), for: .touchUpInside)
        phoneAuthView.localPickerView.pickView.delegate = self
        phoneAuthView.localPickerView.pickView.dataSource = self
        
        phoneAuthView.localPickerBtn.addTarget(self, action: #selector(localFunc(_:)), for: .touchUpInside)
        phoneAuthView.sendPhoneEdt.textField.addTarget(self, action: #selector(phoneEdtFunc(_:)), for: .touchDown)
        
        
        phoneAuthView.verifyEdtView.tf1.textField.delegate = self
        phoneAuthView.verifyEdtView.tf2.textField.delegate = self
        phoneAuthView.verifyEdtView.tf3.textField.delegate = self
        phoneAuthView.verifyEdtView.tf4.textField.delegate = self
        phoneAuthView.verifyEdtView.tf5.textField.delegate = self
        phoneAuthView.verifyEdtView.tf6.textField.delegate = self
        
        phoneAuthView.verifyEdtView.tf1.textField.addTarget(self, action: #selector(changeText(_:)), for: .editingChanged)
        phoneAuthView.verifyEdtView.tf2.textField.addTarget(self, action: #selector(changeText(_:)), for: .editingChanged)
        phoneAuthView.verifyEdtView.tf3.textField.addTarget(self, action: #selector(changeText(_:)), for: .editingChanged)
        phoneAuthView.verifyEdtView.tf4.textField.addTarget(self, action: #selector(changeText(_:)), for: .editingChanged)
        phoneAuthView.verifyEdtView.tf5.textField.addTarget(self, action: #selector(changeText(_:)), for: .editingChanged)
        phoneAuthView.verifyEdtView.tf6.textField.addTarget(self, action: #selector(changeText(_:)), for: .editingChanged)
    
        phoneAuthView.sendSubviewToBack(phoneAuthView.point)
    }

    
    @objc func sendFunc(_ sender:UIButton){
        
        var phoneNumber = phoneAuthView.sendPhoneEdt.textField.text
        
        if phoneNumber == nil || phoneNumber?.count == 0{
            ShowAlert.OnlyDefault(vc: self, title: "error".toLocal(), message:"PhoneAuthView005".toLocal())
            return
        }
        let intPhone = Int(phoneNumber!)
        let nsPhone = intPhone as! NSNumber
        var convertedPhone = nsPhone.stringValue
        
        convertedPhone = localPhoneString + convertedPhone
        delegate?.sendSMS(phoneNumber: convertedPhone)
        phoneAuthView.Animation(reverse: false){
            self.setKeyboard()
        }
        
    }
    @objc func localFunc(_ sender:UIButton){
        phoneAuthView.sendPhoneEdt.resignFirstResponder()
        phoneAuthView.pickerViewAnimation(reverse: false)
    }
    @objc func phoneEdtFunc(_ sender:UITextField){
        phoneAuthView.sendPhoneEdt.underline.layer.borderColor = UIColor.MainColor().cgColor
    }
    func verifyFunc(){
        let A = phoneAuthView.verifyEdtView.tf1.textField.text
        let B = phoneAuthView.verifyEdtView.tf2.textField.text
        let C = phoneAuthView.verifyEdtView.tf3.textField.text
        let D = phoneAuthView.verifyEdtView.tf4.textField.text
        let E = phoneAuthView.verifyEdtView.tf5.textField.text
        let F = phoneAuthView.verifyEdtView.tf6.textField.text
        if A == nil || A?.count == 0 || B == nil || B?.count == 0 || C == nil || C?.count == 0 || D == nil || D?.count == 0 ||  E == nil || E?.count == 0 || F == nil || F?.count == 0{
            ShowAlert.OnlyDefault(vc: self, title: "Empty", message: "asdf")
            return
        }
        let code = "\(A!)\(B!)\(C!)\(D!)\(E!)\(F!)"
        self.delegate?.complete(verificationCode: code)
    }
    @objc func changeText(_ sender:UITextField){
        switch sender{
        case phoneAuthView.verifyEdtView.tf1.textField:
            if phoneAuthView.verifyEdtView.tf1.textField.text?.count == 0{
                phoneAuthView.verifyEdtView.tf1.textField.becomeFirstResponder()
                
            }else{
                phoneAuthView.verifyEdtView.tf2.textField.becomeFirstResponder()
                phoneAuthView.verifyEdtView.tf1.underline.layer.borderColor = UIColor.MainColor().cgColor
            }
        case phoneAuthView.verifyEdtView.tf2.textField:
            if phoneAuthView.verifyEdtView.tf2.textField.text?.count == 0{
                phoneAuthView.verifyEdtView.tf2.textField.becomeFirstResponder()
                
            }else{
                phoneAuthView.verifyEdtView.tf3.textField.becomeFirstResponder()
                phoneAuthView.verifyEdtView.tf2.underline.layer.borderColor = UIColor.MainColor().cgColor
            }
        case phoneAuthView.verifyEdtView.tf3.textField:
            if phoneAuthView.verifyEdtView.tf3.textField.text?.count == 0{
                phoneAuthView.verifyEdtView.tf3.textField.becomeFirstResponder()
            }else{
                phoneAuthView.verifyEdtView.tf4.textField.becomeFirstResponder()
                phoneAuthView.verifyEdtView.tf3.underline.layer.borderColor = UIColor.MainColor().cgColor
            }
        case phoneAuthView.verifyEdtView.tf4.textField:
            if phoneAuthView.verifyEdtView.tf4.textField.text?.count == 0{
                phoneAuthView.verifyEdtView.tf4.textField.becomeFirstResponder()
                
            }else{
                phoneAuthView.verifyEdtView.tf5.textField.becomeFirstResponder()
                phoneAuthView.verifyEdtView.tf4.underline.layer.borderColor = UIColor.MainColor().cgColor
            }
        case phoneAuthView.verifyEdtView.tf5.textField:
            if phoneAuthView.verifyEdtView.tf5.textField.text?.count == 0{
                phoneAuthView.verifyEdtView.tf5.textField.becomeFirstResponder()
                
            }else{
                phoneAuthView.verifyEdtView.tf6.textField.becomeFirstResponder()
                phoneAuthView.verifyEdtView.tf5.underline.layer.borderColor = UIColor.MainColor().cgColor
            }
        case phoneAuthView.verifyEdtView.tf6.textField:
            if phoneAuthView.verifyEdtView.tf6.textField.text?.count == 0{
            }else{
                phoneAuthView.verifyEdtView.tf6.textField.resignFirstResponder()
                phoneAuthView.verifyEdtView.tf6.underline.layer.borderColor = UIColor.MainColor().cgColor
                verifyFunc()
            }
        default:()
        }
    }
}

extension SignupPhoneVC:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        phoneAuthView.localPickerBtn.setTitle(phoneStringArray[row], for: .normal)
        localPhoneString = phoneStringArray[row]
        phoneAuthView.pickerViewAnimation(reverse: true)
    }
}
extension SignupPhoneVC:UITextFieldDelegate{
}
