//
//  SettingVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 06/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//
private enum viewState{
    case none,email,phone,state,lang,push1,push2,version,notice,fqa,service
}
import UIKit
import Firebase
import FirebaseAuth
class SettingVC:UIViewController{
    
    private var currentView:viewState = .none
    var topView:SetTopView!
    var contentView:AppSettingView!
    
    
    let serviceInfoVC=AppServiceInfoVC()
    let myStateVC = MyServiceSettingVC()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override var prefersStatusBarHidden: Bool{
        return false
    }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return UIStatusBarAnimation.fade
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    private func setup(){
        
        contentView = AppSettingView(frame: view.bounds)
        view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        serviceInfoVC.delegate = self
        
        defaultSetting()
        contentView.cancelBtn.addTarget(self, action: #selector(cancelBtnFunc(_:)), for: .touchUpInside)
        
        contentView.AccountView.emailView.addTarget(self, action: #selector(emailAccountFunc(_:)), for: .touchUpInside)
        contentView.AccountView.phoneView.addTarget(self, action: #selector(phoneAccountFunc(_:)), for: .touchUpInside)
        contentView.AccountView.statusView.addTarget(self, action: #selector(serviceStateFunc(_:)), for: .touchUpInside)

        contentView.LanguageView.languageView.addTarget(self, action: #selector(languageFunc(_:)), for: .touchUpInside)
        
        contentView.AppInfoView.versionView.addTarget(self, action: #selector(versionFunc(_:)), for: .touchUpInside)
        contentView.AppInfoView.noticeView.addTarget(self, action: #selector(noticeFunc(_:)), for: .touchUpInside)
        contentView.AppInfoView.centerView.addTarget(self, action: #selector(fqaFunc(_:)), for: .touchUpInside)
        contentView.AppInfoView.serviceView.addTarget(self, action: #selector(serviceInfoFunc(_:)), for: .touchUpInside)
        
    }
    private func defaultSetting(){
        if let langCode = Locale.current.languageCode{
            if let langStr = Locale.current.localizedString(forLanguageCode: langCode){
                contentView.LanguageView.userLanguageLabel.text = langStr
            }
        }
        if let email = Auth.auth().currentUser?.email{
            contentView.AccountView.userEmailLabel.text = email
        }
        if let ph = Auth.auth().currentUser?.phoneNumber{
            contentView.AccountView.userPhoneLabel.text = ph
        }
    }
    @objc func cancelBtnFunc(_ sender:UIButton){
        switch currentView{
        case .none:
            dismiss(animated: true, completion: {})
        case .email:()
        case .phone:()
        case .state:
            contentView.slideCloseAnimation {
                self.currentView = .none
                self.removeMyStateVC()
            }
        case .lang:()
        case .push1:()
        case .push2:()
        case .version:()
        case .notice:()
        case .fqa:()
        case .service:
            contentView.slideCloseAnimation {
                self.removeServiceInfoVC()
                self.currentView = .none
            }
        }
    }
    @objc func languageFunc(_ sender:UIButton){
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
    @objc func emailAccountFunc(_ sender:UIButton){
        
    }
    @objc func phoneAccountFunc(_ sender:UIButton){
        
    }
    @objc func serviceStateFunc(_ sender:UIButton){
        contentView.titleLabel2.text = "SettingAccountView301".localize()
        createMyStateVC()
        contentView.slideOpenAnimation {
            self.currentView = .state
        }
    }
    @objc func versionFunc(_ sender:UIButton){
        let controller = ShowAppVersionVC(viewController: self)
        controller.ShowIndicator()
    }
    @objc func noticeFunc(_ sender:UIButton){
        if let url = URL(string: "https://www.delius-company.com/frequentlyaskedquestions.html") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    @objc func fqaFunc(_ sender:UIButton){
        if let url = URL(string: "https://www.delius-company.com/frequentlyaskedquestions.html") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    @objc func serviceInfoFunc(_ sender:UIButton){
        createServiceInfoVC()
        contentView.titleLabel2.text = "SettingAppInfoView401".localize()
        contentView.slideOpenAnimation {
            self.currentView = .service
        }
    }
    private func licenseBtnFunc(){
        let controller = ShowLicenseVC(viewController: self)
        controller.ShowIndicator()
    }
    private func companyBtnFunc(){
        
    }
    
    private func createServiceInfoVC(){
        serviceInfoVC.didMove(toParent: self)
        self.contentView.contentView.addSubview(serviceInfoVC.view)
        serviceInfoVC.view.topAnchor.constraint(equalTo: contentView.contentView.topAnchor).isActive = true
        serviceInfoVC.view.leftAnchor.constraint(equalTo: contentView.contentView.leftAnchor).isActive = true
        serviceInfoVC.view.rightAnchor.constraint(equalTo: contentView.contentView.rightAnchor).isActive = true
        serviceInfoVC.view.bottomAnchor.constraint(equalTo: contentView.contentView.bottomAnchor).isActive = true
    }
    private func removeServiceInfoVC(){
        serviceInfoVC.willMove(toParent: nil)
        serviceInfoVC.removeFromParent()
        serviceInfoVC.view.removeFromSuperview()
    }
    private func createMyStateVC(){
        myStateVC.didMove(toParent: self)
        self.contentView.contentView.addSubview(myStateVC.view)
        myStateVC.view.topAnchor.constraint(equalTo: contentView.contentView.topAnchor).isActive = true
        myStateVC.view.leftAnchor.constraint(equalTo: contentView.contentView.leftAnchor).isActive = true
        myStateVC.view.rightAnchor.constraint(equalTo: contentView.contentView.rightAnchor).isActive = true
        myStateVC.view.bottomAnchor.constraint(equalTo: contentView.contentView.bottomAnchor).isActive = true
    }
    private func removeMyStateVC(){
        myStateVC.willMove(toParent: nil)
        myStateVC.removeFromParent()
        myStateVC.view.removeFromSuperview()
    }
}

extension SettingVC:AppServiceInfoProtocol{
    func openLicenseVC() {
        licenseBtnFunc()
    }
    
    func openCompanyVC() {
        companyBtnFunc()
    }
    
    
}
