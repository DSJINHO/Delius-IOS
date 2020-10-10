//
//  CreateGroupVC.swift
//  Delius
//
//  Created by user on 2020/09/09.
//  Copyright © 2020 정윤환. All rights reserved.
//
private enum pageState{
    case main
    case stringVC
    case memberVC
    case tagVC
    case locationVC
    case extraVC
}
import UIKit
class CreateGroupVC:UIViewController{
    
    var contentView:CreateGroupView!
    
    var groupNameVC:AddingGroupStringVC!
    var groupMemberVC:AddingGroupMemberVC!
    var groupTagVC:AddingGroupTagVC!
    var groupLocationVC:AddingGroupLocationVC!
    var groupExtraVC:AddingGroupExtraVC!
    
    
    var tapGestureName:UITapGestureRecognizer!
    var tapGestureMember:UITapGestureRecognizer!
    var tapGestureTag:UITapGestureRecognizer!
    var tapGestureLocation:UITapGestureRecognizer!
    var tapGestureExtra:UITapGestureRecognizer!
    var tapGestureCreate:UITapGestureRecognizer!
    
    var inviteAlertVC:CreateGroupAlertVC!
    var tagAlertVC:CreateGroupNoInfoVC!
    var decideAVC:CreateGroupDecisionAVC!
    
    var service:CreateGroupService!
    
