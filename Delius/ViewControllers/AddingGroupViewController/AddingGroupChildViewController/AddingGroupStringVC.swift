//
//  AddingGroupStringVC.swift
//  Delius
//
//  Created by 박진호 on 2020/06/14.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

protocol ProtocolAddingGroupString{
    func completeString(obj:[String:Any])
}

class AddingGroupStringVC:UIViewController{
    var contentView:AddingGroupStringView!
    var delegate : CreateGroupNameDelegate? = nil
    var nsLeft:NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        contentView.openAnimation()
        setupKeyboardObservers()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(false)
        NotificationCenter.default.removeObserver(self)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    private func setup(){
        contentView = AddingGroupStringView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.nameEdt.delegate = self
        contentView.statusEdt.delegate = self
        
        contentView.saveBtn.addTarget(self, action: #selector(completeBtnFunc(_:)), for: .touchUpInside)
    }
    @objc func completeBtnFunc(_ sender:UIButton){
        var groupName:String!
        var groupStatus:String!
        
        if let str = contentView.nameEdt.text{
            if str.count < 5 || str.count > 20{
                contentView.errorLabel1.isHidden = false
                return
            }else{
                groupName = str
                contentView.errorLabel1.isHidden = true
            }
        }
        if let str = contentView.statusEdt.text{
            if str.count < 10 || str.count > 40{
                contentView.errorLabel2.isHidden = false
                return
            }else{
                groupStatus = str
                contentView.errorLabel2.isHidden = true
            }
        }
        
        
        self.delegate?.transfer(groupName: groupName, groupStatus: groupStatus)
        
        
        
    }
    func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func handleKeyboardWillHide(_ notification: Notification) {
        let keyboardDuration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue
        let window = UIApplication.shared.windows[0]
        let btmPadding = window.safeAreaInsets.bottom
        contentView.nsBtm.constant = 0
        UIView.animate(withDuration: keyboardDuration!, animations: {
            self.contentView.nsBtm.constant = -30 - btmPadding
            self.view.layoutIfNeeded()
        })
    }
    
    @objc func handleKeyboardWillShow(_ notification: Notification) {
        let window = UIApplication.shared.windows[0]
        let btmPadding = window.safeAreaInsets.bottom
        let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
        let keyboardDuration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue
        
        UIView.animate(withDuration: keyboardDuration!, animations: {
            self.contentView.nsBtm.constant =   -keyboardFrame!.height - 30
            self.view.layoutIfNeeded()
        })
    }
}
extension AddingGroupStringVC:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = (textField.text!.utf16).count + (string.utf16).count - range.length
        if textField == contentView.nameEdt{
            contentView.nameByteLabel.text = String(newLength)+"/20"
        }else{
            contentView.statusByteLabel.text = String(newLength) + "/40"
        }
        return true
    }
}
