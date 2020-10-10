//
//  Tab0VC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 16/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//
private enum pageOpenState{
    case opened
    case closed
}
import SDWebImage
import UIKit
class Tab0VC:UIViewController{
    var contentView:Tab0View!
    
    var mlistArray=[MStruct]()
    var userArray=[UserStruct]()
    var groupArray=[GroupStruct]()
    var imgArray=[[String:[UIImage]]]()
    var userCash:CashItemStruct!
    var actionService = ActionService()
    
    
    var delegate:Tab0Delegate!
    
    
    
    
    var service:Tab0ServiceCode!
    var myGroups=[MyGroupListStruct]()
    var myData:UserStruct!
    
    var mainList = [MainListStruct]()
    
    enum CellType{
        case solo,group2,group3,group4
    }
    private var currentPage:Int = 0
    private var currentOpen:pageOpenState = .closed
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        contentView.backCollectionView.setContentOffset(CGPoint(x: -view.frame.width/2, y: 0), animated: true)
//        contentView.backCollectionView.contentOffset.x = -view.frame.width/2
    }
    private func setup(){
        
        service = Tab0ServiceCode(sx: true,viewController: self)
        service.delegate = self
        
        let window = UIApplication.shared.windows[0]
        let btmPadding = window.safeAreaInsets.bottom
        let topPadding = window.safeAreaInsets.top
        
        contentView = Tab0View(frame: CGRect(x:0,y:0,width:view.frame.width,height:view.frame.height - btmPadding - topPadding))
        contentView.collectionView.register(Tab0SoloCell.self, forCellWithReuseIdentifier: "Tab0SoloCellid")
        contentView.collectionView.register(Tab0GroupCell2.self, forCellWithReuseIdentifier: "Tab0GroupCellid2")
        contentView.collectionView.register(Tab0GroupCell3.self, forCellWithReuseIdentifier: "Tab0GroupCellid3")
        contentView.collectionView.register(Tab0GroupCell4.self, forCellWithReuseIdentifier: "Tab0GroupCellid4")
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
        contentView.frame = CGRect(x:0,y:topPadding,width:view.frame.width,height:view.frame.height - btmPadding - topPadding)
        
//        contentView.likeBtn.addTarget(self, action: #selector(likeButtonFunc(_:)), for: .touchUpInside)
//        contentView.leftBtn.addTarget(self, action: #selector(leftButtonFunc(_:)), for: .touchUpInside)
//        contentView.deliBtn.addTarget(self, action: #selector(deliButtonFunc(_:)), for: .touchUpInside)
//        contentView.reportBtn.addTarget(self, action: #selector(expandBtnFunc(_:)), for: .touchUpInside)
//        contentView.rightBtn.addTarget(self, action: #selector(rightButtonFunc(_:)), for: .touchUpInside)
        
        contentView.likeBtn.addTarget(self, action: #selector(actionBtnFunc(_:)), for: .touchUpInside)
        contentView.leftBtn.addTarget(self, action: #selector(actionBtnFunc(_:)), for: .touchUpInside)
        contentView.deliBtn.addTarget(self, action: #selector(actionBtnFunc(_:)), for: .touchUpInside)
        contentView.reportBtn.addTarget(self, action: #selector(actionBtnFunc(_:)), for: .touchUpInside)
        contentView.rightBtn.addTarget(self, action: #selector(actionBtnFunc(_:)), for: .touchUpInside)
        
        view.addSubview(contentView)
    }
    private func disableBtns(){
        
        let btns = [contentView.likeBtn,contentView.leftBtn,contentView.deliBtn,contentView.reportBtn,contentView.rightBtn]
        for btn in btns{
            btn?.isEnabled = false
        }
    }
    func enableBtns(){
        
        let btns = [contentView.likeBtn,contentView.leftBtn,contentView.deliBtn,contentView.reportBtn,contentView.rightBtn]
        for btn in btns{
            btn?.isEnabled = true
        }
    }
    @objc func actionBtnFunc(_ sender:UIButton){
        let currentIndex = Int(contentView.collectionView.contentOffset.x/self.contentView.collectionView.frame.width)
        print("CURRENTINDEX",currentIndex)
        let isSolo = mainList[currentIndex].mStruct?.type! == 101 ? true : false
        if sender == contentView.leftBtn{
            ListLeft()
        }
        else if sender == contentView.likeBtn{
            if isSolo{
                SoloLike()
            }else{
                let groupSize = self.mainList[currentIndex].mStruct!.num!
                self.delegate.checkGroup(groupSize: groupSize, isLike: true)
            }
        }
        else if sender == contentView.deliBtn{
            if isSolo{
                SoloDeli()
            }else{
                let groupSize = self.mainList[currentIndex].mStruct!.num!
                self.delegate.checkGroup(groupSize: groupSize, isLike: false)
            }
        }
        else if sender == contentView.reportBtn{
            expandFunc(page:currentIndex)
        }
        else{
            if isSolo{
                SoloPass()
            }else{
                GroupPass()
            }
        }
    }
    private func ListLeft(){
        disableBtns()
        let currentIndex = Int(contentView.collectionView.contentOffset.x/self.view.frame.width)
        if service.checkPlusUser(){
            if currentIndex == 0{
                self.enableBtns()
            }else{
                self.pagingToleft(page:currentIndex) {
                    self.enableBtns()
                }
            }
        }else{
            if currentIndex == 0{
                self.delegate.showAlertView(type: "PlusUserView", userData: MainListStruct())
                self.enableBtns()
            }else{
                self.pagingToleft(page:currentIndex) {
                    self.pagingToRight(page:currentIndex){
                        self.delegate.showAlertView(type: "PlusUserView", userData: MainListStruct())
                        self.enableBtns()
                    }
                }
            }
        }
    }
    private func SoloPass(){
        disableBtns()
        let currentIndex = Int(contentView.collectionView.contentOffset.x/self.view.frame.width)
        guard let existIndex = mainList[currentIndex].mStruct?.in1 else { return }

        if existIndex != 100 && existIndex != 200{
            self.pagingToRight(page:currentIndex){
                self.enableBtns();
                if currentIndex == self.mainList.count - 1{
                    // 메인리스트 리로드 함수 // 아직 미완성 함수인데 일단 포함시켜봄
                    self.delegate.reloadMainList()
                }
            }
        }
        else if existIndex == 200{
            self.pagingToRight(page:currentIndex){
                self.enableBtns()
                if currentIndex == self.mainList.count - 1{
                    // 메인리스트 리로드 함수 // 아직 미완성 함수인데 일단 포함시켜봄
                    self.delegate.reloadMainList()
                }
            }
        }
        else if existIndex == 100{
            let uid = mainList[currentIndex].mStruct!.pid!
            service.Solo200(uid: uid)
            actionAnimation(page:currentIndex,index: 200, completion: {
                self.pagingToRight(page:currentIndex){
                    self.enableBtns()
                    if currentIndex == self.mainList.count - 1 {
                        // 메인리스트 리로드 함수 // 아직 미완성 함수인데 일단 포함시켜봄
                        self.delegate.reloadMainList()
                    }
                }
            })
        }
    }
    private func GroupPass(){
        disableBtns()
        let currentIndex = Int(contentView.collectionView.contentOffset.x/self.view.frame.width)
        guard let existIndex = mainList[currentIndex].mStruct?.in1 else { return }

        if existIndex != 100 && existIndex != 200{
            self.pagingToRight(page:currentIndex){
                self.enableBtns();
                if currentIndex == self.mainList.count - 1{
                    // 메인리스트 리로드 함수 // 아직 미완성 함수인데 일단 포함시켜봄
                    self.delegate.reloadMainList()
                }
            }
            return;
        }
        else if existIndex == 200{
            self.pagingToRight(page:currentIndex){
                self.enableBtns()
                if currentIndex == self.mainList.count - 1{
                    // 메인리스트 리로드 함수 // 아직 미완성 함수인데 일단 포함시켜봄
                    self.delegate.reloadMainList()
                }
            }
            return;
        }
        else if existIndex == 100{
            let gid = mainList[currentIndex].mStruct!.pid!
            service.Group200(gid: gid)
            actionAnimation(page:currentIndex,index: 200, completion: {
                self.pagingToRight(page:currentIndex){
                    self.enableBtns()
                    if currentIndex == self.mainList.count - 1 {
                        // 메인리스트 리로드 함수 // 아직 미완성 함수인데 일단 포함시켜봄
                        self.delegate.reloadMainList()
                    }
                }
            })
        }
    }
    private func SoloReport(){
        
    }
    private func GroupReport(){
        
    }
    private func SoloLike(){
        let currentIndex = Int(contentView.collectionView.contentOffset.x/self.view.frame.width)
        
        
        disableBtns()
        
        guard let existIndex = mainList[currentIndex].mStruct?.in1 else { return }

        if existIndex != 100 && existIndex != 200{
            self.delegate.showAlertView(type: "AlreadyActionView",userData:MainListStruct())
            self.enableBtns()
            return;
        }
        let selectedItem = mainList[currentIndex]
        let uid = mainList[currentIndex].mStruct!.pid!
        guard let partnerIndex = mainList[currentIndex].mStruct?.in2 else { return }
        
        
        if partnerIndex == 300 || partnerIndex == 400{
            self.delegate.showAlertView(type: "SoloMatchView",userData:selectedItem)
            service.Solo300(uid: uid) { (result) in
                if result == "noCash"{
                    self.delegate.removeSoloMatchView()
                    self.delegate.showAlertView(type: "EmptyLikeView",userData: MainListStruct())
                    self.enableBtns()
                }
                else if result == "success"{
                    self.delegate.continueSoloMatch()
                    if currentIndex == self.mainList.count - 1{
                        self.delegate.reloadMainList()
                    }else{
                        self.pagingToRight(page:currentIndex)
                    }
                    self.mainList[currentIndex].mStruct?.in1 = 300
                    self.enableBtns()
                }
                else if result == "error" || result == "internalError"{
                    self.delegate.removeSoloMatchView()
                    self.delegate.showAlertView(type: "ErrorView",userData: MainListStruct())
                    self.enableBtns()
                }else{
                    self.enableBtns()
                }
            }
        }
        else{
            let asyncGroup = DispatchGroup()
            asyncGroup.enter()
            actionAnimation(page:currentIndex,index: 300) {
                if currentIndex == self.mainList.count - 1{
                    asyncGroup.leave()
                }else{
                    self.pagingToRight(page:currentIndex){
                        asyncGroup.leave()
                    }
                }
            }
            var flag:String = ""
            if service.CheckLikeCount(){
                asyncGroup.enter()
                self.service.Solo300(uid: uid, completion: { resultStr in
                    flag = resultStr
                    asyncGroup.leave()
                })
            }else{
                flag = "noCash"
            }
            
            
            asyncGroup.notify(queue: .main, execute: {
                print("FLAg",flag)
                if flag == "noCash"{
                    if currentIndex == 0{
                        self.delegate.showAlertView(type: "EmptyLikeView", userData: MainListStruct())
                        self.enableBtns()
                    }else{
                        self.pagingToleft(page:currentIndex,completion: {
                            self.delegate.showAlertView(type: "EmptyLikeView", userData: MainListStruct())
                            self.enableBtns()
                        })
                    }
                }
                else if flag == "internalError" || flag == "error"{
                    if currentIndex == 0{
                        self.delegate.showAlertView(type: "ErrorView", userData: MainListStruct())
                        self.enableBtns()
                    }else{
                        self.pagingToleft(page:currentIndex,completion: {
                            self.delegate.showAlertView(type: "ErrorView", userData: MainListStruct())
                            self.enableBtns()
                        })
                    }
                }else{
                    self.enableBtns()
                    self.mainList[currentIndex].mStruct?.in1 = 300
                    if currentIndex == self.mainList.count - 1{
                        self.delegate.reloadMainList()
                    }
                }
            })
        }
        
    }
    private func SoloDeli(){
        let currentIndex = Int(contentView.collectionView.contentOffset.x/self.view.frame.width)
        
        disableBtns()
        guard let existIndex = mainList[currentIndex].mStruct?.in1 else { return }
        if existIndex != 100 && existIndex != 200{
            self.delegate.showAlertView(type: "AlreadyActionView",userData:MainListStruct())
            self.enableBtns()
            return;
        }
        let selectedItem = mainList[currentIndex]
        let uid = mainList[currentIndex].mStruct!.pid!
        guard let partnerIndex = mainList[currentIndex].mStruct?.in2 else { return }
        
        
        if partnerIndex == 300 || partnerIndex == 400{
            self.delegate.showAlertView(type: "SoloMatchView",userData:selectedItem)
            service.Solo400(uid: uid) { (result) in
                if result == "noCash"{
                    self.delegate.removeSoloMatchView()
                    self.delegate.showAlertView(type: "EmptyDeliView",userData: MainListStruct())
                    self.enableBtns()
                }
                else if result == "success"{
                    self.delegate.continueSoloMatch()
                    if currentIndex == self.mainList.count - 1{
                        self.delegate.reloadMainList()
                    }else{
                        self.pagingToRight(page:currentIndex)
                    }
                    self.mainList[currentIndex].mStruct?.in1 = 400
                    self.enableBtns()
                }
                else if result == "error" || result == "internalError"{
                    self.delegate.removeSoloMatchView()
                    self.delegate.showAlertView(type: "ErrorView",userData: MainListStruct())
                    self.enableBtns()
                }else{
                    self.enableBtns()
                }
            }
        }
        else{
            let asyncGroup = DispatchGroup()
            asyncGroup.enter()
            actionAnimation(page:currentIndex,index: 400) {
                if currentIndex == self.mainList.count - 1{
                    asyncGroup.leave()
                }else{
                    self.pagingToRight(page:currentIndex){
                        asyncGroup.leave()
                    }
                }
            }
            
            var flag:String = ""
            if service.CheckLikeCount(){
                asyncGroup.enter()
                self.service.Solo400(uid: uid, completion: { resultStr in
                    flag = resultStr
                    asyncGroup.leave()
                })
            }else{
                flag = "noCash"
            }
            
            
            asyncGroup.notify(queue: .main, execute: {
                if flag == "noCash"{
                    if currentIndex == 0{
                        self.delegate.showAlertView(type: "EmptyDeliView", userData: MainListStruct())
                        self.enableBtns()
                    }else{
                        self.pagingToleft(page:currentIndex,completion: {
                            self.delegate.showAlertView(type: "EmptyDeliView", userData: MainListStruct())
                            self.enableBtns()
                        })
                    }
                }
                else if flag == "internalError" || flag == "error"{
                    if currentIndex == 0{
                        self.delegate.showAlertView(type: "ErrorView", userData: MainListStruct())
                        self.enableBtns()
                    }else{
                        self.pagingToleft(page:currentIndex,completion: {
                            self.delegate.showAlertView(type: "ErrorView", userData: MainListStruct())
                            self.enableBtns()
                        })
                    }
                }else{
                    self.mainList[currentIndex].mStruct?.in1 = 400
                    self.enableBtns()
                    if currentIndex == self.mainList.count - 1{
                        self.delegate.reloadMainList()
                    }
                }
            })
        }
    }
    func GroupLike(myGroup:MyGroupListStruct){
        let currentIndex = Int(contentView.collectionView.contentOffset.x/self.view.frame.width)
        disableBtns()
        
        
        guard let existIndex = mainList[currentIndex].mStruct?.in1 else { return }
        
        if existIndex != 100 && existIndex != 200 {
            self.delegate.showAlertView(type: "AlreadyActionView", userData: MainListStruct())
            self.enableBtns()
            return;
        }
        let targetItem = mainList[currentIndex]
        guard let pid = targetItem.mStruct?.pid else { enableBtns(); return}
        guard let pids = targetItem.mStruct?.pids else { enableBtns(); return }
        guard let myGid = myGroup.listInfo?.id else { enableBtns(); return}
        guard let myUids = myGroup.listInfo?.uids else { enableBtns(); return }
        
        let asyncGroup = DispatchGroup()
        asyncGroup.enter()
        actionAnimation(page: currentIndex, index: 300){
            if currentIndex == self.mainList.count - 1{
                asyncGroup.leave()
            }else{
                self.pagingToRight(page: currentIndex, completion: {
                    asyncGroup.leave()
                })
            }
        }
        var flag:String = ""
        if service.CheckLikeCount(){
            asyncGroup.enter()
            self.service.Group300(myGid: myGid, myUids: myUids, partnerGid: pid, pUids: pids){ result in
                flag = result
                asyncGroup.leave()
            }
        }else{
            flag = "noCash"
        }
        asyncGroup.notify(queue: .main, execute: {
            if flag == "noCash"{
                if currentIndex == 0{
                    self.delegate.showAlertView(type: "EmptyLikeView", userData: MainListStruct())
                    self.enableBtns()
                }else{
                    self.pagingToleft(page: currentIndex, completion: {
                        self.delegate.showAlertView(type: "EmptyLikeView", userData: MainListStruct())
                        self.enableBtns()
                    })
                }
            }
            else if flag == "internalError" || flag == "error"{
                if currentIndex == 0{
                    self.delegate.showAlertView(type: "ErrorView", userData: MainListStruct())
                    self.enableBtns()
                }else{
                    self.pagingToleft(page: currentIndex, completion: {
                        self.delegate.showAlertView(type: "ErrorView", userData: MainListStruct())
                        self.enableBtns()
                    })
                }
            }
            else if flag == "success"{
                self.enableBtns()
                self.mainList[currentIndex].mStruct?.in1 = 300
                if currentIndex == self.mainList.count - 1{
                    self.delegate.reloadMainList()
                }
            }
            else if flag == "AlreadyAction"{
                if currentIndex == 0{
                    self.delegate.showAlertView(type: "AlreadyActionView", userData: MainListStruct())
                    self.enableBtns()
                }else{
                    self.pagingToleft(page: currentIndex, completion: {
                        self.delegate.showAlertView(type: "AlreadyActionView", userData: MainListStruct())
                        self.enableBtns()
                    })
                }
            }
            else{
                self.enableBtns()
            }
        })
    }
    func GroupDeli(myGroup:MyGroupListStruct){
        
        let currentIndex = Int(contentView.collectionView.contentOffset.x/self.view.frame.width)
        disableBtns()
        
        
        guard let existIndex = mainList[currentIndex].mStruct?.in1 else { return }
        
        if existIndex != 100 && existIndex != 200 {
            self.delegate.showAlertView(type: "AlreadyActionView", userData: MainListStruct())
            self.enableBtns()
            return;
        }
        let targetItem = mainList[currentIndex]
        guard let pid = targetItem.mStruct?.pid else { enableBtns(); return}
        guard let pids = targetItem.mStruct?.pids else { enableBtns(); return }
        guard let myGid = myGroup.listInfo?.id else { enableBtns(); return}
        guard let myUids = myGroup.listInfo?.uids else { enableBtns(); return }
        
        let asyncGroup = DispatchGroup()
        asyncGroup.enter()
        actionAnimation(page: currentIndex, index: 400){
            if currentIndex == self.mainList.count - 1{
                asyncGroup.leave()
            }else{
                self.pagingToRight(page: currentIndex, completion: {
                    asyncGroup.leave()
                })
            }
        }
        var flag:String = ""
        if service.CheckLikeCount(){
            asyncGroup.enter()
            self.service.Group400(myGid: myGid, myUids: myUids, partnerGid: pid, pUids: pids){ result in
                flag = result
                asyncGroup.leave()
            }
        }else{
            flag = "noCash"
        }
        asyncGroup.notify(queue: .main, execute: {
            if flag == "noCash"{
                if currentIndex == 0{
                    self.delegate.showAlertView(type: "EmptyDeliView", userData: MainListStruct())
                    self.enableBtns()
                }else{
                    self.pagingToleft(page: currentIndex, completion: {
                        self.delegate.showAlertView(type: "EmptyDeliView", userData: MainListStruct())
                        self.enableBtns()
                    })
                }
            }
            else if flag == "internalError" || flag == "error"{
                if currentIndex == 0{
                    self.delegate.showAlertView(type: "ErrorView", userData: MainListStruct())
                    self.enableBtns()
                }else{
                    self.pagingToleft(page: currentIndex, completion: {
                        self.delegate.showAlertView(type: "ErrorView", userData: MainListStruct())
                        self.enableBtns()
                    })
                }
            }
            else if flag == "success"{
                self.enableBtns()
                self.mainList[currentIndex].mStruct?.in1 = 400
                if currentIndex == self.mainList.count - 1{
                    self.delegate.reloadMainList()
                }
            }
            else if flag == "AlreadyAction"{
                if currentIndex == 0{
                    self.delegate.showAlertView(type: "AlreadyActionView", userData: MainListStruct())
                    self.enableBtns()
                }else{
                    self.pagingToleft(page: currentIndex, completion: {
                        self.delegate.showAlertView(type: "AlreadyActionView", userData: MainListStruct())
                        self.enableBtns()
                    })
                }
            }
            else{
                self.enableBtns()
            }
        })
    }
    
    
    
    
    
    private func actionAnimation(page:Int,index:Int,completion:@escaping()->Void={}){
        if currentOpen == .opened{
            expandFunc(page:page)
        }
        
        if let cell = contentView.collectionView.cellForItem(at: IndexPath(row: page, section: 0)) as? Tab0SoloCell{
            actionSoloCell(cell: cell, index: index, completion: {completion()})
        }
        if let cell = contentView.collectionView.cellForItem(at: IndexPath(row:page,section:0)) as? Tab0GroupCell2{
            actionGroupCell2(cell: cell, index: index,completion:{completion()})
        }
        if let cell = contentView.collectionView.cellForItem(at: IndexPath(row: page, section: 0)) as? Tab0GroupCell3{
            actionGroupCell3(cell: cell, index: index,completion:{completion()})
        }
        if let cell = contentView.collectionView.cellForItem(at: IndexPath(row: page, section: 0)) as? Tab0GroupCell4{
            actionGroupCell4(cell: cell, index: index,completion:{completion()})

        }
    }
    
    private func expandFunc(page:Int){
        if let cell = contentView.collectionView.cellForItem(at: IndexPath(row: page, section: 0)) as? Tab0SoloCell{
            expandSoloCell(cell: cell)
        }
        if let cell = contentView.collectionView.cellForItem(at: IndexPath(row:page,section:0)) as? Tab0GroupCell2{
            expandGroupCell2(cell: cell)
        }
        if let cell = contentView.collectionView.cellForItem(at: IndexPath(row: page, section: 0)) as? Tab0GroupCell3{
            expandGroupCell3(cell: cell)
        }
        if let cell = contentView.collectionView.cellForItem(at: IndexPath(row: page, section: 0)) as? Tab0GroupCell4{
            expandGroupCell4(cell: cell)
        }
    }
    private func pagingToRight(page:Int,completion:@escaping()->Void={}){
        let cellWidth = contentView.collectionView.frame.width
        let currentOffset = CGFloat(page)*cellWidth
        let nextOffset = currentOffset + cellWidth
//        self.contentView.collectionView.scrollToItem(at: IndexPath(row: self.currentPage + 1, section: 0), at: .centeredHorizontally, animated: true)
//        self.contentView.collectionView.setContentOffset(CGPoint(x: nextOffset, y: 0), animated: true)
        
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            
            self.contentView.collectionView.setContentOffset(CGPoint(x: nextOffset, y: 0), animated: true)
//            self.contentView.collectionView.scrollToItem(at: IndexPath(row: self.currentPage + 1, section: 0), at: .centeredHorizontally, animated: false)
//            self.contentView.collectionView.contentOffset.x = nextOffset
            self.view.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                completion()
            }
        }
//        Animator.addCompletion{position in
//            if position == .end{
//                if self.currentPage == self.mainList.count - 1 {
//                    completion(true)
//                }else{
//                    self.currentPage += 1
//                    completion(false)
//                }
//            }
//        }
    }
    private func pagingToleft(page:Int,completion:@escaping()->Void={}){
        let cellWidth = contentView.collectionView.frame.width
        let currentOffset = CGFloat(page)*cellWidth
        let nextOffset = currentOffset - cellWidth
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.contentView.collectionView.setContentOffset(CGPoint(x: nextOffset, y: 0), animated: true)

            self.view.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                completion()
            }
        }
    }
    
    @objc private func likeButtonFunc(_ sender:UIButton){
        
        
        guard let cashItem = userCash else{ return }
        if cashItem.like == 0 {
            let plusController = ShowBuyPlusVC(viewController: self)
            plusController.ShowIndicator()
            return
        }
        if mainList[currentPage].mStruct?.type! == 101{
            soloLikeFunc(){
                self.pagingRight(completion: {})
            }
        }else{
            checkMyGroup(isLike: true)
        }

        
    }
    @objc private func deliButtonFunc(_ sender:UIButton){
        
//        let controller = ShowGroupEditVC(viewController: self)
//        controller.ShowIndicator()
//        let controller = ShowReportVC(viewController: self)
//        controller.ShowIndicator()
        
//        let controller = ShowStopLeftPagingAVC(viewController: self)
//        controller.ShowIndicator()
        
//        let controller = ShowEmptyLikeAVC(viewController: self)
//        controller.ShowIndicator()
        
        
//        let controller = ShowEmptyDeliAVC(viewController: self, cashItem: userCash)
//        controller.ShowIndicator()
        
        
        
//        let controller = ShowExitGroupAVC(viewController: self)
//        controller.ShowIndicator()
        
        
//        let controller = ShowDeleteGroupAVC(viewController: self)
//        controller.ShowIndicator()
        
        
        
        return
        guard let mainData = mainList[currentPage].mStruct else { return }
        if mainData.type! == 101{
            soloDeliFunc {
                self.pagingRight(completion: {})
            }
        }else{
            checkMyGroup(isLike:false)
        }
        
    }
    @objc private func leftButtonFunc(_ sender:UIButton){
        guard let userData = myData else { return }
        if userData.ind2!{
            self.paginLeft(completion: {})
        }else{
            let controller = ShowBuyPlusVC(viewController: self)
            controller.ShowIndicator()
            
        }
    }
    @objc private func rightButtonFunc(_ sender:UIButton){
        guard let mainData = mainList[currentPage].mStruct else { return }
//        if mainData.type! == 101 {
//            service.passSolo(targetUid: mainData.pid!)
//        }else{
//            service.passGroup(partnerGid: mainData.pid!)
//        }
        self.pagingRight(completion: {})
    }
    private func checkCashItem(){
        
    }
    private func checkMyGroup(isLike:Bool){
        let mainData = mainList[currentPage]
        guard let groupData = mainData.mStruct else { return }
        let groupSize = groupData.num!
        
        let selectedGroupArr = myGroups.filter{$0.listInfo?.num! == groupSize}
        if selectedGroupArr.count == 0{
            ShowAlert.OnlyDefault(vc: self, title: "NoGroup", message: "그룹을 만들어서 미팅해보세요")
        }else if selectedGroupArr.count == 1{
            
        }else{
            let controller = ShowChooseGroupVC(viewController: self, listData: myGroups,isLike:isLike)
            controller.ShowIndicator()
        }
    }
    private func soloLikeFunc(completion:@escaping()->Void){
        if userCash.like! == 0{
            let controller = ShowCurrentDeli(viewController: self, cashItem: userCash)
            controller.ShowIndicator()
            return
        }
        guard let partnerData = mainList[currentPage].soloStruct else { return }
        service.sendSoloLike(targetUid: partnerData.uid!) { (result) in
            
        }
        completion()
    }
    private func soloDeliFunc(completion:@escaping()->Void){
        if userCash.deli == 0 && userCash.deli2 == 0{
            let controller = ShowCurrentDeli(viewController: self, cashItem: userCash)
            controller.ShowIndicator()
            return
        }
        guard let partnerData = mainList[currentPage].soloStruct else { return }
        service.sendSoloDeli(targetUid: partnerData.uid!, completion: {(result) in
            
        })
        completion()
    }
    private func groupLikeFunc(myGid:String,myUids:[String],completion:@escaping()->Void){
        if userCash.like! == 0{
            let controller = ShowCurrentDeli(viewController: self, cashItem: userCash)
            controller.ShowIndicator()
            return
        }
        guard let groupData = mainList[currentPage].groupStruct else { return }
        var pUids=[String]()
        if let uid = groupData.uid1 {
            if uid != "" {
                pUids.append(uid)
            }
        }
        if let uid = groupData.uid2 {
            if uid != "" {
                pUids.append(uid)
            }
        }
        if let uid = groupData.uid3 {
            if uid != "" {
                pUids.append(uid)
            }
        }
        if let uid = groupData.uid4 {
            if uid != "" {
                pUids.append(uid)
            }
        }
        service.onCallGroupSendLike(myGid: myGid, partnerGid: groupData.gid!, myUids: myUids, pUids: pUids)
        completion()
    }
    private func groupDeliFunc(myGid:String,myUids:[String],completion:@escaping()->Void){
        if userCash.deli == 0 && userCash.deli2 == 0{
            let controller = ShowCurrentDeli(viewController: self, cashItem: userCash)
            controller.ShowIndicator()
            return
        }
        guard let groupData = mainList[currentPage].groupStruct else { return }
        var pUids=[String]()
        if let uid = groupData.uid1 {
            if uid != "" {
                pUids.append(uid)
            }
        }
        if let uid = groupData.uid2 {
            if uid != "" {
                pUids.append(uid)
            }
        }
        if let uid = groupData.uid3 {
            if uid != "" {
                pUids.append(uid)
            }
        }
        if let uid = groupData.uid4 {
            if uid != "" {
                pUids.append(uid)
            }
        }
        service.onCallGroupSendLike(myGid: myGid, partnerGid: groupData.gid!, myUids: myUids, pUids: pUids)
        completion()
    }
    
}
extension Tab0VC{
    func downloadSoloImages(pid:String,im:[[String:Any]]){
        print(im,"###")
        if let cellImgs = imgArray.first(where: { $0.keys.contains(pid)}){
            
        }else{
            CreateThumbUrl.createImageArray(uid: pid, imArr: im, completion: {(imgs) in
                self.imgArray.append([pid:imgs])
                self.contentView.collectionView.reloadData()
            })
        }
    }
    func actionSoloCell(cell:Tab0SoloCell,index:Int,completion:@escaping()->Void={}){
        if index == 200{
            cell.actionAnimator.PassStep {
                completion()
            }
        }
        if index == 300{
            cell.actionAnimator.LikeStep {
                completion()
            }
        }
        if index == 400{
            cell.actionAnimator.DeliStep {
                completion()
            }
        }
    }
    func actionGroupCell2(cell:Tab0GroupCell2,index:Int,completion:@escaping()->Void={}){
        if index == 200{
            cell.actionAnimator.PassStep {
                completion()
            }
        }
        else if index == 300{
            cell.actionAnimator.LikeStep {
                completion()
            }
        }
        else if index == 400{
            cell.actionAnimator.DeliStep {
                completion()
            }
        }
        else if index >= 700 && index < 800{
            cell.actionAnimator.reportStep {
                completion()
            }
        }
        
    }
    func actionGroupCell3(cell:Tab0GroupCell3,index:Int,completion:@escaping()->Void={}){
        if index == 200{
            cell.actionAnimator.PassStep {
                completion()
            }
        }
        else if index == 300{
            cell.actionAnimator.LikeStep {
                completion()
            }
        }
        else if index == 400{
            cell.actionAnimator.DeliStep {
                completion()
            }
        }
        else if index >= 700 && index < 800{
            cell.actionAnimator.reportStep {
                completion()
            }
        }
    }
    func actionGroupCell4(cell:Tab0GroupCell4,index:Int,completion:@escaping()->Void={}){
        if index == 200{
            cell.actionAnimator.PassStep {
                completion()
            }
        }
        else if index == 300{
            cell.actionAnimator.LikeStep {
                completion()
            }
        }
        else if index == 400{
            cell.actionAnimator.DeliStep {
                completion()
            }
        }
        else if index >= 700 && index < 800{
            cell.actionAnimator.reportStep {
                completion()
            }
        }
    }
    func expandSoloCell(cell:Tab0SoloCell){
//        cell.imgCollectionView.reloadData()
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let Animator = UIViewPropertyAnimator(duration: 0.1, curve: .easeIn, animations: {
            switch self.currentOpen{
            case .opened:
//                self.contentView.topView.alpha = 1
                self.delegate.showTopView(show: true)
                cell.nsScroll.constant = 80
                cell.scrollView.contentOffset.y = 0
                cell.extraLabel.alpha = 0
                cell.reportView.alpha = 0
                cell.lineView2.alpha = 0
//                cell.nsWidth.constant = ( self.view.frame.width - 70 )
//                cell.nsHeight.constant = self.view.frame.width - 70
//                cell.imgCollectionView.layer.cornerRadius = ( self.view.frame.width - 70 )/2
//                cell.circleView.alpha = 1
                for i in cell.imgCollectionView.visibleCells{
                    if let v = i as? Tab0SoloImageCell{
                        v.CircleAnimation(circle: true)
                    }
                }
                self.contentView.nsLeft.constant = 30
                self.contentView.nsRight.constant = -30
            case .closed:

//                self.contentView.topView.alpha = 0
                self.delegate.showTopView(show: false)
                cell.nsScroll.constant = -topPadding
                cell.scrollView.contentOffset.y = 0
                cell.extraLabel.alpha = 1
                cell.reportView.alpha = 1
                cell.lineView2.alpha = 1
//                cell.nsWidth.constant = self.view.frame.width
//                cell.nsHeight.constant = self.view.frame.width
//                cell.imgCollectionView.layer.cornerRadius = 0
//                cell.circleView.alpha = 0
                for i in cell.imgCollectionView.visibleCells{
                    if let v = i as? Tab0SoloImageCell{
                        v.CircleAnimation(circle: false)
                    }
                }
                self.contentView.nsLeft.constant = 30 + (self.view.frame.width - 60)/5
                self.contentView.nsRight.constant = -30 - (self.view.frame.width - 60)/5
            }
            self.view.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                if self.currentOpen == .closed {
                    cell.opened = true
                    self.currentOpen = .opened
                    cell.scrollView.isScrollEnabled = true
                    cell.imgCollectionView.isScrollEnabled = true

                }else {
                    cell.opened = false
                    self.currentOpen = .closed
                    cell.scrollView.isScrollEnabled = false
                    cell.imgCollectionView.isScrollEnabled = false

                }
            }
        }
    }
    func expandGroupCell2(cell:Tab0GroupCell2){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let Animator = UIViewPropertyAnimator(duration: 0.1, curve: .easeIn, animations: {
            switch self.currentOpen{
            case .opened:
//                self.contentView.topView.alpha = 1
                self.delegate.showTopView(show: true)
                cell.nsScroll.constant = 80
                cell.scrollView.contentOffset.y = 0
                cell.extraLabel.alpha = 0
                cell.lineView2.alpha = 0
                self.contentView.nsLeft.constant = 30
                self.contentView.nsRight.constant = -30
                cell.imgCollectionView.alpha = 0
                cell.closeAnimation()
            case .closed:
//                self.contentView.topView.alpha = 0
                self.delegate.showTopView(show: false)
                cell.nsScroll.constant = -topPadding
                cell.scrollView.contentOffset.y = 0
                cell.extraLabel.alpha = 1
                cell.lineView2.alpha = 1
                self.contentView.nsLeft.constant = 30 + (self.view.frame.width - 60)/5
                self.contentView.nsRight.constant = -30 - (self.view.frame.width - 60)/5
                cell.imgCollectionView.alpha = 1
                cell.openAnimation()
            }
            self.view.layoutIfNeeded()
            cell.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                if self.currentOpen == .closed {
                    cell.opened = true
                    self.currentOpen = .opened
                    cell.scrollView.isScrollEnabled = true
                    cell.imgCollectionView.isScrollEnabled = true

                }else {
                    cell.opened = false
                    self.currentOpen = .closed
                    cell.scrollView.isScrollEnabled = false
                    cell.imgCollectionView.isScrollEnabled = false

                }
            }
        }
    }
    func expandGroupCell3(cell:Tab0GroupCell3){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top

        let Animator = UIViewPropertyAnimator(duration: 0.1, curve: .easeIn, animations: {
            switch self.currentOpen{
            case .opened:
//                self.contentView.topView.alpha = 1
                self.delegate.showTopView(show: true)
                cell.nsScroll.constant = 80
                cell.scrollView.contentOffset.y = 0
                cell.extraLabel.alpha = 0
                cell.lineView2.alpha = 0
                self.contentView.nsLeft.constant = 30
                self.contentView.nsRight.constant = -30
                cell.imgCollectionView.alpha = 0
                cell.closeAnimation()
            case .closed:
//                self.contentView.topView.alpha = 0
                self.delegate.showTopView(show: false)
                cell.nsScroll.constant = -topPadding
                cell.scrollView.contentOffset.y = 0
                cell.extraLabel.alpha = 1
                cell.lineView2.alpha = 1
                self.contentView.nsLeft.constant = 30 + (self.view.frame.width - 60)/5
                self.contentView.nsRight.constant = -30 - (self.view.frame.width - 60)/5
                cell.imgCollectionView.alpha = 1
                cell.openAnimation()
            }
            self.view.layoutIfNeeded()
            cell.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                if self.currentOpen == .closed {
                    cell.opened = true
                    self.currentOpen = .opened
                    cell.scrollView.isScrollEnabled = true
                    cell.imgCollectionView.isScrollEnabled = true

                }else {
                    cell.opened = false
                    self.currentOpen = .closed
                    cell.scrollView.isScrollEnabled = false
                    cell.imgCollectionView.isScrollEnabled = false

                }
            }
        }

    }
    func expandGroupCell4(cell:Tab0GroupCell4){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top

        let Animator = UIViewPropertyAnimator(duration: 0.1, curve: .easeIn, animations: {
            switch self.currentOpen{
            case .opened:
//                self.contentView.topView.alpha = 1
                self.delegate.showTopView(show: true)
                cell.nsScroll.constant = 80
                cell.scrollView.contentOffset.y = 0
                cell.extraLabel.alpha = 0
                cell.lineView2.alpha = 0
                self.contentView.nsLeft.constant = 30
                self.contentView.nsRight.constant = -30
                cell.imgCollectionView.alpha = 0
                cell.closeAnimation()
            case .closed:
//                self.contentView.topView.alpha = 0
                self.delegate.showTopView(show: false)
                cell.nsScroll.constant = -topPadding
                cell.scrollView.contentOffset.y = 0
                cell.extraLabel.alpha = 1
                cell.lineView2.alpha = 1
                self.contentView.nsLeft.constant = 30 + (self.view.frame.width - 60)/5
                self.contentView.nsRight.constant = -30 - (self.view.frame.width - 60)/5
                cell.imgCollectionView.alpha = 1
                cell.openAnimation()
            }
            self.view.layoutIfNeeded()
            cell.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                if self.currentOpen == .closed {
                    cell.opened = true
                    self.currentOpen = .opened
                    cell.scrollView.isScrollEnabled = true
                    cell.imgCollectionView.isScrollEnabled = true

                }else {
                    cell.opened = false
                    self.currentOpen = .closed
                    cell.scrollView.isScrollEnabled = false
                    cell.imgCollectionView.isScrollEnabled = false

                }
            }
        }
    }
    @objc func leftBtnFunc(_ sender:UIButton){
        sender.isEnabled = false
        if currentPage == 0 {
            sender.isEnabled = true
            return
        }
        let cellWidth = view.frame.width
        let currentOffset = CGFloat(currentPage)*cellWidth
        let nextOffset = currentOffset - cellWidth
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.contentView.collectionView.setContentOffset(CGPoint(x: nextOffset, y: 0), animated: true)

            self.view.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                sender.isEnabled = true
                self.currentPage -= 1
            }
        }
    }
    @objc func likeBtnFunc(_ sender:UIButton){
        let animationController = ShowSendLike(viewController: self)
        animationController.ShowIndicator()
        
        let currentUserid = mlistArray[self.currentPage].pid!
        actionService.sendLikeSolo(uid: currentUserid, completion: { (result) in
            guard let type = result["type"] as? String else {
                ShowAlert.OnlyDefault(vc: self, title: "", message: "알수없는 에러")
                return }
//            guard let itemId = result["pid"] as? String else { return }
            switch type{
            case "poorUser":
                animationController.removeIndicator {
                    let buyController = ShowBuyPlusVC(viewController: self)
                    buyController.ShowIndicator()
                }
            case "Match" :
                animationController.removeIndicator {
                    ShowAlert.OnlyDefault(vc: self, title: "", message: "매치되버렸다")
                }
            case "sendSuccess":
                animationController.removeIndicator {
                    self.pagingRight(completion: {})
                }
            case "likeError":
                animationController.removeIndicator {
                    ShowAlert.OnlyDefault(vc: self, title: "", message: "알수없는 에러")
                }
            default:
                animationController.removeIndicator {
                    ShowAlert.OnlyDefault(vc: self, title: "", message: "알수없는 에러")
                }
            }
            
        })
    }
    @objc func deliBtnFunc(_ sender:UIButton){
        let animationController = ShowSendDeli(viewController: self)
        animationController.ShowIndicator()
        let currentUserid = mlistArray[self.currentPage].pid!
        actionService.sendDeliSolo(uid: currentUserid, completion: { (result) in
            guard let type = result["type"] as? String else { return }
            guard let itemId = result["pid"] as? String else { return }
            switch type{
            case "poorUser":
                animationController.removeIndicator {
                    let currentDeliController = ShowCurrentDeli(viewController:self,cashItem: self.userCash)
                    currentDeliController.ShowIndicator()
                }
            case "Match" :
                animationController.removeIndicator {
                    ShowAlert.OnlyDefault(vc: self, title: "", message: "매치되버렸다")
                }
            case "sendSuccess":
                animationController.removeIndicator {
                    self.pagingRight(completion: {})
                }
            case "deliError":
                animationController.removeIndicator {
                    ShowAlert.OnlyDefault(vc: self, title: "", message: "알수없는 에러")
                }
            default:
                animationController.removeIndicator {
                    ShowAlert.OnlyDefault(vc: self, title: "", message: "알수없는 에러")
                }
            }
        })
    }
    @objc func rightBtnFunc(_ sender:UIButton){
        
        sender.isEnabled = false
        if currentPage == mlistArray.count - 1 {
            sender.isEnabled = true
            
            return
        }
        let cellWidth = view.frame.width
        let currentOffset = CGFloat(currentPage)*cellWidth
        let nextOffset = currentOffset + cellWidth
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.contentView.collectionView.setContentOffset(CGPoint(x: nextOffset, y: 0), animated: true)
//            self.contentView.collectionView.contentOffset.x = nextOffset
            self.view.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                sender.isEnabled = true
                self.currentPage += 1
//                self.currentPage = Int(self.contentView.collectionView.contentOffset.x/cellWidth)
            }
        }
        