    private var currentPage : pageState = .main
    private var currentStep:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        service = CreateGroupService()
        
        
        
    }
    
    private func setup(){
        
        contentView = CreateGroupView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tapGestureName = UITapGestureRecognizer(target: self, action: #selector(nameTapFunc(_:)))
        tapGestureMember = UITapGestureRecognizer(target: self, action: #selector(memberTapFunc(_:)))
        tapGestureTag = UITapGestureRecognizer(target: self, action: #selector(tagTapFunc(_:)))
        tapGestureLocation = UITapGestureRecognizer(target: self, action: #selector(locationTapFunc(_:)))
        tapGestureExtra = UITapGestureRecognizer(target: self, action: #selector(extraTapFunc(_:)))
        tapGestureCreate = UITapGestureRecognizer(target: self, action: #selector(createTapFunc(_:)))
        
        contentView.backBtn.addTarget(self, action: #selector(backBtnFunc(_:)), for: .touchUpInside)
        
        contentView.tapView1.addGestureRecognizer(tapGestureName)
        contentView.tapView2.addGestureRecognizer(tapGestureMember)
        contentView.tapView3.addGestureRecognizer(tapGestureTag)
        contentView.tapView4.addGestureRecognizer(tapGestureLocation)
        contentView.tapView5.addGestureRecognizer(tapGestureExtra)
        contentView.tapView6.addGestureRecognizer(tapGestureCreate)
        
    }
    @objc func backBtnFunc(_ sender:UIButton){
        if self.currentPage == .main{
            self.dismiss(animated: true, completion: {})
        }
        if self.currentPage == .stringVC{
            closeNameVC()
        }
        if self.currentPage == .memberVC{
            closeMemberVC()
        }
        if self.currentPage == .tagVC{
            closeTagVC()
        }
        if self.currentPage == .locationVC{
            closeLocationVC()
            
        }
        if self.currentPage == .extraVC{
            closeExtraVC()
        }
    }
    @objc private func nameTapFunc(_ sender:UITapGestureRecognizer){
        self.showNameVC()
    }
    
    @objc private func memberTapFunc(_ sender:UITapGestureRecognizer){
        if currentStep < 1{
            return
        }
        self.showMemberVC()
    }
    
    @objc private func tagTapFunc(_ sender:UITapGestureRecognizer){
        if currentStep < 2{
            return
        }
        self.showTagVC()
    }
    
    @objc private func locationTapFunc(_ sender:UITapGestureRecognizer){
        if currentStep < 3{
            return
        }
        self.showLocationVC()
    }
    
    @objc private func extraTapFunc(_ sender:UITapGestureRecognizer){
        if currentStep < 4{
            return
        }
        self.showExtraVC()
    }
    @objc private func createTapFunc(_ sender:UITapGestureRecognizer){
        self.createGroup()
    }
    private func closeNameVC(){
        if groupNameVC == nil{
            return
        }
        groupNameVC.contentView.closeAnimation {
            self.groupNameVC.dismiss(animated: false, completion: {
                self.groupNameVC.view.removeFromSuperview()
                self.groupNameVC.removeFromParent()
                self.groupNameVC = nil
                self.currentPage = .main
            })
        }
    }
    private func closeMemberVC(){
        if groupMemberVC == nil{
            return
        }
        groupMemberVC.contentView.closeAnimation {
            self.groupMemberVC.dismiss(animated: false, completion: {
                self.groupMemberVC.view.removeFromSuperview()
                self.groupMemberVC.removeFromParent()
                self.groupMemberVC = nil
                self.currentPage = .main
            })
        }
    }
    private func closeTagVC(){
        if groupTagVC == nil{
            return
        }
        groupTagVC.contentView.closeAnimation {
            self.groupTagVC.dismiss(animated: false, completion: {
                self.groupTagVC.view.removeFromSuperview()
                self.groupTagVC.removeFromParent()
                self.groupTagVC = nil
                self.currentPage = .main
            })
        }
    }
    private func closeLocationVC(){
        if groupLocationVC == nil{
            return
        }
        groupLocationVC.contentView.closeAnimation {
            self.groupLocationVC.dismiss(animated: false, completion: {
                self.groupLocationVC.view.removeFromSuperview()
                self.groupLocationVC.removeFromParent()
                self.groupLocationVC = nil
                self.currentPage = .main
            })
        }
        
    }
    private func closeExtraVC(){
        if groupExtraVC == nil{
            return
        }
        groupExtraVC.contentView.closeAnimation {
            self.groupExtraVC.dismiss(animated: false, completion: {
                self.groupExtraVC.view.removeFromSuperview()
                self.groupExtraVC.removeFromParent()
                self.groupExtraVC = nil
                self.currentPage = .main
            })
        }
    }
    private func showNameVC(){
        if currentPage != .main{
            return
        }
        groupNameVC = AddingGroupStringVC()
        groupNameVC.delegate = self
        contentView.addSubview(groupNameVC.view)
        groupNameVC.view.topAnchor.constraint(equalTo: contentView.topView.bottomAnchor).isActive = true
        groupNameVC.view.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        groupNameVC.view.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        groupNameVC.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        
        if let groupName = service.groupName{
            groupNameVC.contentView.nameEdt.text = groupName
        }
        if let groupStatus = service.groupStatus{
            groupNameVC.contentView.statusEdt.text = groupStatus
        }
        
        self.currentPage = .stringVC
    }
    
    private func showMemberVC(){
        if currentPage != .main{
            return
        }
        groupMemberVC = AddingGroupMemberVC()
        groupMemberVC.delegate = self
        contentView.addSubview(groupMemberVC.view)
        groupMemberVC.view.topAnchor.constraint(equalTo: contentView.topView.bottomAnchor).isActive = true
        groupMemberVC.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        groupMemberVC.view.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        groupMemberVC.view.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        self.currentPage = .memberVC
    }
    
    private func showTagVC(){
        if currentPage != .main{
            return
        }
        groupTagVC = AddingGroupTagVC()
        groupTagVC.delegate = self
        contentView.addSubview(groupTagVC.view)
        groupTagVC.view.topAnchor.constraint(equalTo: contentView.topView.bottomAnchor).isActive = true
        groupTagVC.view.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        groupTagVC.view.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        groupTagVC.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        self.currentPage = .tagVC
    }
    
    private func showLocationVC(){
        if currentPage != .main{
            return
        }
        groupLocationVC = AddingGroupLocationVC()
        contentView.addSubview(groupLocationVC.view)
        groupLocationVC.view.topAnchor.constraint(equalTo: contentView.topView.bottomAnchor).isActive = true
        groupLocationVC.view.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        groupLocationVC.view.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        groupLocationVC.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        groupLocationVC.delegate = self
        self.currentPage = .locationVC
    }
    
    private func showExtraVC(){
        if currentPage != .main{
            return
        }
        groupExtraVC = AddingGroupExtraVC()
        groupExtraVC.delegate = self
        contentView.addSubview(groupExtraVC.view)
        groupExtraVC.view.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        groupExtraVC.view.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        groupExtraVC.view.topAnchor.constraint(equalTo: contentView.topView.bottomAnchor).isActive = true
        groupExtraVC.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        self.currentPage = .extraVC
    }
    private func animateMember(){
        contentView.tapView1.subLabel.text = service.groupName! + service.groupStatus!
        currentStep = 1
        closeNameVC()
        contentView.tapView2.imgView.backgroundColor = UIColor.MainColor()
        contentView.tapView2.nameLabel.textColor = UIColor.blackType1()
        contentView.tapView2.subLabel.textColor = UIColor.blackType1()
    }
    private func animateTag(){
        closeMemberVC()
        currentStep = 2
        contentView.tapView3.imgView.backgroundColor = UIColor.MainColor()
        contentView.tapView3.nameLabel.textColor = UIColor.blackType1()
        contentView.tapView3.subLabel.textColor = UIColor.blackType1()
    }
    private func animateLocation(str1:String,str2:String,str3:String){
        closeTagVC()
        contentView.tapView3.subLabel.text = str1 + str2 + str3
        currentStep = 3
        contentView.tapView4.imgView.backgroundColor = UIColor.MainColor()
        contentView.tapView4.nameLabel.textColor = UIColor.blackType1()
        contentView.tapView4.subLabel.textColor = UIColor.blackType1()
    }
    private func animateExtra(lo:String){
        closeLocationVC()
        contentView.tapView4.subLabel.text = lo
        currentStep = 4
        contentView.tapView5.imgView.backgroundColor = UIColor.MainColor()
        contentView.tapView5.nameLabel.textColor = UIColor.blackType1()
        contentView.tapView5.subLabel.textColor = UIColor.blackType1()
        
    }
    private func animateComplete(exStr:String){
        closeExtraVC()
        contentView.tapView5.subLabel.text = exStr
        currentStep = 5
        contentView.tapView6.imgView.backgroundColor = UIColor.MainColor()
        contentView.tapView6.nameLabel.textColor = UIColor.blackType1()
        contentView.tapView6.subLabel.textColor = UIColor.blackType1()
    }
    private func createGroup(){
        decideAVC = CreateGroupDecisionAVC()
        self.view.addSubview(decideAVC.view)
        decideAVC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        decideAVC.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        decideAVC.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        decideAVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        decideAVC.contentView.closeBtn.addTarget(self, action: #selector(decideAlertCloseFunc(_:)), for: .touchUpInside)
        self.service.createGroup { (result) in
            
            if let type = result["type"] as? String{
                
                if type == "err" || type == "error"{
                    self.decideAVC.contentView.stopAnimation(str: "Error")
                }
                if type == "exceeded"{
                    self.decideAVC.contentView.stopAnimation(str: "Exceeded")
                }
                if type == "createGroup"{
                    self.decideAVC.contentView.stopAnimation(str: "Success")
                    
                }
                
            }
        }
    }
    @objc private func decideAlertCloseFunc(_ sender:UIButton){
        self.decideAVC.contentView.closeAnimation {
            self.decideAVC.dismiss(animated: false, completion: {
                self.decideAVC.removeFromParent()
                self.decideAVC.view.removeFromSuperview()
                self.decideAVC = nil
            })
        }
    }
}

extension CreateGroupVC:CreateGroupNameDelegate{
    func transfer(groupName: String, groupStatus: String) {
        service.groupName = groupName
        service.groupStatus = groupStatus
        
        animateMember()
    }
    
}
extension CreateGroupVC:CreateGroupMemberDelegate{
    func onCallFunction(phs: [String]) {
        inviteAlertVC = CreateGroupAlertVC()
        self.view.addSubview(inviteAlertVC.view)
        inviteAlertVC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        inviteAlertVC.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        inviteAlertVC.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        inviteAlertVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        inviteAlertVC.contentView.closeBtn.addTarget(self, action: #selector(step2CloseBtnFunc(_:)), for: .touchUpInside)
        service.checkUserByPhone(phArray: phs) { (result) in
            
            print(result,"TAGTAGTAGTAG")
            if let type = result["type"] as? String{
                if type == "err"{
                    print("TAGTAG1")
                    self.inviteAlertVC.contentView.stopAnimation(str:"CreateGroupWait101".localize())
                }
                if type == "NoMatch"{
                    print("TAGTAG2")
                    self.inviteAlertVC.contentView.stopAnimation(str:"CreateGroupWait201".localize())
                }
                if type == "noDefine"{
                    print("TAGTAG3")
                    self.inviteAlertVC.contentView.stopAnimation(str: "CreateGroupWait301".localize())
                }
                if type == "success"{
                    print("TAGTAG4")
                    self.inviteAlertVC.contentView.closeAnimation {
                        self.inviteAlertVC.dismiss(animated: false, completion: {
                            self.inviteAlertVC.removeFromParent()
                            self.inviteAlertVC.view.removeFromSuperview()
                            self.inviteAlertVC = nil
                            self.animateTag()
                        })
                    }
                }
            }
        }
    }
    @objc func step2CloseBtnFunc(_ sender:UIButton){
        self.inviteAlertVC.contentView.closeAnimation {
            self.inviteAlertVC.dismiss(animated: false, completion: {
                self.inviteAlertVC.removeFromParent()
                self.inviteAlertVC.view.removeFromSuperview()
                self.inviteAlertVC = nil
            })
        }
    }
}
extension CreateGroupVC:CreateGroupTagDelegate{
    func transfer(fo1: Int, fo2: Int, fo3: Int) {
        let str1 = String.GroupInfo1Array()[fo1]
        let str2 = String.GroupInfo2Array()[fo2]
        let str3 = String.GroupInfo3Array()[fo3]
        service.fo1 = fo1
        service.fo2 = fo2
        service.fo3 = fo3
        self.animateLocation(str1: str1, str2: str2, str3: str3)
    }
    func showNoInfoAlertVC() {
        tagAlertVC = CreateGroupNoInfoVC()
        self.view.addSubview(tagAlertVC.view)
        tagAlertVC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tagAlertVC.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tagAlertVC.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tagAlertVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tagAlertVC.contentView.closeBtn.addTarget(self, action: #selector(closeTagAlertFunc(_:)), for: .touchUpInside)
        
    }
    @objc func closeTagAlertFunc(_ sender:UIButton){
        tagAlertVC.contentView.closeAnimation {
            self.tagAlertVC.dismiss(animated: false, completion: {
                self.tagAlertVC.removeFromParent()
                self.tagAlertVC.view.removeFromSuperview()
                self.tagAlertVC = nil
            })
        }
    }
}
extension CreateGroupVC:CreateGroupLocaionDelegate{
    
    func transfer(lo1:Double,lo2:Double,lo:String) {
        self.service.lo1 = Int(lo1)
        self.service.lo2 = Int(lo2)
        self.service.lo = lo
        animateExtra(lo:lo)
    }
    func showNoLocationAlert() {
        
    }
}
extension CreateGroupVC:CreateGroupExtraDelegate{
    func transfer(extra: String) {
        self.service.ex = extra
        animateComplete(exStr:extra)
    }
    func showExtraAlertVC() {
        
    }
}
