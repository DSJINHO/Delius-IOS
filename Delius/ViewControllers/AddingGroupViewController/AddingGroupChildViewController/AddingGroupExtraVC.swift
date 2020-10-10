//
//  AddingGroupExtraVC.swift
//  Delius
//
//  Created by 박진호 on 2020/06/14.
//  Copyright © 2020 정윤환. All rights reserved.
//
protocol ProtocolAddingGroupExtra{
    func completeExtra(obj:[String:Any])
}
import UIKit
class AddingGroupExtraVC:UIViewController{
    var contentView:AddingGroupExtraView!
    var delegate:CreateGroupExtraDelegate?=nil
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
        contentView = AddingGroupExtraView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.extraEdt.delegate = self
        
        contentView.saveBtn.addTarget(self, action: #selector(completeBtnFUnc(_:)), for: .touchUpInside)
    }
    private func checkData(completion:@escaping(String)->Void={_ in }){
        let exString = contentView.extraEdt.text
        if exString == nil || exString?.count == 0 {
            
            return
        }
        completion(exString!)
        
    }
    @objc func completeBtnFUnc(_ sender:UIButton){
        checkData(completion: {(exString) in
            self.delegate?.transfer(extra: exString)
        })
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
            self.contentView.nsBtm.constant = -btmPadding
            self.view.layoutIfNeeded()
        })
    }
    
    @objc func handleKeyboardWillShow(_ notification: Notification) {
        let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
        let keyboardDuration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue
        
        UIView.animate(withDuration: keyboardDuration!, animations: {
            self.contentView.nsBtm.constant =   -keyboardFrame!.height
            self.view.layoutIfNeeded()
        })
    }
}
extension AddingGroupExtraVC:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = (textField.text!.utf16).count + (string.utf16).count - range.length
        contentView.extraByteLabel.text = String(newLength) + "/200"
        return true
    }
}
