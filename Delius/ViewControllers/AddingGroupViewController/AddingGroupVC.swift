//
//  AddingGroupVC.swift
//  Delius
//
//  Created by 박진호 on 2020/06/14.
//  Copyright © 2020 정윤환. All rights reserved.
//
private enum pageState{
    case main,string,member,tag,location,date,extra
}
import UIKit

class AddingGroupVC: UIViewController {
    
    
    var service:AddingGroupService!
    
    var contentView:AddingGroupView!
    
    var stringVC:AddingGroupStringVC!
    var memberVC:AddingGroupMemberVC!
    var tagVC:AddingGroupTagVC!
    var locationVC:AddingGroupLocationVC!
    var dateVC:AddingGroupDateVC!
    var extraVC:AddingGroupExtraVC!
    
    let container:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()

    
    
    var nsContent:NSLayoutConstraint!
    var nsContainer:NSLayoutConstraint!
    private var currentPage:pageState = .main
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        service = AddingGroupService()
    }
    private func setup(){
        contentView = AddingGroupView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nsContent = contentView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 0)
        nsContent.isActive = true
        contentView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        self.view.addSubview(container)
        container.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nsContainer = container.leftAnchor.constraint(equalTo: view.leftAnchor,constant: view.frame.width)
        nsContainer.isActive = true
        container.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.stringView.addTarget(self, action: #selector(menuBtnFunc(_:)), for: .touchUpInside)
        contentView.memberView.addTarget(self, action: #selector(menuBtnFunc(_:)), for: .touchUpInside)
        contentView.tagView.addTarget(self, action: #selector(menuBtnFunc(_:)), for: .touchUpInside)
        contentView.locationView.addTarget(self, action: #selector(menuBtnFunc(_:)), for: .touchUpInside)
        contentView.dateView.addTarget(self, action: #selector(menuBtnFunc(_:)), for: .touchUpInside)
        contentView.extraView.addTarget(self, action: #selector(menuBtnFunc(_:)), for: .touchUpInside)
        contentView.cancelBtn.addTarget(self, action: #selector(cancelBtnFunc(_:)), for: .touchUpInside)
        
        contentView.completeButton.addTarget(self, action: #selector(completeBtnFunc(_:)), for: .touchUpInside)
    }
    
}
extension AddingGroupVC{
    func closeAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.nsContent.constant = 0
            self.nsContainer.constant = self.view.frame.width
            self.view.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                switch self.currentPage{
                case .main:()
                case .string:
                    self.removeStringView()
                case .member:
                    self.removeMemberView()
                case .tag:
                    self.removeTagView()
                case .location:
                    self.removeLocationView()
                case .date:
                    self.removeDateView()
                case .extra:
                    self.removeExtraView()
                }
            }
        }
    }
    func openAnimation(sender:UIButton){
        switch sender{
        case contentView.stringView:
            createStringView()
        case contentView.memberView:
            createMemberView()
        case contentView.tagView:
            createTagView()
        case contentView.locationView:
            createLocationView()
        case contentView.dateView:
            createDateView()
        case contentView.extraView:
            createExtraView()
        default:()
        }
        let Animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.nsContent.constant = -100
            self.nsContainer.constant = 0
            self.view.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    @objc func cancelBtnFunc(_ sender:UIButton){
        self.dismiss(animated: true, completion: {})
    }
    @objc func menuBtnFunc(_ sender:UIButton){
        
        openAnimation(sender: sender)
    }
    func createStringView(){
        stringVC = AddingGroupStringVC()
        stringVC.didMove(toParent: self)
        container.addSubview(stringVC.view)
        stringVC.view.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        stringVC.view.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        stringVC.view.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        stringVC.view.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        currentPage = .string
        
    }
    func removeStringView(){
        stringVC.willMove(toParent: nil)
        stringVC.view.removeFromSuperview()
        stringVC.removeFromParent()
        currentPage = .main
    }
    
    func createMemberView(){
        memberVC = AddingGroupMemberVC()
        memberVC.didMove(toParent: self)
        container.addSubview(memberVC.view)
        memberVC.view.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        memberVC.view.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        memberVC.view.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        memberVC.view.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        currentPage = .member
        
    }
    func removeMemberView(){
        memberVC.didMove(toParent: nil)
        memberVC.view.removeFromSuperview()
        memberVC.removeFromParent()
        currentPage = .main
    }
    
    func createTagView(){
        tagVC = AddingGroupTagVC()
        tagVC.didMove(toParent: self)
        container.addSubview(tagVC.view)
        tagVC.view.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        tagVC.view.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        tagVC.view.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        tagVC.view.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        currentPage = .tag
    }
    func removeTagView(){
        tagVC.willMove(toParent: nil)
        tagVC.view.removeFromSuperview()
        tagVC.removeFromParent()
        currentPage = .main
    }
    
    func createLocationView(){
        locationVC = AddingGroupLocationVC()
        locationVC.willMove(toParent: self)
        container.addSubview(locationVC.view)
        locationVC.view.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        locationVC.view.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        locationVC.view.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        locationVC.view.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        currentPage = .location
        
    }
    func removeLocationView(){
        locationVC.willMove(toParent: nil)
        locationVC.view.removeFromSuperview()
        locationVC.removeFromParent()
        currentPage = .main
    }
    
    func createDateView(){
        dateVC = AddingGroupDateVC()
        dateVC.willMove(toParent: self)
        container.addSubview(dateVC.view)
        dateVC.view.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        dateVC.view.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        dateVC.view.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        dateVC.view.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        currentPage = .date
        
    }
    func removeDateView(){
        dateVC.willMove(toParent: nil)
        dateVC.view.removeFromSuperview()
        dateVC.removeFromParent()
        currentPage = .main
    }
    
    func createExtraView(){
        extraVC = AddingGroupExtraVC()
        extraVC.willMove(toParent: self)
        container.addSubview(extraVC.view)
        extraVC.view.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        extraVC.view.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        extraVC.view.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        extraVC.view.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        currentPage = .extra
    }
    func removeExtraView(){
        extraVC.willMove(toParent: nil)
        extraVC.view.removeFromSuperview()
        extraVC.removeFromParent()
        currentPage = .main
    }
    
    
    func update1(groupName:String,groupStatus:String){
        contentView.stringView.subLabel.text = "\(groupName)\n\(groupStatus)"
        service.na = groupName
        service.st = groupStatus
        closeAnimation()
    }
    private func checkUserByPhone(phoneArray:[String]){
        guard let myPh = service.user?.phoneNumber else { return }
        var requestArray = [myPh]
        requestArray = requestArray + phoneArray
        let indicator = ShowMainIndicator(viewController: self)
        indicator.ShowIndicator()
        service.checkUserByPhone(phArray: requestArray){(result) in
            let asyncGroup = DispatchGroup()
            asyncGroup.enter()
            indicator.removeIndicator {
                asyncGroup.leave()
            }
            asyncGroup.notify(queue: .main,execute: {
                guard let resultCode = result["type"] as? String else { return }
                switch resultCode{
                case "err":
                    ShowAlert.handlerAlert(inViewController: self, title: "", message: "오류났어", completion: {
                        self.closeAnimation()
                    })
                case "success":
                    self.service.num = requestArray.count
                    self.contentView.memberView.subLabel.text = "\(self.service.num!)명"
                    self.closeAnimation()
                default:
                    ShowAlert.OnlyDefault(vc: self, title: "", message: "초대 잘못됨")
                }
            })
        }
    }
    private func updateTagData(fo1:Int,fo2:Int,fo3:Int){
        let groupInfo1Str = String.GroupInfo1Array()
        let groupInfo2Str = String.GroupInfo2Array()
        let groupInfo3Str = String.GroupInfo3Array()
        service.fo1 = fo1
        service.fo2 = fo2
        service.fo3 = fo3
        contentView.tagView.subLabel.text = "\(groupInfo1Str[fo1]),  \(groupInfo2Str[fo2]),  \(groupInfo3Str[fo3])"
        closeAnimation()
    }
    private func updateExtraData(ex:String){
        service.ex = ex
        contentView.extraView.subLabel.text = ex
        closeAnimation()
    }
    private func updateDateData(date:Double,string:String){
        let ltp = Int(date)
        service.ltp = ltp
        contentView.dateView.subLabel.text = string
        closeAnimation()
        
    }
    private func updateLocationData(lo:String,lo1:Double,lo2:Double){
        service.lo = lo
        service.lo1 = Int(lo1)
        service.lo2 = Int(lo2)
        contentView.locationView.subLabel.text = lo
        closeAnimation()
    }
    @objc func completeBtnFunc(_ sender:UIButton){
        checkBeforeUpload()
    }
    private func createGroup(){
        let gid = UUID().uuidString
        service.gid = gid
        let indicator = ShowMainIndicator(viewController: self)
        indicator.ShowIndicator()
        service.createGroup(){(result) in
            let asyncGroup = DispatchGroup()
            asyncGroup.enter()
            indicator.removeIndicator {
                asyncGroup.leave()
            }
            asyncGroup.notify(queue: .main,execute: {
                guard let resultCode = result["type"] as? String else { return }
                switch resultCode{
                case "err":
                    ShowAlert.OnlyDefault(vc: self, title: "", message: "오류났어")
                case "createGroup":
                    self.dismiss(animated: true, completion: {})
                default:
                    ShowAlert.OnlyDefault(vc: self, title: "", message: "뭔가이상함")
                }
            })
            
        }
    }
    private func checkBeforeUpload(){
        let completeCode = service.checkData()
        switch completeCode{
        case "string":
            ShowAlert.OnlyDefault(vc: self, title: "", message: "첫번째꺼 안함")
        case "member":
            ShowAlert.OnlyDefault(vc: self, title: "", message: "두번째꺼 안함")
        case "tag":
            ShowAlert.OnlyDefault(vc: self, title: "", message: "세번째꺼 안함")
        case "date":
            ShowAlert.OnlyDefault(vc: self, title: "", message: "네번째꺼 안함")
        case "location":
            ShowAlert.OnlyDefault(vc: self, title: "", message: "다섯번쨰꺼 안함")
        case "extra":
            ShowAlert.OnlyDefault(vc: self, title: "", message: "여섯번쨰꺼 안함")
        default:
            createGroup()
        }
    }
}


extension AddingGroupVC:ProtocolAddingGroupString,ProtocolAddingGroupMember,ProtocolAddingGroupTag,ProtocolAddingGroupDate,ProtocolAddingGroupLocation,ProtocolAddingGroupExtra{
    func completeString(obj: [String : Any]) {
        guard let name = obj["na"] as? String else { return }
        guard let status = obj["st"] as? String else { return }
        
        update1(groupName: name, groupStatus: status)
    }
    func completeMember(obj: [String:Any]){
        closeAnimation()
    }
    func checkUser(phoneList: [String]) {
        checkUserByPhone(phoneArray: phoneList)
    }
    func completeTag(obj: [String:Any]){
        let info1 = obj["fo1"] as! Int
        let info2 = obj["fo2"] as! Int
        let info3 = obj["fo3"] as! Int
        updateTagData(fo1: info1, fo2: info2, fo3: info3)
    }
    func completeDate(obj: [String : Any]) {
        let ltp = obj["ltp"] as! Double
        let string = obj["string"] as! String
        updateDateData(date: ltp,string:string)
    }
    func completeLocation(obj:[String:Any]){
        let localName = obj["lo"] as! String
        let latitude = obj["lo1"] as! Double
        let longitude = obj["lo2"] as! Double
        updateLocationData(lo: localName, lo1: latitude, lo2: longitude)
    }
    func completeExtra(obj: [String : Any]) {
        let str = obj["ex"] as! String
        updateExtraData(ex: str)
    }
}
