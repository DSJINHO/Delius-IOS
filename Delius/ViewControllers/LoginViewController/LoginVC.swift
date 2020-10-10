//
//  LoginVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 03/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
import FirebaseStorage
class LoginVC:UIViewController{
    
    var service:SignupService!
    
    var loginView:LoginView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        service = SignupService()
        sample()
        setView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        loginView.openAimation()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func setView(){
        loginView = LoginView(frame: view.bounds)
        view.addSubview(loginView)
        loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        loginView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loginView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        loginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        loginView.cancelBtn.addTarget(self, action: #selector(dismissFunc(_:)), for: .touchUpInside)
        loginView.signupBtn.addTarget(self, action: #selector(signupFunc(_:)), for: .touchUpInside)
        loginView.findAccountBtn.addTarget(self, action: #selector(findAccountFunc(_:)), for: .touchUpInside)
        loginView.loginBtn.addTarget(self, action: #selector(loginBtnFunc(_:)), for: .touchUpInside)
        
        loginView.EmailEdt.textField.delegate = self
        loginView.PasswordEdt.textField.delegate = self
        
    }
    func sample(){
    }
    
    
    
    @objc func dismissFunc(_ sender:UIButton){
        dismiss(animated: true, completion: {})
    }
    @objc func loginBtnFunc(_ sender:UIButton){
        


//        let vc = TestVC()
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: {})
//        return;
        
        
        
        self.view.endEditing(true)
        sender.isEnabled = false
        
        let email = loginView.EmailEdt.textField.text
        let password = loginView.PasswordEdt.textField.text
        
        if email == nil || password == nil{
            ShowAlert.OnlyDefault(vc: self, title: "", message: "LoginView900".localize())
        }else{
            let indicator = ShowMainIndicator(viewController: self)
            indicator.ShowIndicator()
            service.emailLogin(email: email!, password: password!){(code) in
                let Async = DispatchGroup()
                Async.enter()
                indicator.removeIndicator(){
                    Async.leave()
                }
                
                Async.notify(queue: .main, execute: {
                    
                    
                    
                    guard let strCode = code["type"] as? String else{ return }
                    switch strCode{
                    case "invalidEmail":
                        ShowAlert.OnlyDefault(vc: self, title: "", message: "LoginView901".localize())
                    case "userDisabled":
                        ShowAlert.OnlyDefault(vc: self, title: "", message: "LoginView902".localize())
                    case "wrongPassword":
                        ShowAlert.OnlyDefault(vc: self, title: "", message: "LoginView903".localize())
                    case "etc":
                        ShowAlert.OnlyDefault(vc: self, title: "Error", message: "LoginView904".localize())
                    case "complete":
                        self.goMain()
                    case "requireProfile":
                        ShowAlert.handlerAlert(inViewController: self, title: "", message: "LoginView911", completion: {
                            self.goProfileSignup()
                        })
                    case "requireBigquery":
                        ShowAlert.handlerAlert(inViewController: self, title: "", message: "LoginView912", completion: {
                            self.goListenerSignup()
                        })
                    default:
                        ShowAlert.OnlyDefault(vc: self, title: "Error", message: "LoginView904".localize())
                    }
                    sender.isEnabled = true
                })
            }
        }
    }
    private func goMain(){
        let vc = RootVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: {})
    }
    private func goProfileSignup(){
        let vc = SignupVC()
        vc.setView(type: "profile")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: {})
    }
    private func goListenerSignup(){
        let vc = SignupVC()
        vc.setView(type: "listener")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: {})
    }
    
    @objc func signupFunc(_ sender:UIButton){
        
        let vc = SignupVC()
        vc.setView(type: "phone")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: {})
        
        
    }
    @objc func findAccountFunc(_ sender:UIButton){
        
        let vc = FindAccountVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: {})
        
    }
    
    
}
extension LoginVC:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
