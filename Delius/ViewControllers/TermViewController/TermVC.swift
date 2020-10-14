//
//  TermVC.swift
//  Delius
//
//  Created by user on 2020/08/05.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
import SafariServices

private enum checkState{
    case checked
    case unchecked
}
class TermVC:UIViewController{
    
    var contentView:TermView!
    
    private var allCheck:checkState = .unchecked
    private var Check1:checkState = .unchecked
    private var Check2:checkState = .unchecked
    private var Check3:checkState = .unchecked
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    private func setup(){
        contentView = TermView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.allBtn.addTarget(self, action: #selector(allBtnFunc(_:)), for: .touchUpInside)
        contentView.termBtn1.addTarget(self, action: #selector(termBtnFunc(_:)), for: .touchUpInside)
        contentView.termBtn2.addTarget(self, action: #selector(termBtnFunc(_:)), for: .touchUpInside)
        contentView.termBtn3.addTarget(self, action: #selector(termBtnFunc(_:)), for: .touchUpInside)
        contentView.checkBtn1.addTarget(self, action: #selector(btnFunc(_:)), for: .touchUpInside)
        contentView.checkBtn2.addTarget(self, action: #selector(btnFunc(_:)), for: .touchUpInside)
        contentView.checkBtn3.addTarget(self, action: #selector(btnFunc(_:)), for: .touchUpInside)
        
        contentView.nextBtn.addTarget(self, action: #selector(nextBtnFunc(_:)), for: .touchUpInside)
        contentView.backBtn.addTarget(self, action: #selector(backBtnFunc(_:)), for: .touchUpInside)
        contentView.bringSubviewToFront(contentView.topLabel1)
        
    }
    @objc func backBtnFunc(_ sender:UIButton){
        dismiss(animated: true, completion: {})
    }
    @objc func allBtnFunc(_ sender:UIButton){
        checkPermission()
    }
    @objc func btnFunc(_ sender:UIButton){
        var checked : Bool!
        if sender == contentView.checkBtn1{
            checked = (Check1 == .checked) ? false : true
        }else if sender == contentView.checkBtn2{
            
            checked = (Check2 == .checked) ? false : true
        }else{
            
            checked = (Check3 == .checked) ? false : true
        }
        updateButton(Button: sender, check: checked)
    }
    @objc func nextBtnFunc(_ sender:UIButton){
        if allCheck == .unchecked{
            ShowAlert.OnlyDefault(vc: self, title: "TermView901".toLocal(), message: "TermView902".toLocal())
            return
        }
        guard let pvc = self.presentingViewController else { return }
        self.dismiss(animated: true, completion: {
            let vc = SignupVC()
            vc.setView(type: "phone")
            vc.modalPresentationStyle = .fullScreen
            pvc.present(vc, animated: true, completion: {})
        })
    }
    @objc func termBtnFunc(_ sender:UIButton){
        switch sender{
        case contentView.termBtn1:
            guard let url = URL(string: "https://www.delius-company.com/policy/terms") else { return }
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        case contentView.termBtn2:
            guard let url = URL(string: "https://www.delius-company.com/policy/privacy") else { return }
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        case contentView.termBtn3:
            guard let url = URL(string: "https://www.delius-company.com/policy/location") else { return }
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        default:()
        }
    }
    private func checkPermission(){
        let btns = [contentView.checkBtn1,contentView.checkBtn2,contentView.checkBtn3]
        if allCheck == .unchecked{
            for btn in btns{
                updateButton(Button: btn, check: true)
            }
        }else{
            for btn in btns{
                updateButton(Button: btn, check: false)
            }
        }
    }
    private func updateButton(Button:UIButton,check:Bool){
        if check{
            Button.layer.borderColor = UIColor.MainColor().cgColor
            Button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            Button.tintColor = .MainColor()
        }else{
            Button.layer.borderColor = UIColor.black.cgColor
            Button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            Button.tintColor = .black
        }
        if Button == contentView.checkBtn1{
            Check1 = (check) ? .checked : .unchecked
            updateCheck()
            return
        }
        if Button == contentView.checkBtn2{
            Check2 = (check) ? .checked : .unchecked
            updateCheck()
            return
        }
        if Button == contentView.checkBtn3{
            Check3 = (check) ? .checked : .unchecked
            updateCheck()
            return
        }
    }
    private func updateCheck(){
        if Check1 == .checked && Check2 == .checked && Check3 == .checked{
            allCheck = .checked
            contentView.allBtn.layer.borderColor = UIColor.MainColor().cgColor
            contentView.allBtn.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            contentView.allBtn.tintColor = .MainColor()
            contentView.nextBtn.backgroundColor = .black
        }else{
            allCheck = .unchecked
            contentView.allBtn.layer.borderColor = UIColor.black.cgColor
            contentView.allBtn.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            contentView.allBtn.tintColor = .black
            contentView.nextBtn.backgroundColor = .MainLightGrayColor()
        }
    }
}
