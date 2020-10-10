//
//  SignupVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 03/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//
private enum PageState{
    case none
    case PhoneView
    case EmailView
    case ProfileView
    case CompleteView
}
import UIKit
class SignupVC: UIViewController {
    var service:SignupService!
    var getLocationService:GetLocationService!
    
    var topView:SignupTopView!
    
    var phoneVC=SignupPhoneVC()
    var emailVC=SignupEmailVC()
    var profileVC=SignupProfileVC()
    var completionVC=SignupCompletionVC()
    
    
    
    
    var nsLeft1,nsLeft2,nsLeft3,nsLeft4:NSLayoutConstraint!
    
    private var currentPage : PageState = .none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        service = SignupService()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        getLocationService = GetLocationService()
        if currentPage == .PhoneView{
            phoneVC.phoneAuthView.sendPhoneEdt.becomeFirstResponder()
        }
        if currentPage == .CompleteView{
            completionVC.contentView.indicatorView.TimeAnimation()
        }
    }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return .slide
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override var prefersStatusBarHidden: Bool{
        return false
    }
    
    
    
    
    func sendSMS(ph:String){
        service.sendVerifyNumber(phoneNumber: ph){(success) in
            if !success {
                ShowAlert.VoidAlert(inViewController: self, title: "Error", message: "tryAgainn")
            }
            
        }
    }
    func verifySMS(code:String){
        
        let indicator = ShowMainIndicator(viewController: self)
        indicator.ShowIndicator()
        service.signinByPhoneNumber(verifyNumber: code){(result) in
            let Async = DispatchGroup()
            Async.enter()
            indicator.removeIndicator(){
                Async.leave()
            }
            Async.notify(queue: .main, execute: {
                guard let resultType = result["type"] as? String else{ return }
                print(resultType)
                switch resultType{
                case "err":
                    ShowAlert.VoidAlert(inViewController: self, title: "Error", message: "Error")
                case "requireEmail":
                    self.transitionToEmailView()
                case "requireProfile":
                    self.transitionToProfileView(currentPage: self.currentPage)
                case "requireBigquery":
                    self.transitionToCompletionView()
                case "complete":
                    self.goMain()
                case "createUser":
                    self.transitionToEmailView()
                default:()
                }
            })
        }
    }
    func linkWithEmail(email:String,password:String){

        let indicator = ShowMainIndicator(viewController: self)
        indicator.ShowIndicator()
        service.linkWithEmail(email: email, password: password){(result)in
            let Async = DispatchGroup()
            Async.enter()
            indicator.removeIndicator(){
                Async.leave()
            }
            Async.notify(queue: .main, execute: {
                guard let resultCode = result["type"] as? String else { return }
                switch resultCode{
                case "success":
                    self.topView.emailToProfileAnimation(wd: self.view.frame.width)
                    self.transitionToProfileView(currentPage: self.currentPage)
                default:
                    ShowAlert.OnlyDefault(vc: self, title: "Error", message: "message")
                }
            })
        }
    }

    func goMain(){
        let vc = RootVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: {
            self.dismiss(animated: false, completion: {})
            
        })
    }
    func profileComplete(){
        if getLocationService.longitude == nil || getLocationService.latitude == nil{
            ShowAlert.OnlyDefault(vc: self, title: "위치설정필요", message: "위치 설정 안하면 랜덤이다")
            getLocationService.randomLocation()
            return
        }
        if getLocationService.checkPermission(){
            getLocationService.catchLocation()
        }
        service.na = profileVC.profileAuthView.nameView.textField.text
        service.job = profileVC.profileAuthView.jobView.textField.text
        service.sx = profileVC.userSex
        service.bt = profileVC.userBirth
        service.st = profileVC.profileAuthView.statusView.textField.text
        service.fo1 = profileVC.fo1
        service.fo2 = profileVC.fo2
        service.fo3 = profileVC.fo3
        service.fo4 = profileVC.fo4
        service.lc = Locale.current.regionCode
        service.lo1 = getLocationService.latitude
        service.lo2 = getLocationService.longitude
        if profileVC.imgArray.count == 0{
            ShowAlert.OnlyDefault(vc: self, title: "", message: "이미지를 올려주세요")
            return
        }else{
            
        }
        let code = service.checkUserData()
        switch code{
        case "complete":
            let indicator = ShowMainIndicator(viewController: self)
            indicator.ShowIndicator()
            service.httpsCreateProfile(){(result) in
                guard let resultCode = result["type"] as? String else { return }
                switch resultCode{
                case "success":
                    self.service.uploadMultipleImages(imgs: self.profileVC.imgArray, completion: {(fails) in
                        if fails.count == 0{
                            self.service.verifyUID()
                            UserDefaults.standard.set("signupCompleted", forKey: self.service.uid!)
                            self.transitionToCompletionView()
                            SetUserDefault.whenSignupComplete(isMan: self.service.sx!, soloInfo: [self.service.fo1!,self.service.fo2!,self.service.fo3!,self.service.fo4!])
                        }
                        indicator.removeIndicator {
                            
                        }
                    })
                default :
                    ShowAlert.OnlyDefault(vc: self, title: "", message: "Error")
                    indicator.removeIndicator {
                        
                    }
                }
            }
        default :
            ShowAlert.OnlyDefault(vc: self, title: "", message: code.localize())
        }
    }
    func uploadUserProfile(imgs:[UIImage]){
        print(imgs)
    }
    
    
    private func transitionToEmailView(){
        let width = view.frame.width
        let Animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn, animations: {
            self.nsLeft1.constant = -width
            self.nsLeft2.constant = 0
            self.phoneVC.view.alpha = 0
            self.emailVC.view.alpha = 1
            self.topView.completeBtn.setTitleColor(UIColor.white, for: .normal)
            self.view.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            switch position{
            case .end:
                self.activeCompleteBtn(activate: true)
                self.currentPage = .EmailView
            default:()
            }
        }
    }
    private func transitionToProfileView(currentPage from:PageState){
        let width = view.frame.width
        let Animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn, animations: {
            if self.currentPage == .PhoneView{
                self.nsLeft1.constant = -width
                self.nsLeft3.constant = 0
                self.phoneVC.view.alpha = 0
                self.profileVC.view.alpha = 1
                self.topView.completeBtn.setTitleColor(UIColor.white, for: .normal)
            }else{
                self.nsLeft2.constant = -width
                self.nsLeft3.constant = 0
                self.emailVC.view.alpha = 0
                self.profileVC.view.alpha = 1
                self.topView.completeBtn.setTitleColor(UIColor.white, for: .normal)
            }
            self.view.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            switch position{
            case .end:
                self.activeCompleteBtn(activate: true)
                self.currentPage = .ProfileView
            default:()
            }
        }
    }
    private func transitionToCompletionView(){
        let width = view.frame.width
        let Animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn, animations: {
            self.nsLeft3.constant = -width
            self.nsLeft4.constant = 0
            self.profileVC.view.alpha = 0
            self.completionVC.view.alpha = 1
            self.topView.completeBtn.alpha = 0
            self.topView.cancelBtn.alpha = 0
            self.view.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            switch position{
            case .end:
                self.completionVC.contentView.indicatorView.TimeAnimation()
                self.currentPage = .CompleteView
                self.service.setListener()
            default:()
            }
        }
    }
    private func activeCompleteBtn(activate:Bool){
        if activate{
            topView.completeBtn.alpha = 1
            topView.completeBtn.isEnabled = true
            topView.completeBtn.setTitleColor(UIColor.white, for: .normal)
        }else{
            topView.completeBtn.alpha = 0
            topView.completeBtn.isEnabled = false
            topView.completeBtn.setTitleColor(UIColor.white, for: .normal)
        }
    }
    @objc func completeBtnFunc(_ sender:UIButton){
        switch currentPage{
        case .none:()
        case .PhoneView:
            transitionToEmailView()
            topView.PhoneToEmailAnimation(wd: view.frame.width)
        case .EmailView:
            let email = emailVC.emailAuthView.emailView.edt.text
            let password = emailVC.emailAuthView.passwordView1.edt!.text
            if email == nil || password == nil{
                ShowAlert.OnlyDefault(vc: self, title: "Error", message: "Error")
                return
            }
            linkWithEmail(email: email!, password: password!)
        case .ProfileView:
            self.profileComplete()
        case .CompleteView:
            service.setListener()
        }
    }
}
extension SignupVC{
    func setView(type:String){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        topView = SignupTopView(type:type,frame: CGRect(x:0,y:0,width:view.frame.width,height:60 + topPadding))
        
        
        view.addSubview(topView)
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        
        setProperty()
        switch type{
        case "phone":
            setupChildViewController()
        case "email":
            setupEmailView()
            topView.completeBtn.alpha = 1
        case "profile":
            setupProfileView()
            topView.completeBtn.alpha = 1
        case "listener":
            setupListenerView()
        default:()
        }
    }
    func setProperty(){
        topView.cancelBtn.addTarget(self, action: #selector(cancelFunc(_:)), for: .touchUpInside)
        
        phoneVC.delegate = self
        emailVC.delegate = self
        
        topView.completeBtn.addTarget(self, action: #selector(completeBtnFunc(_:)), for: .touchUpInside)
        
        
    }
    func setupChildViewController(){
        let width = view.frame.width
        addChild(phoneVC)
        view.addSubview(phoneVC.view)
        phoneVC.didMove(toParent: self)
        phoneVC.view.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        nsLeft1 = phoneVC.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
        nsLeft1.isActive = true
        phoneVC.view.widthAnchor.constraint(equalToConstant: width).isActive = true
        phoneVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        addChild(emailVC)
        view.addSubview(emailVC.view)
        emailVC.didMove(toParent: self)
        emailVC.view.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        nsLeft2 = emailVC.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: width)
        nsLeft2.isActive = true
        emailVC.view.widthAnchor.constraint(equalToConstant: width).isActive = true
        emailVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        addChild(profileVC)
        view.addSubview(profileVC.view)
        profileVC.didMove(toParent: self)
        profileVC.view.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        nsLeft3 = profileVC.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: width)
        nsLeft3.isActive = true
        profileVC.view.widthAnchor.constraint(equalToConstant: width).isActive = true
        profileVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        addChild(completionVC)
        view.addSubview(completionVC.view)
        completionVC.didMove(toParent: self)
        completionVC.view.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        nsLeft4 = completionVC.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: width)
        nsLeft4.isActive = true
        completionVC.view.widthAnchor.constraint(equalToConstant: width).isActive = true
        completionVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        currentPage = .PhoneView
        
    }
    func setupEmailView(){
        
        let width = view.frame.width
        addChild(phoneVC)
        view.addSubview(phoneVC.view)
        phoneVC.didMove(toParent: self)
        phoneVC.view.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        nsLeft1 = phoneVC.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -width)
        nsLeft1.isActive = true
        phoneVC.view.widthAnchor.constraint(equalToConstant: width).isActive = true
        phoneVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        addChild(emailVC)
        view.addSubview(emailVC.view)
        emailVC.didMove(toParent: self)
        emailVC.view.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        nsLeft2 = emailVC.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
        nsLeft2.isActive = true
        emailVC.view.widthAnchor.constraint(equalToConstant: width).isActive = true
        emailVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        addChild(profileVC)
        view.addSubview(profileVC.view)
        profileVC.didMove(toParent: self)
        profileVC.view.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        nsLeft3 = profileVC.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: width)
        nsLeft3.isActive = true
        profileVC.view.widthAnchor.constraint(equalToConstant: width).isActive = true
        profileVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        addChild(completionVC)
        view.addSubview(completionVC.view)
        completionVC.didMove(toParent: self)
        completionVC.view.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        nsLeft4 = completionVC.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: width)
        nsLeft4.isActive = true
        completionVC.view.widthAnchor.constraint(equalToConstant: width).isActive = true
        completionVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        currentPage = .EmailView
        emailVC.view.alpha = 1
    }
    func setupProfileView(){
        
        let width = view.frame.width
        addChild(phoneVC)
        view.addSubview(phoneVC.view)
        phoneVC.didMove(toParent: self)
        phoneVC.view.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        nsLeft1 = phoneVC.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -width)
        nsLeft1.isActive = true
        phoneVC.view.widthAnchor.constraint(equalToConstant: width).isActive = true
        phoneVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        addChild(emailVC)
        view.addSubview(emailVC.view)
        emailVC.didMove(toParent: self)
        emailVC.view.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        nsLeft2 = emailVC.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -width)
        nsLeft2.isActive = true
        emailVC.view.widthAnchor.constraint(equalToConstant: width).isActive = true
        emailVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        addChild(profileVC)
        view.addSubview(profileVC.view)
        profileVC.didMove(toParent: self)
        profileVC.view.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        nsLeft3 = profileVC.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
        nsLeft3.isActive = true
        profileVC.view.widthAnchor.constraint(equalToConstant: width).isActive = true
        profileVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        addChild(completionVC)
        view.addSubview(completionVC.view)
        completionVC.didMove(toParent: self)
        completionVC.view.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        nsLeft4 = completionVC.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: width)
        nsLeft4.isActive = true
        completionVC.view.widthAnchor.constraint(equalToConstant: width).isActive = true
        completionVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        currentPage = .ProfileView
        profileVC.view.alpha = 1
    }
    func setupListenerView(){
        
        let width = view.frame.width
        addChild(phoneVC)
        view.addSubview(phoneVC.view)
        phoneVC.didMove(toParent: self)
        phoneVC.view.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        nsLeft1 = phoneVC.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -width)
        nsLeft1.isActive = true
        phoneVC.view.widthAnchor.constraint(equalToConstant: width).isActive = true
        phoneVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        addChild(emailVC)
        view.addSubview(emailVC.view)
        emailVC.didMove(toParent: self)
        emailVC.view.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        nsLeft2 = emailVC.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -width)
        nsLeft2.isActive = true
        emailVC.view.widthAnchor.constraint(equalToConstant: width).isActive = true
        emailVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        addChild(profileVC)
        view.addSubview(profileVC.view)
        profileVC.didMove(toParent: self)
        profileVC.view.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        nsLeft3 = profileVC.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -width)
        nsLeft3.isActive = true
        profileVC.view.widthAnchor.constraint(equalToConstant: width).isActive = true
        profileVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        addChild(completionVC)
        view.addSubview(completionVC.view)
        completionVC.didMove(toParent: self)
        completionVC.view.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        nsLeft4 = completionVC.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
        nsLeft4.isActive = true
        completionVC.view.widthAnchor.constraint(equalToConstant: width).isActive = true
        completionVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        currentPage = .CompleteView
        completionVC.view.alpha = 1
    }
    @objc func cancelFunc(_ sender:UIButton){
        switch currentPage{
        case .none:()
        case .PhoneView:
            dismiss(animated: true, completion: {})
        case .EmailView:
            ShowAlert.VoidAlert(inViewController: self, title: "AuthView001".localize(), message: "AuthView101".localize())
        case .ProfileView:
            ShowAlert.VoidAlert(inViewController: self, title: "AuthView002".localize(), message: "AuthView101".localize())
        case .CompleteView:()
        }
    }
}

extension SignupVC:SignupPhoneProtocol{
    func complete(verificationCode code: String) {
        verifySMS(code: code)
    }
    func sendSMS(phoneNumber ph: String) {
        sendSMS(ph:ph)
    }
}
extension SignupVC:SignupEmailProtocol{
    func complete(email: String, password: String) {
        linkWithEmail(email: email, password: password)
    }
}
extension SignupVC:SignupProfileProtocol{
    func complete(profileUpload success: Bool) {
        
    }
}
extension SignupVC:signupServiceDelegate{
    func wait40Listener(ind: Int) {
        if ind == 0 {
            ShowAlert.OnlyDefault(vc: self, title: "에러", message: "InternalError")
            return
        }
        if ind == 40{
            let vc = RootVC()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: {})
            return
        }
        if ind == 50{
            ShowAlert.OnlyDefault(vc: self, title: "빅쿼리에러", message: "BigqueryError")
            return
        }
    }
}