//        let currentUserid = mlistArray[self.currentPage].pid!
//        actionService.sendPassSolo(uid: currentUserid, completion: { (result) in
//            guard let type = result["type"] as? String else { return }
//            guard let itemId = result["pid"] as? String else { return }
//            switch type{
//            case "passError":
//                ShowAlert.OnlyDefault(vc: self, title: "", message: "패스에서")
//            case "passSuccess":
//                ShowAlert.OnlyDefault(vc: self, title: "", message: "패스!")
//            default:
//                ShowAlert.OnlyDefault(vc: self, title: "", message: "알수없는 에러")
//            }
//        })
    }
    @objc func reportBtnFunc(_ sender:UIButton){
        let customAlert = CustomAlert()
        customAlert.reportAlert(inViewController: self)
        
//        let currentUserid = mlistArray[self.currentPage].pid!
//        actionService.sendLikeSolo(uid: currentUserid, completion: { (result) in
//            guard let type = result["type"] as? String else { return }
//            guard let itemId = result["pid"] as? String else { return }
//            switch type{
//            case "reportError":
//                ShowAlert.OnlyDefault(vc: self, title: "", message: "에러")
//            case "reportSuccess":
//                ShowAlert.OnlyDefault(vc: self, title: "", message: "신고접수완료")
//            default:
//                ShowAlert.OnlyDefault(vc: self, title: "", message: "알수없는 에러")
//            }
//
//        })
    }
    private func pagingRight(completion:@escaping()->Void?){
        
        if currentPage == mainList.count - 1 {
            currentPage = 0
            delegate.reloadMainList()
            return
        }
        let cellWidth = view.frame.width
        let currentOffset = CGFloat(currentPage)*cellWidth
        let nextOffset = currentOffset + cellWidth
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            
            self.contentView.collectionView.setContentOffset(CGPoint(x: nextOffset, y: 0), animated: true)
            self.view.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                self.currentPage += 1
            }
        }
    }
    private func paginLeft(completion:@escaping()->Void?){
        if currentPage == 0 {
            return
        }
        let cellWidth = view.frame.width
        let currentOffset = CGFloat(currentPage)*cellWidth
        let nextOffset = currentOffset - cellWidth
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.contentView.collectionView.setContentOffset(CGPoint(x: nextOffset, y: 0), animated: true)
            self.view.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                self.currentPage -= 1
            }
        }
    }
    
    private func configSoloCell(cell:Tab0SoloCell,data:MainListStruct)->Tab0SoloCell{
        guard let mData = data.mStruct else { return cell}
        guard let soloData  = data.soloStruct else { return cell }
        var name = ""
        print("here!!!@@@")
        if let im = soloData.im{
            let urls = CreateThumbUrl.allImgUrls(uid: soloData.uid!, imgObjs: im)
            cell.imgUrls = urls
        }
        if let index = mData.in1{
            cell.actionIndex = index
            if index == 100{
                cell.setDefault()
            }
            else if index == 200{
                cell.setPass()
            }
            else if index == 300{
                cell.setLike()
            }
            else if index == 400{
                cell.setDeli()
            }
            else if index == 500{
                cell.setMatch()
            }
            else if index >= 700 && index < 800{
                cell.setReport()
            }
        }
        if let na = soloData.na{
            name += na
        }
        if let bt = soloData.bt{
            name += ", " + CalculateAge.returnAge(birth: bt)
        }
        cell.nameLabel.text = name
        if let st = soloData.st{
            cell.statusLabel.text = st
        }
        if let lc = soloData.lc{
            cell.tagArray.append(lc)
        }
        if let job = soloData.job{
            cell.tagArray.append(job)
        }
        if let fo1 = soloData.fo1{
            cell.tagArray.append(String.SoloInfo1Array()[fo1])
        }
        if let fo2 = soloData.fo2{
            cell.tagArray.append(String.SoloInfo2Array()[fo2])
        }
        if let fo3 = soloData.fo3{
            cell.tagArray.append(String.SoloInfo3Array()[fo3])
        }
        if let fo4 = soloData.fo4{
            cell.tagArray.append(String.SoloInfo4Array()[fo4])
        }
        if let ex = soloData.ex{
            cell.extraLabel.text = ex
        }
        return cell
        
    }
    private func configGroup2Cell(cell:Tab0GroupCell2,data:MainListStruct)->Tab0GroupCell2{
        guard let mData = data.mStruct else { return cell}
        guard let memberData = data.memberStruct else { return cell }
        guard let groupData = data.groupStruct else { return cell }
        guard let user1 = data.memberStruct?.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        guard let user2 = data.memberStruct?.first(where: {$0.uid! == groupData.uid2!}) else { return cell }
        if let user1Name = user1.na{
            if let bt = user1.bt{
                let ageStr = CalculateAge.returnAge(birth: bt)
                cell.nameLabel1.text = "\(user1Name), \(ageStr)"
            }else{
                cell.nameLabel1.text = user1Name
            }
        }
        if let index = mData.in1{
            cell.actionIndex = index
            if index == 100{
                cell.setDefault()
            }
            else if index == 200{
                cell.setPass()
            }
            else if index == 300{
                cell.setLike()
            }
            else if index == 400{
                cell.setDeli()
            }
            else if index == 500{
                cell.setMatch()
            }
            else if index >= 700 && index < 800{
                cell.setReport()
            }
        }
        if let user2Name = user2.na{
            if let bt = user2.bt{
                let ageStr = CalculateAge.returnAge(birth: bt)
                cell.nameLabel2.text = "\(user2Name), \(ageStr)"
            }else{
                cell.nameLabel2.text = user2Name
            }
        }
        var imgUrl = [URL]()
        if let userIm1 = memberData[0].im{
            let url = CreateThumbUrl.mainImgUrl(uid: memberData[0].uid!, imgObjs: userIm1)
            cell.imgView1.sd_setImage(with: url)
            imgUrl.append(url)
        }
        if let userIm2 = memberData[1].im{
            let url = CreateThumbUrl.mainImgUrl(uid: memberData[1].uid!, imgObjs: userIm2)
            cell.imgView2.sd_setImage(with: url)
            imgUrl.append(url)
        }
        cell.imgUrls = imgUrl
        if let groupNa = groupData.na{
            cell.nameLabel.text = groupNa
        }
        if let groupSt = groupData.st{
            cell.statusLabel.text = groupSt
        }
        if let groupLo = groupData.lo{
            cell.tagArray.append(groupLo)
        }
        if let groupFo1 = groupData.fo1{
            cell.tagArray.append(String.GroupInfo1Array()[groupFo1])
        }
        if let groupFo2 = groupData.fo2{
            cell.tagArray.append(String.GroupInfo2Array()[groupFo2])
        }
        if let groupFo3 = groupData.fo3{
            cell.tagArray.append(String.GroupInfo3Array()[groupFo3])
        }
        return cell
        
    }
    private func configGroup3Cell(cell:Tab0GroupCell3,data:MainListStruct)->Tab0GroupCell3{
        guard let mData = data.mStruct else { return cell}
        guard let memberData = data.memberStruct else { return cell }
        guard let groupData = data.groupStruct else { return cell }
        guard let user1 = data.memberStruct?.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        guard let user2 = data.memberStruct?.first(where: {$0.uid! == groupData.uid2!}) else { return cell }
        guard let user3 = data.memberStruct?.first(where: {$0.uid! == groupData.uid3!}) else { return cell }
        
        if let index = mData.in1{
            cell.actionIndex = index
            if index == 100{
                cell.setDefault()
            }
            else if index == 200{
                cell.setPass()
            }
            else if index == 300{
                cell.setLike()
            }
            else if index == 400{
                cell.setDeli()
            }
            else if index == 500{
                cell.setMatch()
            }
            else if index >= 700 && index < 800{
                cell.setReport()
            }
        }
        if let user1Name = user1.na{
            if let bt = user1.bt{
                let ageStr = CalculateAge.returnAge(birth: bt)
                cell.nameLabel1.text = "\(user1Name), \(ageStr)"
            }else{
                cell.nameLabel1.text = user1Name
            }
        }
        if let user2Name = user2.na{
            if let bt = user2.bt{
                let ageStr = CalculateAge.returnAge(birth: bt)
                cell.nameLabel2.text = "\(user2Name), \(ageStr)"
            }else{
                cell.nameLabel2.text = user2Name
            }
        }
        if let user3Name = user3.na{
            if let bt = user3.bt{
                let ageStr = CalculateAge.returnAge(birth: bt)
                cell.nameLabel3.text = "\(user3Name), \(ageStr)"
            }else{
                cell.nameLabel3.text = user3Name
            }
        }
        var imgUrl = [URL]()
        if let userIm1 = user1.im{
            let url = CreateThumbUrl.mainImgUrl(uid: user1.uid!, imgObjs: userIm1)
            cell.imgView1.sd_setImage(with: url)
            imgUrl.append(url)
        }
        if let userIm2 = user2.im{
            let url = CreateThumbUrl.mainImgUrl(uid: user2.uid!, imgObjs: userIm2)
            cell.imgView2.sd_setImage(with: url)
            imgUrl.append(url)
        }
        if let userIm3 = user3.im{
            let url = CreateThumbUrl.mainImgUrl(uid: user3.uid!, imgObjs: userIm3)
            cell.imgView3.sd_setImage(with: url)
            imgUrl.append(url)
        }
        cell.imgUrls = imgUrl
        if let groupNa = groupData.na{
            cell.nameLabel.text = groupNa
        }
        if let groupSt = groupData.st{
            cell.statusLabel.text = groupSt
        }
        if let groupLo = groupData.lo{
            cell.tagArray.append(groupLo)
        }
        if let groupFo1 = groupData.fo1{
            cell.tagArray.append(String.GroupInfo1Array()[groupFo1])
        }
        if let groupFo2 = groupData.fo2{
            cell.tagArray.append(String.GroupInfo2Array()[groupFo2])
        }
        if let groupFo3 = groupData.fo3{
            cell.tagArray.append(String.GroupInfo3Array()[groupFo3])
        }
        return cell
        
    }
    private func configGroup4Cell(cell:Tab0GroupCell4,data:MainListStruct)->Tab0GroupCell4{
        guard let mData = data.mStruct else { return cell}
        
        guard let memberData = data.memberStruct else { return cell }
        guard let groupData = data.groupStruct else { return cell }
        guard let user1 = data.memberStruct?.first(where: {$0.uid! == groupData.uid1!}) else { return cell }
        guard let user2 = data.memberStruct?.first(where: {$0.uid! == groupData.uid2!}) else { return cell }
        guard let user3 = data.memberStruct?.first(where: {$0.uid! == groupData.uid3!}) else { return cell }
        guard let user4 = data.memberStruct?.first(where: {$0.uid! == groupData.uid4!}) else { return cell }
        
        
        if let index = mData.in1{
            cell.actionIndex = index
            if index == 100{
                cell.setDefault()
            }
            else if index == 200{
                cell.setPass()
            }
            else if index == 300{
                cell.setLike()
            }
            else if index == 400{
                cell.setDeli()
            }
            else if index == 500{
                cell.setMatch()
            }
            else if index >= 700 && index < 800{
                cell.setReport()
            }
        }
        if let user1Name = user1.na{
            if let bt = user1.bt{
                let ageStr = CalculateAge.returnAge(birth: bt)
                cell.nameLabel1.text = "\(user1Name), \(ageStr)"
            }else{
                cell.nameLabel1.text = user1Name
            }
        }
        if let user2Name = user2.na{
            if let bt = user2.bt{
                let ageStr = CalculateAge.returnAge(birth: bt)
                cell.nameLabel2.text = "\(user2Name), \(ageStr)"
            }else{
                cell.nameLabel2.text = user2Name
            }
        }
        if let user3Name = user3.na{
            if let bt = user3.bt{
                let ageStr = CalculateAge.returnAge(birth: bt)
                cell.nameLabel3.text = "\(user3Name), \(ageStr)"
            }else{
                cell.nameLabel3.text = user3Name
            }
        }
        if let user4Name = user4.na{
            if let bt = user4.bt{
                let ageStr = CalculateAge.returnAge(birth: bt)
                cell.nameLabel4.text = "\(user4Name), \(ageStr)"
            }else{
                cell.nameLabel4.text = user4Name
            }
        }
        if let user1Name = user1.na{
            if let bt = user1.bt{
                let ageStr = CalculateAge.returnAge(birth: bt)
                cell.nameLabel1.text = "\(user1Name), \(ageStr)"
            }else{
                cell.nameLabel1.text = user1Name
            }
        }
        var imgUrl = [URL]()
        if let userIm1 = user1.im{
            let url = CreateThumbUrl.mainImgUrl(uid: user1.uid!, imgObjs: userIm1)
            cell.imgView1.sd_setImage(with: url)
            imgUrl.append(url)
        }
        if let userIm2 = user2.im{
            let url = CreateThumbUrl.mainImgUrl(uid: user2.uid!, imgObjs: userIm2)
            cell.imgView2.sd_setImage(with: url)
            imgUrl.append(url)
        }
        if let userIm3 = user3.im{
            let url = CreateThumbUrl.mainImgUrl(uid: user3.uid!, imgObjs: userIm3)
            cell.imgView3.sd_setImage(with: url)
            imgUrl.append(url)
        }
        if let userIm4 = user4.im{
            let url = CreateThumbUrl.mainImgUrl(uid: user4.uid!, imgObjs: userIm4)
            cell.imgView4.sd_setImage(with: url)
            imgUrl.append(url)
        }
        cell.imgUrls = imgUrl
        if let groupNa = groupData.na{
            cell.nameLabel.text = groupNa
        }
        if let groupSt = groupData.st{
            cell.statusLabel.text = groupSt
        }
        if let groupLo = groupData.lo{
            cell.tagArray.append(groupLo)
        }
        if let groupFo1 = groupData.fo1{
            cell.tagArray.append(String.GroupInfo1Array()[groupFo1])
        }
        if let groupFo2 = groupData.fo2{
            cell.tagArray.append(String.GroupInfo2Array()[groupFo2])
        }
        if let groupFo3 = groupData.fo3{
            cell.tagArray.append(String.GroupInfo3Array()[groupFo3])
        }
        return cell
        
    }
    
}
extension Tab0VC:UICollectionViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = contentView.collectionView.contentOffset.x
    }
}
extension Tab0VC:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return mainList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let soloCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Tab0SoloCellid", for: indexPath) as! Tab0SoloCell
        let groupCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "Tab0GroupCellid2", for: indexPath) as! Tab0GroupCell2
        let groupCell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "Tab0GroupCellid3", for: indexPath) as! Tab0GroupCell3
        let groupCell4 = collectionView.dequeueReusableCell(withReuseIdentifier: "Tab0GroupCellid4", for: indexPath) as! Tab0GroupCell4
        
        let mainData = mainList[indexPath.row]
        switch mainData.mStruct?.num!{
        case 1:
            return configSoloCell(cell: soloCell, data: mainData)
        case 2:
            return configGroup2Cell(cell: groupCell2, data: mainData)
        case 3:
            return configGroup3Cell(cell: groupCell3, data: mainData)
        case 4:
            return configGroup4Cell(cell: groupCell4, data: mainData)
        default:
            return UICollectionViewCell()
        }

        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}
extension Tab0VC:ChooseMyGroupDelegate{
    func closeWithGroup(gid: String,isLike:Bool) {
        if gid == ""{
            return
        }
        if let myGroup = myGroups.first(where: {$0.listInfo?.id! == gid}){
            let mUids = myGroup.listInfo?.uids!
            if isLike{
                self.groupLikeFunc(myGid: gid, myUids: mUids!, completion: {})
            }else{
                self.groupDeliFunc(myGid: gid, myUids: mUids!, completion: {})
            }
        }
        
    }
}

extension Tab0VC:Tab0ServiceDelegate{
    func pagingRight() {
        self.pagingToRight(page:0) {
            self.enableBtns()
        }
    }
}
