//
//  AppServiceInfoVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 26/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//
protocol AppServiceInfoProtocol {
    func openLicenseVC()
    func openCompanyVC()
}
import UIKit

class AppServiceInfoVC: UIViewController {
    
    var contentView:AppSettingServiceView!
    var delegate:AppServiceInfoProtocol? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        setup()
    }
    private func setup(){
        contentView = AppSettingServiceView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        contentView.serviceTermView.addTarget(self, action: #selector(serviceTermFunc(_:)), for: .touchUpInside)
        contentView.privacyTermView.addTarget(self, action: #selector(privacyTermFunc(_:)), for: .touchUpInside)
        contentView.locationTermView.addTarget(self, action: #selector(locationTermFunc(_:)), for: .touchUpInside)
        contentView.licenseTermView.addTarget(self, action: #selector(licenseBtnFunc(_:)), for: .touchUpInside)
        contentView.companyView.addTarget(self, action: #selector(companyBtnFunc(_:)), for: .touchUpInside)
    }
    
    @objc func serviceTermFunc(_ sender:UIButton){
        
        if let url = URL(string: "https://www.delius-company.com/terms-of-service.html") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    @objc func privacyTermFunc(_ sender:UIButton){
        
        if let url = URL(string: "https://www.delius-company.com/privacyofservice.html") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    @objc func locationTermFunc(_ sender:UIButton){
        
        if let url = URL(string: "https://www.delius-company.com/locationservice.html") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    @objc func licenseBtnFunc(_ sender:UIButton){
        delegate?.openLicenseVC()
    }
    @objc func companyBtnFunc(_ sender:UIButton){
        delegate?.openCompanyVC()
    }
}
