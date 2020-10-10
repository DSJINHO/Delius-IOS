//
//  AddingGroupMemberVC.swift
//  Delius
//
//  Created by 박진호 on 2020/06/14.
//  Copyright © 2020 정윤환. All rights reserved.
//
protocol ProtocolAddingGroupMember{
    func completeMember(obj:[String:Any])
    func checkUser(phoneList:[String])
}
import UIKit

class AddingGroupMemberVC:UIViewController{
    enum memberCount{
        case two
        case three
        case four
    }
    
    var contentView:AddingGroupMemberView!
    var delegate:CreateGroupMemberDelegate?=nil
    var currentMember:memberCount?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        setup()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        self.contentView.openAnimation()
    }
    private func setup(){
        contentView = AddingGroupMemberView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.phoneView1.phoneEdt.delegate = self
        contentView.phoneView2.phoneEdt.delegate = self
        contentView.phoneView3.phoneEdt.delegate = self
        
        contentView.twoBtn.addTarget(self, action: #selector(countBtnFunc(_:)), for: .touchUpInside)
        contentView.threeBtn.addTarget(self, action: #selector(countBtnFunc(_:)), for: .touchUpInside)
        contentView.fourBtn.addTarget(self, action: #selector(countBtnFunc(_:)), for: .touchUpInside)
        
        contentView.saveBtn.addTarget(self, action: #selector(completeBtnFunc(_:)), for: .touchUpInside)
    }
    @objc override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func countBtnFunc(_ sender:UIButton){
        let btns = [contentView.twoBtn,contentView.threeBtn,contentView.fourBtn]
        for btn in btns{
            if btn == sender{
                btn.backgroundColor = UIColor.MainGrayColor()
            }else{
                btn.backgroundColor = UIColor.MainLightGrayColor()
            }
        }
        switch sender {
        case contentView.twoBtn:
            currentMember = .two
            contentView.phoneView1.isHidden = false
            contentView.phoneView2.isHidden = true
            contentView.phoneView3.isHidden = true
        case contentView.threeBtn:
            currentMember = .three
            contentView.phoneView1.isHidden = false
            contentView.phoneView2.isHidden = false
            contentView.phoneView3.isHidden = true
        case contentView.fourBtn:
            currentMember = .four
            contentView.phoneView1.isHidden = false
            contentView.phoneView2.isHidden = false
            contentView.phoneView3.isHidden = false
        default:()
        }
    }
    private func checkUserByPhone(completion:@escaping([String])->Void){
        let currentMemberCount = currentMember
        var phoneArray=[String]()
        
        if currentMemberCount == nil{
            ShowAlert.OnlyDefault(vc: self, title: "", message: "초대할 인원의 전화번호를 적어주세요.")
            return
        }
        if currentMemberCount == .two{
            let user2Phone = contentView.phoneView1.phoneEdt.text
            if user2Phone == nil || user2Phone?.count == 0{
                ShowAlert.OnlyDefault(vc: self, title: "", message: "초대할 인원의 전화번호를 적어주세요.")
                return
            }
            phoneArray = [user2Phone!]
            
        }
        if currentMemberCount == .three{
            let user2Phone = contentView.phoneView1.phoneEdt.text
            let user3Phone = contentView.phoneView2.phoneEdt.text
            if user2Phone == nil || user3Phone == nil || user2Phone?.count == 0 || user3Phone?.count == 0{
                ShowAlert.OnlyDefault(vc: self, title: "", message: "초대할 인원의 전화번호를 적어주세요.")
                return
            }
            phoneArray = [user2Phone!,user3Phone!]
        }
        if currentMemberCount == .four{
            let user2Phone = contentView.phoneView1.phoneEdt.text
            let user3Phone = contentView.phoneView2.phoneEdt.text
            let user4Phone = contentView.phoneView3.phoneEdt.text
            if user2Phone == nil || user3Phone == nil || user4Phone == nil || user2Phone?.count == 0 || user3Phone?.count == 0 || user4Phone?.count == 0{
                ShowAlert.OnlyDefault(vc: self, title: "", message: "초대할 인원의 전화번호를 적어주세요.")
                return
            }
            phoneArray = [user2Phone!,user3Phone!,user4Phone!]
            return
        }
        print("PHONEARRAY",phoneArray)
        completion(phoneArray)
    }
    @objc func completeBtnFunc(_ sender:UIButton){
        checkUserByPhone { (phArr) in
            self.delegate?.onCallFunction(phs: phArr)
        }
    }
}
extension AddingGroupMemberVC:UITextFieldDelegate{
    
}
