//
//  RootVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 05/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


private enum rightState{
    case SoloFeed
    case SoloChat
    case GroupNoti
    case GroupChat
}
import UIKit
import FirebaseAuth

class RootVC: UIViewController {
    
    
    var presentingTransition:AlphaTransitionPresent?
    var dismissingTransition:AlphaTransitionDismiss?
    

    var tab0VC:Tab0VC!
    var contentView:RootView!
    
    
    var soloChatVC:SoloChatVC!
    var groupChatVC:GroupChatVC1!
    
    
    var soloFeedVC:SoloNotiVC!
    var groupNotiVC:GroupNotiVC1!
    
    var myProfileVC:SoloProfileVC!
    
    
    
    var pushVC:PushViewController!
    
    var feedUserProfileVC:FeedUserProfileVC!
    var matchUserProfileVC:MatchUserProfileVC!
    var matchGroup2ProfileVC:MatchGroup2ProfileVC!
    var matchGroup3ProfileVC:MatchGroup3ProfileVC!
    var matchGroup4ProfileVC:MatchGroup4ProfileVC!
    
    
    var feedGroup2ProfileVC:FeedGroup2ProfileVC!
    var feedGroup3ProfileVC:FeedGroup3ProfileVC!
    var feedGroup4ProfileVC:FeedGroup4ProfileVC!
    
    var waitGroup2ProfileVC:WaitGroup2ProfileVC!
    var waitGroup3ProfileVC:WaitGroup3ProfileVC!
    var waitGroup4ProfileVC:WaitGroup4ProfileVC!
    
    var requestVC:RequestViewController!
    var unRequestVC:UnRequestViewController!
    var blockUserVC:BlockUserViewController!
    var suspendUserVC:SuspendUserViewController!
    
    
    
    
    
    var soloChatContentVC:SoloChatContentVC!
    var group2ChatContentVC:Group2ChatContentVC!
    var group3ChatContentVC:Group3ChatContentVC!
    var group4ChatContentVC:Group4ChatContentVC!
    
    
    var menuVC:MenuVC!
    
    
    
    var alreadyActionVC:AlreadyActionVC!
    var noLikeVC:EmptyLikeAlertVC!
    var noDeliVC:EmptyDeliAlertVC!
    var soloMatchVC:SoloMatchViewController!
    var errorVC:ErrorAlertVC!
    var plusUserVC:StopLeftPagingAlertVC!
    
    var noGroupVC:NoGroupListVC!
    var chooseMyGroupVC:ChooseMyGroupVC!
    
    
    private var currentRight:rightState = .SoloFeed
    
    
    var currentGroupString:String = ""
    var isChat:Bool = false
    
    
    var mainService : MainService!
    var sideArray = [String]()
    
    
    var nsMenu:NSLayoutConstraint!
    var menuOpen = false
    
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView = RootView(frame: view.bounds)
        contentView.delegate = self
        contentView.frame = view.bounds
        view.addSubview(contentView)
        view.backgroundColor = UIColor.white
        createTab0VC()
        view.bringSubviewToFront(contentView.rightView)
        setProperty()
        createMenuVC()
        createSoloFeed()
        createSoloChat()
        createGroupChat()
        createGroupFeed()
        
        soloFeedVC.view.isHidden = true
        soloChatVC.view.isHidden = true
        groupChatVC.view.isHidden = true
        groupNotiVC.view.isHidden = true
        
        contentView.rightBtn.addTarget(self, action: #selector(rightBtnFunc(_:)), for: .touchUpInside)
        contentView.menuBtn.addTarget(self, action: #selector(leftBtnFunc(_:)), for: .touchUpInside)
        
        
        contentView.notiBtn.addTarget(self, action: #selector(topBtnFunc(_:)), for: .touchUpInside)
        contentView.chatBtn.addTarget(self, action: #selector(topBtnFunc(_:)), for: .touchUpInside)
        
        print("VIEWAPPEAR222")
//        contentView.menuBtn.addTarget(self, action: #selector(menuBtnFunc(_:)), for: .touchUpInside)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        if mainService == nil{
            let window = UIApplication.shared.windows[0]
            let topPadding = window.safeAreaInsets.top
            let frame = CGRect(x:0,y:0,width:contentView.frame.width,height: topPadding + 70)
            mainService = MainService(viewController: self,pushFrame:frame)
            mainService.delegate = self
        }
        print("VIEWAPPEAR111")
        
        contentView.topCollectionView.cellForItem(at: IndexPath(row: 0, section: 0))?.isSelected = true
        
    }
    
    func presentUserVC(userData:MainListStruct){
        guard let soloData = userData.soloStruct else { return }
        guard let im = soloData.im else { return }
        
        let imgArray = CreateThumbUrl.allImgUrls(uid: soloData.uid!, imgObjs: im)
        var tagArray = [String]()
        if let fo1 = soloData.fo1{
            tagArray.append(String.SoloInfo1Array()[fo1])
        }
        if let fo2 = soloData.fo2{
            tagArray.append(String.SoloInfo2Array()[fo2])
        }
        if let fo3 = soloData.fo3{
            tagArray.append(String.SoloInfo3Array()[fo3])
        }
        if let fo4 = soloData.fo4{
            tagArray.append(String.SoloInfo4Array()[fo4])
        }
        
        feedUserProfileVC = FeedUserProfileVC()
        feedUserProfileVC.detailUser = userData
        view.addSubview(feedUserProfileVC.view)
        feedUserProfileVC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        feedUserProfileVC.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        feedUserProfileVC.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        feedUserProfileVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    @objc func menuBtnFunc(_ sender:UIButton){
        if contentView.currentLeftPageState == .side{
            contentView.menuCloseAnimation()
        }
    }
    @objc func leftBtnFunc(_ sender:UIButton){
        if contentView.currentLeftPageState == .main{
            contentView.menuOpenAnimation()
        }else{
            contentView.menuCloseAnimation()
        }
    }
    @objc func rightBtnFunc(_ sender:UIButton){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        
        
        if contentView.currentRightPageState == .main{
            contentView.openAnimation()
        }else{
            contentView.closeAnimation()
        }
    }
    
    
    @objc func filterBtnFunc(_ sender:UIButton){
        let vc = MatchFilterVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: {})
    }
    @objc func blockBtnFunc(_ sender:UIButton){
        let vc = UserBlockVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: {})
        
    }
    @objc func settingBtnFunc(_ sender:UIButton){
        let vc = SettingVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: {})
    }
    @objc func addGroupBtnFunc(_ sender:UIButton){
        
        let vc = CreateGroupVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: {})
        
    }
    @objc func topBtnFunc(_ sender:UIButton){
        if sender == contentView.notiBtn{
            if currentGroupString == ""{
                soloChatVC.view.isHidden = true
                soloFeedVC.view.isHidden = false
                groupChatVC.view.isHidden = true
                groupNotiVC.view.isHidden = true
            }else{
                soloChatVC.view.isHidden = true
                soloFeedVC.view.isHidden = true
                groupChatVC.view.isHidden = true
                groupNotiVC.view.isHidden = false
                groupNotiVC.showGroup(gid: currentGroupString)
            }
            self.isChat = false
        }else{
            if currentGroupString == ""{
                soloChatVC.view.isHidden = false
                soloFeedVC.view.isHidden = true
                groupChatVC.view.isHidden = true
                groupNotiVC.view.isHidden = true
                groupChatVC.showGroup(gid: currentGroupString)
            }else{
                soloChatVC.view.isHidden = true
                soloFeedVC.view.isHidden = true
                groupChatVC.view.isHidden = false
                groupNotiVC.view.isHidden = true
                groupChatVC.showGroup(gid: currentGroupString)
            }
            self.isChat = true
        }
        
    }
    private func viewTransition(gid:String){
        
        self.currentGroupString = gid
        if gid == ""{
            if isChat{
                soloChatVC.view.isHidden = false
                soloFeedVC.view.isHidden = true
                groupChatVC.view.isHidden = true
                groupNotiVC.view.isHidden = true
            }else{
                soloChatVC.view.isHidden = true
                soloFeedVC.view.isHidden = false
                groupChatVC.view.isHidden = true
                groupNotiVC.view.isHidden = true
            }
        }else{
            if isChat{
                soloChatVC.view.isHidden = true
                soloFeedVC.view.isHidden = true
                groupChatVC.view.isHidden = false
                groupNotiVC.view.isHidden = true
                groupChatVC.showGroup(gid: gid)
                
            }else{
                soloChatVC.view.isHidden = true
                soloFeedVC.view.isHidden = true
                groupChatVC.view.isHidden = true
                groupNotiVC.view.isHidden = false
                groupNotiVC.showGroup(gid: gid)
            }
        }
    }
    
    
    
}
extension RootVC{
    func showRequestView(){
        if unRequestVC != nil{
            removeUnRequestView()
        }
        if suspendUserVC != nil{
            removeSuspendUserView()
        }
        if blockUserVC != nil{
            removeBlockedUserView()
        }
        if requestVC != nil{
            return
        }
        requestVC = RequestViewController()
        self.view.addSubview(requestVC.view)
        requestVC.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        requestVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        requestVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        requestVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    func showUnRequestView(type:Int){
        if requestVC != nil{
            removeRequestView()
        }
        if suspendUserVC != nil{
            removeSuspendUserView()
        }
        if blockUserVC != nil{
            removeBlockedUserView()
        }
        if unRequestVC != nil{
            return
        }
        unRequestVC = UnRequestViewController()
        self.view.addSubview(unRequestVC.view)
        unRequestVC.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        unRequestVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        unRequestVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        unRequestVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    func showSuspendUserView(){
        if blockUserVC != nil{
            removeBlockedUserView()
        }
        if requestVC != nil{
            removeRequestView()
        }
        if unRequestVC != nil{
            removeUnRequestView()
        }
        if suspendUserVC != nil{
            return
        }
        suspendUserVC = SuspendUserViewController()
        self.view.addSubview(suspendUserVC.view)
        suspendUserVC.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        suspendUserVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        suspendUserVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        suspendUserVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    func showBlockedUserView(){
        if requestVC != nil{
            removeRequestView()
        }
        if unRequestVC != nil{
            removeUnRequestView()
        }
        if suspendUserVC != nil{
            removeSuspendUserView()
        }
        if blockUserVC != nil{
            return
        }
        blockUserVC = BlockUserViewController()
        self.view.addSubview(blockUserVC.view)
        blockUserVC.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        blockUserVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        blockUserVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        blockUserVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    func removeSuspendUserView(){
        if suspendUserVC == nil{
            return
        }
        suspendUserVC.contentView.closeAnimation(){
            self.suspendUserVC.dismiss(animated: false, completion: {
                self.suspendUserVC.view.removeFromSuperview()
                self.suspendUserVC.removeFromParent()
                self.suspendUserVC = nil
            })
        }
    }
    func removeBlockedUserView(){
        if blockUserVC == nil{
            return
        }
        blockUserVC.contentView.closeAnimation(){
            self.blockUserVC.dismiss(animated: false, completion: {
                self.blockUserVC.view.removeFromSuperview()
                self.blockUserVC.view.removeFromSuperview()
                self.blockUserVC = nil
            })
        }
    }
    func removeRequestView(){
        if requestVC == nil{
            return
        }
        requestVC.contentView.closeAnimation(){
            self.requestVC.dismiss(animated: false, completion: {
                self.requestVC.removeFromParent()
                self.requestVC.view.removeFromSuperview()
                self.requestVC = nil
            })
        }
    }
    func removeUnRequestView(){
        if unRequestVC == nil{
            return
        }
        unRequestVC.contentView.closeAnimation(){
            self.unRequestVC.dismiss(animated: false, completion: {
                self.unRequestVC.removeFromParent()
                self.unRequestVC.view.removeFromSuperview()
                self.unRequestVC = nil
            })
        }
    }
    func openView(){
        if unRequestVC != nil{
            removeUnRequestView()
        }
        if suspendUserVC != nil{
            removeSuspendUserView()
        }
        if blockUserVC != nil{
            removeBlockedUserView()
        }
        if requestVC != nil{
            removeRequestView()
        }
        contentView.menuBtn.alpha = 1
        contentView.rightBtn.alpha = 1
        contentView.panGesture.isEnabled = true
    }
    func showPushView(inputView:UIView){
        print("pushTAG")
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        if pushVC != nil{
            print("PushNil")
            return
        }
        pushVC = PushViewController()
        pushVC.requestView = inputView
        self.view.addSubview(pushVC.view)
        pushVC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pushVC.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        pushVC.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        pushVC.view.heightAnchor.constraint(equalToConstant: topPadding + 70).isActive = true
        
        pushVC = nil
    }
    func setProperty(){
        contentView.topCollectionView.dataSource = self
        contentView.topCollectionView.delegate = self
        contentView.topCollectionView.register(SideViewTopCell.self, forCellWithReuseIdentifier: "SideViewTopCellid")
    }
    
    func createTab0VC(){
        tab0VC = Tab0VC()
        tab0VC.delegate = self
        tab0VC.didMove(toParent: self)
        tab0VC.view.frame = contentView.mainContainerView.bounds
        contentView.mainContainerView.addSubview(tab0VC.view)
    }
    func createMenuVC(){
        menuVC = MenuVC()
        menuVC.didMove(toParent: self)
        menuVC.delegate = self
        contentView.menuView.addSubview(menuVC.view)
        menuVC.view.topAnchor.constraint(equalTo: contentView.menuView.topAnchor).isActive = true
        menuVC.view.leftAnchor.constraint(equalTo: contentView.menuView.leftAnchor).isActive = true
        menuVC.view.rightAnchor.constraint(equalTo: contentView.menuView.rightAnchor).isActive = true
        menuVC.view.bottomAnchor.constraint(equalTo: contentView.menuView.bottomAnchor).isActive = true
        
        menuVC.contentView.blockBtn.addTarget(self, action: #selector(blockBtnFunc(_:)), for: .touchUpInside)
        menuVC.contentView.filterBtn.addTarget(self, action: #selector(filterBtnFunc(_:)), for: .touchUpInside)
        menuVC.contentView.menuBtn.addTarget(self, action: #selector(menuBtnFunc(_:)), for: .touchUpInside)
        menuVC.contentView.addGroupBtn.addTarget(self, action: #selector(addGroupBtnFunc(_:)), for: .touchUpInside)
        menuVC.contentView.settingBtn.addTarget(self, action: #selector(settingBtnFunc(_:)), for: .touchUpInside)
        
    }
    func setMenuVC(){
        menuVC.contentView.blockBtn.addTarget(self, action: #selector(blockBtnFunc(_:)), for: .touchUpInside)
        menuVC.contentView.filterBtn.addTarget(self, action: #selector(filterBtnFunc(_:)), for: .touchUpInside)
        menuVC.contentView.menuBtn.addTarget(self, action: #selector(menuBtnFunc(_:)), for: .touchUpInside)
        menuVC.contentView.addGroupBtn.addTarget(self, action: #selector(addGroupBtnFunc(_:)), for: .touchUpInside)
        menuVC.contentView.settingBtn.addTarget(self, action: #selector(settingBtnFunc(_:)), for: .touchUpInside)
    }
    func createSoloChat(){
        soloChatVC = SoloChatVC()
        soloChatVC.delegate = self
        
        soloChatVC.didMove(toParent: self)
        contentView.containerView.addSubview(soloChatVC.view)
        soloChatVC.view.topAnchor.constraint(equalTo: contentView.containerView.topAnchor).isActive = true
        soloChatVC.view.leftAnchor.constraint(equalTo: contentView.containerView.leftAnchor).isActive = true
        soloChatVC.view.rightAnchor.constraint(equalTo: contentView.containerView.rightAnchor).isActive = true
        soloChatVC.view.bottomAnchor.constraint(equalTo: contentView.containerView.bottomAnchor).isActive = true
        
        soloChatVC.contentView.chatCollectionView.reloadData()
    }
    func createGroupChat(){
        currentRight = .GroupChat
        isChat = true
        if groupChatVC == nil {
            groupChatVC = GroupChatVC1()
        }
        groupChatVC.delegate = self
        groupChatVC.didMove(toParent: self)
        contentView.containerView.addSubview(groupChatVC.view)
        groupChatVC.view.topAnchor.constraint(equalTo: contentView.containerView.topAnchor).isActive = true
        groupChatVC.view.rightAnchor.constraint(equalTo: contentView.containerView.rightAnchor).isActive = true
        groupChatVC.view.bottomAnchor.constraint(equalTo: contentView.containerView.bottomAnchor).isActive = true
        groupChatVC.view.leftAnchor.constraint(equalTo: contentView.containerView.leftAnchor).isActive = true
    }
    func createSoloFeed(){
        soloFeedVC = SoloNotiVC()
        soloFeedVC.delegate = self
        soloFeedVC.didMove(toParent: self)
        contentView.containerView.addSubview(soloFeedVC.view)
        soloFeedVC.view.topAnchor.constraint(equalTo: contentView.containerView.topAnchor).isActive = true
        soloFeedVC.view.leftAnchor.constraint(equalTo: contentView.containerView.leftAnchor).isActive = true
        soloFeedVC.view.rightAnchor.constraint(equalTo: contentView.containerView.rightAnchor).isActive = true
        soloFeedVC.view.bottomAnchor.constraint(equalTo: contentView.containerView.bottomAnchor).isActive = true
        
        soloFeedVC.contentView.notiCollectionView.reloadData()
    }
    func createGroupFeed(){
        groupNotiVC = GroupNotiVC1()
        groupNotiVC.delegate = self
        groupNotiVC.delegate = self
        groupNotiVC.didMove(toParent: self)
        contentView.containerView.addSubview(groupNotiVC.view)
        groupNotiVC.view.topAnchor.constraint(equalTo: contentView.containerView.topAnchor).isActive = true
        groupNotiVC.view.leftAnchor.constraint(equalTo: contentView.containerView.leftAnchor).isActive = true
        groupNotiVC.view.rightAnchor.constraint(equalTo: contentView.containerView.rightAnchor).isActive = true
        groupNotiVC.view.bottomAnchor.constraint(equalTo: contentView.containerView.bottomAnchor).isActive = true
        
        groupNotiVC.reloadCollectionView()
    }
}

extension RootVC:UICollectionViewDelegate{
    
}
extension RootVC:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if mainService == nil{
            return 1
        }else{
            return 1 + mainService.activeGroupList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SideViewTopCellid", for: indexPath) as! SideViewTopCell
        if indexPath.row == 0{
            cell.nameLabel.text = "나"
        }else{
            cell.nameLabel.text = mainService.activeGroupList[indexPath.row - 1].groupInfo?.na!
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0{
            let title = "나"
            let size = title.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28)])
            let width = CGFloat(ceilf(Float(size.width + CGFloat(38))))
            return CGSize(width: width, height: collectionView.frame.height)
        }else{
            let title = mainService.activeGroupList[indexPath.row - 1].groupInfo?.na!
            let size = title!.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28)])
            let width = CGFloat(ceilf(Float(size.width + CGFloat(38))))
            return CGSize(width: width, height: collectionView.frame.height)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0{
            viewTransition(gid: "")
        }else{
            let gid = mainService.activeGroupList[indexPath.row - 1].listInfo?.id!
            viewTransition(gid: gid!)
        }
    }
}

extension RootVC:MainServiceDelegate{
    func addSoloLikeUser(userData: SoloStruct) {
        
    }
    
    func removeSoloLikeUser(userIdentifier: String) {
        
    }
    
    func addSoloDeliUser(userData: SoloStruct) {
        
    }
    
    func removeSoloDeliUser(userIdentifier: String) {
        
    }
    func ControlUserStateView(type: Int) {
        if type == 100{
            showRequestView()
        }
        else if type == 201 || type == 202 || type == 203{
            showUnRequestView(type: type)
        }
        else if type == 801{
            showBlockedUserView()
        }
        else if type == 901{
            showSuspendUserView()
        }
        else if type == 301{
            openView()
        }
    }
    func ControlMainDelegate(resultStr: String,im:[imgStruct]) {
        
//        self.tab0VC.contentView.collectionView.alpha = 1
//        self.tab0VC.contentView.btnView.alpha = 1
//
//        self.tab0VC.contentView.showNoLogView(){ (label) in
//            let controller = UpdateLogTimeCount()
//            controller.CalculateTime(from: self.mainService.cashItem.logTp!.seconds, label: label)
//        }
//        let url = CreateThumbUrl.mainImgUrl(uid: Auth.auth().currentUser!.uid, imgObjs: im)
//        self.tab0VC.contentView.showFindingView(url: url)
//        self.tab0VC.contentView.showBlockView()
//        self.tab0VC.contentView.showErrorView()
//        self.tab0VC.contentView.showSuspendingView()
        
//        return
//        return
        print(resultStr,"RESULTSTR")
        if resultStr == "Remove"{
            tab0VC.mainList.removeAll()
        }
        if resultStr == "onCallFunction"{

            self.tab0VC.contentView.descriptionLabel.alpha = 0
            self.tab0VC.contentView.collectionView.alpha = 0
            self.tab0VC.contentView.btnView.alpha = 0
            let url = CreateThumbUrl.mainImgUrl(uid: Auth.auth().currentUser!.uid, imgObjs: im)
            tab0VC.contentView.showFindingView(url: url)
            return
            
        }
        if resultStr == "internalError"{
            if tab0VC.contentView.findingView != nil{
                tab0VC.contentView.removeIndicatorView()
            }
            tab0VC.contentView.descriptionLabel.text = "통신에러"
            return
        }
        if resultStr == "error"{
            if tab0VC.contentView.findingView != nil{
                tab0VC.contentView.removeIndicatorView()
            }
            tab0VC.contentView.showErrorView()
            return
        }
        if resultStr == "success"{
            if tab0VC.contentView.findingView != nil{
                tab0VC.contentView.removeIndicatorView()
            }
            self.mainService.ReloadMainListener()
            UIView.animate(withDuration: 0.3, animations: {
                self.tab0VC.contentView.descriptionLabel.alpha = 0
                self.tab0VC.contentView.collectionView.alpha = 1
                self.tab0VC.contentView.btnView.alpha = 1
            })
            self.tab0VC.view.layoutIfNeeded()
            self.tab0VC.contentView.collectionView.reloadData()
            return
            
        }
        if resultStr == "noLogItem"{
            if tab0VC.contentView.findingView != nil{
                tab0VC.contentView.removeIndicatorView()
            }
            self.tab0VC.contentView.showNoLogView(){ (label) in
                let controller = UpdateLogTimeCount()
                controller.CalculateTime(from: self.mainService.cashItem.logTp!.seconds, label: label)
            }
            return
        }
        if resultStr == "noData"{
            if tab0VC.contentView.findingView != nil{
                tab0VC.contentView.removeIndicatorView()
            }
            tab0VC.contentView.descriptionLabel.text = "주변에 사람이 없습니다"
            return
        }
        if resultStr == "blocked"{
            return
        }
        if resultStr == "suspending"{
            return
        }
        if resultStr == "continue"{
            if tab0VC.contentView.findingView != nil{
                tab0VC.contentView.removeIndicatorView()
            }
            self.tab0VC.contentView.descriptionLabel.alpha = 0
            self.tab0VC.contentView.collectionView.alpha = 1
            self.tab0VC.contentView.btnView.alpha = 1
            self.tab0VC.contentView.collectionView.reloadData()
            self.tab0VC.view.layoutIfNeeded()
            return
        }
    }
    
    
    func AddGroupMatch(gData: SideGroupStruct) {
        groupChatVC.setChatList(data: gData, myGid: gData.GL!.gid!)
    }
    
    func AddGroupFeedVote(gData: SideGroupStruct) {
        guard let gl = gData.GL else { return }
        if gl.ind2! == 300 || gl.ind2! == 400 {
            groupNotiVC.setFeedList(data: gData, myGid: gData.GL!.gid!)
            return;
        }
        if gl.ind1! == 100{
            groupNotiVC.setWaitList(data: gData, myGid: gData.GL!.gid!)
            return;
        }
    }
    
    
    func AddMyGroup(data: MyGroupListStruct) {
        tab0VC.myGroups = mainService.activeGroupList
        tab0VC.service.updateMyGroups(myGroups: mainService.activeGroupList)
        menuVC.groupList = mainService.userGroupList
        groupNotiVC.setMyGroupData(data: data)
        groupChatVC.setMyGroup(data: data)
        menuVC.contentView.groupCollectionView.reloadData()
        contentView.topCollectionView.reloadData()
    }
    func ModifyMyGroup(data: MyinfoStruct) {
        tab0VC.myGroups = mainService.activeGroupList
        menuVC.groupList = mainService.userGroupList
        menuVC.contentView.groupCollectionView.reloadData()
        contentView.topCollectionView.reloadData()
        if let find = mainService.activeGroupList.first(where: {$0.groupInfo?.gid! == data.id!}){
            groupNotiVC.setMyGroupData(data: find)
            groupChatVC.setMyGroup(data: find)
        }
    }
    func UpdateMainList(mData: MStruct) {
        if let find = tab0VC.mainList.first(where: {$0.mStruct?.pid! == mData.pid!}){
            find.mStruct = mData
        }
    }
    
    
    func RemoveSoloMatch(data:MStruct) {
        soloChatVC.removeData(target: data)
    }
    
    func RemoveSoloFeed(data:MStruct) {
        soloFeedVC.removeTarget(target: data)
    }
    
    
    func AddSoloMatch(data:MainListStruct) {
        if soloChatVC.totalList.contains(where: {$0.soloData?.mStruct?.pid! == data.mStruct?.pid!}){
            return;
        }else{
            soloChatVC.createPartner(data: data)
        }
        
    }
    func AddSoloFeed(data:MainListStruct) {
        if soloFeedVC.feedList.contains(where: {$0.mStruct?.pid! == data.mStruct?.pid!}){
            return;
        }
        soloFeedVC.feedList.insert(data, at: 0)
        soloFeedVC.contentView.notiCollectionView.reloadData()
    }
    func AddMainList(mData: MainListStruct) {
        if (mData.soloStruct == nil && mData.groupStruct == nil){
            tab0VC.mainList.append(mData)
        }
        if (mData.soloStruct != nil){
            if let find = tab0VC.mainList.first(where: {$0.mStruct!.pid! == mData.mStruct!.pid!}){
                find.soloStruct = mData.soloStruct
            }
        }
        if (mData.groupStruct != nil){
            if let find = tab0VC.mainList.first(where: {$0.mStruct!.pid == mData.mStruct!.pid!}){
                find.groupStruct = mData.groupStruct
                find.memberStruct = mData.memberStruct
            }
        }
        tab0VC.contentView.collectionView.reloadData()
    }
    
    
    func addMyGroupList(groupData: MyinfoStruct) {
//        if menuVC == nil{
//            return
//        }
//        if menuVC.contentView == nil {
//            return
//        }
//        print("adddddddd")
//        menuVC.addGroupList(groupList: groupData)
        
    }
    func addMyGroupData(groupData: GroupStruct, userData: [UserStruct]) {
//        if menuVC == nil{
//            return
//        }
//        if menuVC.contentView == nil {
//            return
//        }
//        print("adddddddd")
//        menuVC.addGroupData(groupData: groupData, userStruct: userData)
    }
    func createMainList(listData: MStruct, userData: UserStruct) {
        tab0VC.mlistArray.append(listData)
        tab0VC.userArray.append(userData)
//        tab0VC.downloadSoloImages(pid: listData.pid!,im:userData.im!)
        tab0VC.contentView.collectionView.reloadData()
    }
    func transferCashItem(cashItem: CashItemStruct) {
        menuVC.cashItem = cashItem
        tab0VC.userCash = cashItem
        tab0VC.service.updateMyCashItem(cashItem: cashItem)
    }
    func transfetUserInfo(userInfo: UserStruct) {
        tab0VC.myData = userInfo
        tab0VC.service.updateMyUserData(userData: userInfo)
        
        menuVC.setMyData(userInfo: userInfo)
        
        soloFeedVC.currentUser = userInfo
        soloFeedVC.contentView.notiCollectionView.reloadData()
        
        if userInfo.ind1 == 801 {
            tab0VC.contentView.showBlockView()
        }
        if userInfo.ind1 == 901 {
            tab0VC.contentView.showSuspendingView()
        }
        
    }
    func addSoloMatchUser(userData: SoloStruct) {
        if soloChatVC == nil {
            return
        }
        soloChatVC.setData(user: userData)
    }
    func removeSoloMatchUser(userIdentifier: String) {
        if soloChatVC == nil {
            return
        }
    }
    
}

extension RootVC: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentingTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissingTransition
    }
}
extension RootVC:SoloNotiDelegate{
    func openPartnerDeatil(pData: MainListStruct) {
        presentUserVC(userData: pData)
    }
}
extension RootVC:GroupNotiDelegate{
    func openGroupProfile(gData: SideGroupStruct, myGid: String) {
        guard let groupData = gData.group else { return }
        if groupData.num == 2{
            self.feedGroup2ProfileVC = FeedGroup2ProfileVC()
            self.view.addSubview(self.feedGroup2ProfileVC.view)
            self.feedGroup2ProfileVC.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            self.feedGroup2ProfileVC.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            self.feedGroup2ProfileVC.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            self.feedGroup2ProfileVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            
            
            self.feedGroup2ProfileVC.setData(data: gData)
            self.feedGroup2ProfileVC.contentView.closeBtn.addTarget(self, action: #selector(closeGroup2FeedBtnFunc(_:)), for: .touchUpInside)
            
        }
        else if groupData.num == 3{
            self.feedGroup3ProfileVC = FeedGroup3ProfileVC()
            self.view.addSubview(self.feedGroup3ProfileVC.view)
            self.feedGroup3ProfileVC.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            self.feedGroup3ProfileVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            self.feedGroup3ProfileVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            self.feedGroup3ProfileVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            
            self.feedGroup3ProfileVC.setData(data: gData)
            self.feedGroup3ProfileVC.contentView.closeBtn.addTarget(self, action: #selector(closeGroup3FeedBtnFunc(_:)), for: .touchUpInside)
        }
        else{
            self.feedGroup4ProfileVC = FeedGroup4ProfileVC()
            self.view.addSubview(self.feedGroup4ProfileVC.view)
            self.feedGroup4ProfileVC.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            self.feedGroup4ProfileVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            self.feedGroup4ProfileVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            self.feedGroup4ProfileVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            
            self.feedGroup4ProfileVC.setData(data: gData)
            self.feedGroup4ProfileVC.contentView.closeBtn.addTarget(self, action: #selector(closeGroup4FeedBtnFunc(_:)), for: .touchUpInside)
        }
    }
    
    
    func openWaitGroupProfile(gData: SideGroupStruct, myGid: String) {
        guard let groupData = gData.group else { return }
        guard let groupSize = groupData.num else { return }
        if groupSize == 2{
            self.waitGroup2ProfileVC = WaitGroup2ProfileVC()
            self.view.addSubview(self.waitGroup2ProfileVC.view)
            self.waitGroup2ProfileVC.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            self.waitGroup2ProfileVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            self.waitGroup2ProfileVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            self.waitGroup2ProfileVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            
            self.waitGroup2ProfileVC.setData(data: gData)
            self.waitGroup2ProfileVC.contentView.closeBtn.addTarget(self, action: #selector(closeGroup2WaitBtnFunc(_:)), for: .touchUpInside)
        }
        else if groupSize == 3{
            self.waitGroup3ProfileVC = WaitGroup3ProfileVC()
            self.view.addSubview(self.waitGroup3ProfileVC.view)
            self.waitGroup3ProfileVC.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            self.waitGroup3ProfileVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            self.waitGroup3ProfileVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            self.waitGroup3ProfileVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            
            self.waitGroup3ProfileVC.setData(data: gData)
            self.waitGroup3ProfileVC.contentView.closeBtn.addTarget(self, action: #selector(closeGroup3WaitBtnFunc(_:)), for: .touchUpInside)
        }
        else{
            self.waitGroup4ProfileVC = WaitGroup4ProfileVC()
            self.view.addSubview(waitGroup4ProfileVC.view)
            waitGroup4ProfileVC.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            waitGroup4ProfileVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            waitGroup4ProfileVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            waitGroup4ProfileVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            
            self.waitGroup4ProfileVC.setData(data: gData)
            self.waitGroup4ProfileVC.contentView.closeBtn.addTarget(self, action: #selector(closeGroup4WaitBtnFunc(_:)), for: .touchUpInside)
        }
    }
    private func closeGroup2Feed(){
        feedGroup2ProfileVC.contentView.closeAnimation(){
            self.feedGroup2ProfileVC.dismiss(animated: false, completion: {
                self.feedGroup2ProfileVC.removeFromParent()
                self.feedGroup2ProfileVC.view.removeFromSuperview()
                self.feedGroup2ProfileVC = nil
            })
        }
    }
    private func closeGroup3Feed(){
        feedGroup3ProfileVC.contentView.closeAnimation(){
            self.feedGroup3ProfileVC.dismiss(animated: false, completion: {
                self.feedGroup3ProfileVC.removeFromParent()
                self.feedGroup3ProfileVC.view.removeFromSuperview()
                self.feedGroup3ProfileVC = nil
            })
        }
    }
    private func closeGroup4Feed(){
        feedGroup4ProfileVC.contentView.closeAnimation(){
            self.feedGroup4ProfileVC.dismiss(animated: false, completion: {
                self.feedGroup4ProfileVC.removeFromParent()
                self.feedGroup4ProfileVC.view.removeFromSuperview()
                self.feedGroup4ProfileVC = nil
            })
        }
    }
    private func closeGroup2Wait(){
        waitGroup2ProfileVC.contentView.closeAnimation(){
            self.waitGroup2ProfileVC.dismiss(animated: false, completion: {
                self.waitGroup2ProfileVC.removeFromParent()
                self.waitGroup2ProfileVC.view.removeFromSuperview()
                self.waitGroup2ProfileVC = nil
            })
        }
        
    }
    private func closeGroup3Wait(){
        waitGroup3ProfileVC.contentView.closeAnimation(){
            self.waitGroup3ProfileVC.dismiss(animated: false, completion: {
                self.waitGroup3ProfileVC.removeFromParent()
                self.waitGroup3ProfileVC.view.removeFromSuperview()
                self.waitGroup3ProfileVC = nil
            })
        }
    }
    private func closeGroup4Wait(){
        waitGroup4ProfileVC.contentView.closeAnimation(){
            self.waitGroup4ProfileVC.dismiss(animated: false, completion: {
                self.waitGroup4ProfileVC.removeFromParent()
                self.waitGroup4ProfileVC.view.removeFromSuperview()
                self.waitGroup4ProfileVC = nil
            })
        }
    }
    @objc func closeGroup2FeedBtnFunc(_ sender:UIButton){
        closeGroup2Feed()
    }
    @objc func closeGroup3FeedBtnFunc(_ sender:UIButton){
        closeGroup3Feed()
    }
    @objc func closeGroup4FeedBtnFunc(_ sender:UIButton){
        closeGroup4Feed()
    }
    @objc func closeGroup2WaitBtnFunc(_ sender:UIButton){
        closeGroup2Wait()
    }
    @objc func closeGroup3WaitBtnFunc(_ sender:UIButton){
        closeGroup3Wait()
    }
    @objc func closeGroup4WaitBtnFunc(_ sender:UIButton){
        closeGroup4Wait()
    }
    
    
}
extension RootVC:SoloChatDelegate{
    func openUserProfile(mData: MainListStruct) {
        
    }
    
    func chatWithUser(data: UserStruct) {
        
        self.soloChatContentVC = SoloChatContentVC()
        soloChatContentVC.chatUser = data
        soloChatContentVC.delegate = self
        soloChatContentVC.myName = mainService.userInfo.na!
        contentView.chatView.addSubview(soloChatContentVC.view)
        soloChatContentVC.view.topAnchor.constraint(equalTo: contentView.chatView.topAnchor).isActive = true
        soloChatContentVC.view.leftAnchor.constraint(equalTo: contentView.chatView.leftAnchor).isActive = true
        soloChatContentVC.view.rightAnchor.constraint(equalTo: contentView.chatView.rightAnchor).isActive = true
        soloChatContentVC.view.bottomAnchor.constraint(equalTo: contentView.chatView.bottomAnchor).isActive = true
        
        soloChatContentVC.contentView.backBtn.addTarget(self, action: #selector(hideChatView(_:)), for: .touchUpInside)
        
    }
    @objc func hideChatView(_ sender:UIButton){
        contentView.hideChatView {
            self.soloChatContentVC.dismiss(animated: false, completion: {
                self.soloChatContentVC.removeFromParent()
                self.soloChatContentVC.view.removeFromSuperview()
                self.soloChatContentVC = nil
            })
        }
    }
}
extension RootVC:GroupChatDelegate{
    func chatWithGroup(data: SideGroupStruct, groupSize: Int,myGroup:MyGroupListStruct) {
        if groupSize == 2{
            self.group2ChatContentVC = Group2ChatContentVC()
            group2ChatContentVC.partnerGroup = data
            group2ChatContentVC.myGroup = myGroup
            self.group2ChatContentVC.delegate = self
            contentView.chatView.addSubview(group2ChatContentVC.view)
            group2ChatContentVC.view.topAnchor.constraint(equalTo: contentView.chatView.topAnchor).isActive = true
            group2ChatContentVC.view.leftAnchor.constraint(equalTo: contentView.chatView.leftAnchor).isActive = true
            group2ChatContentVC.view.rightAnchor.constraint(equalTo: contentView.chatView.rightAnchor).isActive = true
            group2ChatContentVC.view.bottomAnchor.constraint(equalTo: contentView.chatView.bottomAnchor).isActive = true
            
            group2ChatContentVC.setData(data: data, myGroup: myGroup)
            group2ChatContentVC.contentView.backBtn.addTarget(self, action: #selector(hideGroup2ChatView), for: .touchUpInside)
            
        }
        else if groupSize == 3{
            self.group3ChatContentVC = Group3ChatContentVC()
            group3ChatContentVC.partnerGroup = data
            group3ChatContentVC.myGroup = myGroup
            self.group3ChatContentVC.delegate = self
            contentView.chatView.addSubview(group3ChatContentVC.view)
            group3ChatContentVC.view.topAnchor.constraint(equalTo: contentView.chatView.topAnchor).isActive = true
            group3ChatContentVC.view.leftAnchor.constraint(equalTo: contentView.chatView.leftAnchor).isActive = true
            group3ChatContentVC.view.rightAnchor.constraint(equalTo: contentView.chatView.rightAnchor).isActive = true
            group3ChatContentVC.view.bottomAnchor.constraint(equalTo: contentView.chatView.bottomAnchor).isActive = true
            
            group3ChatContentVC.setData(data: data, myGroup: myGroup)
            
            group3ChatContentVC.contentView.backBtn.addTarget(self, action: #selector(hideGroup3ChatView(_:)), for: .touchUpInside)
        }
        else{
            self.group4ChatContentVC = Group4ChatContentVC()
            group4ChatContentVC.partnerGroup = data
            group4ChatContentVC.myGroup = myGroup
            self.group4ChatContentVC.delegate = self
            contentView.chatView.addSubview(group4ChatContentVC.view)
            group4ChatContentVC.view.topAnchor.constraint(equalTo: contentView.chatView.topAnchor).isActive = true
            group4ChatContentVC.view.leftAnchor.constraint(equalTo: contentView.chatView.leftAnchor).isActive = true
            group4ChatContentVC.view.rightAnchor.constraint(equalTo: contentView.chatView.rightAnchor).isActive = true
            group4ChatContentVC.view.bottomAnchor.constraint(equalTo: contentView.chatView.bottomAnchor).isActive = true
            
            group4ChatContentVC.setData(data: data, myGroup: myGroup)
            
            group4ChatContentVC.contentView.backBtn.addTarget(self, action: #selector(hideGroup4ChatView(_:)), for: .touchUpInside)
        }
    }
    @objc func hideGroup2ChatView(_ sender:UIButton){
        contentView.hideChatView {
            self.group2ChatContentVC.dismiss(animated: false, completion: {
                self.group2ChatContentVC.removeFromParent()
                self.group2ChatContentVC.view.removeFromSuperview()
                self.group2ChatContentVC = nil
            })
        }
    }
    @objc func hideGroup3ChatView(_ sender:UIButton){
        contentView.hideChatView {
            self.group3ChatContentVC.dismiss(animated: false, completion: {
                self.group3ChatContentVC.removeFromParent()
                self.group3ChatContentVC.view.removeFromSuperview()
                self.group3ChatContentVC = nil
            })
        }
    }
    @objc func hideGroup4ChatView(_ sender:UIButton){
        contentView.hideChatView {
            self.group4ChatContentVC.dismiss(animated: false, completion: {
                self.group4ChatContentVC.removeFromParent()
                self.group4ChatContentVC.view.removeFromSuperview()
                self.group4ChatContentVC = nil
            })
        }
    }
}
extension RootVC:SoloChatContentDelegate{
    func appearAnimation() {
        contentView.showChatView()
    }
    func disappearAnimation() {
        
    }
    func showProfile(userData: UserStruct) {
        matchUserProfileVC = MatchUserProfileVC()
        matchUserProfileVC.soloData = userData
        self.view.addSubview(matchUserProfileVC.view)
        matchUserProfileVC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        matchUserProfileVC.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        matchUserProfileVC.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        matchUserProfileVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        matchUserProfileVC.contentView.closeBtn.addTarget(self, action: #selector(closeBtnFunc(_:)), for: .touchUpInside)
    }
    @objc func closeBtnFunc(_ sender:UIButton){
        matchUserProfileVC.contentView.closeAnimation {
            self.matchUserProfileVC.dismiss(animated: false, completion: {
                self.matchUserProfileVC.removeFromParent()
                self.matchUserProfileVC.view.removeFromSuperview()
                self.matchUserProfileVC = nil
            })
        }
    }
}
extension RootVC:GroupChatContentDelegate{
    func showGroupChat() {
        contentView.showChatView()
    }
    func showProfile(groupData:SideGroupStruct,groupSize:Int){
        if groupSize == 2{
            matchGroup2ProfileVC = MatchGroup2ProfileVC()
            matchGroup2ProfileVC.groupData = groupData
            self.view.addSubview(matchGroup2ProfileVC.view)
            self.matchGroup2ProfileVC.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            self.matchGroup2ProfileVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            self.matchGroup2ProfileVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            self.matchGroup2ProfileVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            
            self.matchGroup2ProfileVC.setData(data: groupData)
            self.matchGroup2ProfileVC.contentView.closeBtn.addTarget(self, action: #selector(closeMatchGroup2ProfileFunc(_:)), for: .touchUpInside)
            
        }
        else if groupSize == 3{
            matchGroup3ProfileVC = MatchGroup3ProfileVC()
            matchGroup3ProfileVC.groupData = groupData
            self.view.addSubview(matchGroup3ProfileVC.view)
            self.matchGroup3ProfileVC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            self.matchGroup3ProfileVC.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            self.matchGroup3ProfileVC.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            self.matchGroup3ProfileVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
            self.matchGroup3ProfileVC.setData(data: groupData)
            self.matchGroup3ProfileVC.contentView.closeBtn.addTarget(self, action: #selector(closeMatchGroup3ProfileFunc(_:)), for: .touchUpInside)
        }
        else{
            matchGroup4ProfileVC = MatchGroup4ProfileVC()
            matchGroup4ProfileVC.groupData = groupData
            self.view.addSubview(matchGroup4ProfileVC.view)
            matchGroup4ProfileVC.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            matchGroup4ProfileVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            matchGroup4ProfileVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            matchGroup4ProfileVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            
            self.matchGroup4ProfileVC.setData(data: groupData)
            self.matchGroup4ProfileVC.contentView.closeBtn.addTarget(self, action: #selector(closeMatchGroup4ProfileFunc(_:)), for: .touchUpInside)
        }
    }
    @objc private func closeMatchGroup2ProfileFunc(_ sender:UIButton){
        self.matchGroup2ProfileVC.contentView.closeAnimation(){
            self.matchGroup2ProfileVC.dismiss(animated: false, completion: {
                self.matchGroup2ProfileVC.removeFromParent()
                self.matchGroup2ProfileVC.view.removeFromSuperview()
                self.matchGroup2ProfileVC = nil
            })
        }
    }
    @objc private func closeMatchGroup3ProfileFunc(_ sender:UIButton){
        self.matchGroup3ProfileVC.contentView.closeAnimation(){
            self.matchGroup3ProfileVC.dismiss(animated: false, completion: {
                self.matchGroup3ProfileVC.removeFromParent()
                self.matchGroup3ProfileVC.view.removeFromSuperview()
                self.matchGroup3ProfileVC = nil
            })
        }
    }
    @objc private func closeMatchGroup4ProfileFunc(_ sender:UIButton){
        self.matchGroup4ProfileVC.contentView.closeAnimation(){
            self.matchGroup4ProfileVC.dismiss(animated: false, completion: {
                self.matchGroup4ProfileVC.removeFromParent()
                self.matchGroup4ProfileVC.view.removeFromSuperview()
                self.matchGroup4ProfileVC = nil
            })
        }
    }
}

extension RootVC:Tab0Delegate{
    
    func reloadMainList() {
        tab0VC.mainList.removeAll()
        tab0VC.contentView.collectionView.alpha = 0
        tab0VC.contentView.btnView.alpha = 0
        mainService.ReloadMainListener()
    }
    func showTopView(show: Bool) {
        if show{
            contentView.topView.alpha = 1
            contentView.panGesture.isEnabled = true
        }else{
            contentView.topView.alpha = 0
            contentView.panGesture.isEnabled = false
        }
    }
    func showAlertView(type:String,userData:MainListStruct){
        if type == "AlreadyActionView"{
            alreadyActionVC = AlreadyActionVC()
            
            self.view.addSubview(alreadyActionVC.view)
            alreadyActionVC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            alreadyActionVC.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            alreadyActionVC.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            alreadyActionVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
            alreadyActionVC.contentView.completeBtn.addTarget(self, action: #selector(alreadyCloseBtnFunc(_:)), for: .touchUpInside)
        }
        else if type == "EmptyLikeView"{
            noLikeVC = EmptyLikeAlertVC()
            self.view.addSubview(noLikeVC.view)
            noLikeVC.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            noLikeVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            noLikeVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            noLikeVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            
            noLikeVC.contentView.closeBtn.addTarget(self, action: #selector(emptyLikeCloseBtnFunc(_:)), for: .touchUpInside)
            
        }
        else if type == "EmptyDeliView"{
            noDeliVC = EmptyDeliAlertVC()
            self.view.addSubview(noDeliVC.view)
            noDeliVC.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            noDeliVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            noDeliVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            noDeliVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            
            noDeliVC.contentView.closeBtn.addTarget(self, action: #selector(emptyDeliCloseBtnFunc(_:)), for: .touchUpInside)
        }
        else if type == "ErrorView"{
            errorVC = ErrorAlertVC()
            self.view.addSubview(errorVC.view)
            errorVC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            errorVC.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            errorVC.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            errorVC.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            
            errorVC.contentView.completeBtn.addTarget(self, action: #selector(errorCloseBtnFunc(_:)), for: .touchUpInside)
        }
        else if type == "SoloMatchView"{
            soloMatchVC = SoloMatchViewController()
            soloMatchVC.userData = userData
            self.view.addSubview(soloMatchVC.view)
            soloMatchVC.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            soloMatchVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            soloMatchVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            soloMatchVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            
            soloMatchVC.contentView.closeBtn.addTarget(self, action: #selector(soloMatchCloseBtnFunc(_:)), for: .touchUpInside)
        }else if type == "PlusUserView"{
            plusUserVC = StopLeftPagingAlertVC()
            self.view.addSubview(plusUserVC.view)
            plusUserVC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            plusUserVC.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            plusUserVC.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            plusUserVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
            plusUserVC.contentView.closeBtn.addTarget(self, action: #selector(plusCloseBtnFunc(_:)), for: .touchUpInside)
        }
    }
    func continueSoloMatch() {
        if soloMatchVC == nil {
            return;
        }
        soloMatchVC.contentView.matchAnimation()
    }
    func removeSoloMatchView(){
        if soloMatchVC == nil{
            return;
        }
        soloMatchVC.contentView.closeAnimation {
            self.soloMatchVC.dismiss(animated: false, completion: {
                self.soloMatchVC.removeFromParent()
                self.soloMatchVC.view.removeFromSuperview()
                self.soloMatchVC = nil
            })
        }
    }
    func checkGroup(groupSize: Int,isLike:Bool) {
        
        let myGroupList = mainService.activeGroupList.filter({$0.groupInfo?.num! == groupSize})
        if myGroupList.count == 0{
            noGroupVC = NoGroupListVC()
            self.view.addSubview(noGroupVC.view)
            noGroupVC.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            noGroupVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            noGroupVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            noGroupVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            
            noGroupVC.contentView.closeBtn.addTarget(self, action: #selector(noGroupCloseBtnFunc(_:)), for: .touchUpInside)
        }
        else if myGroupList.count == 1{
            if isLike{
                tab0VC.GroupLike(myGroup:myGroupList[0])
            }else{
                tab0VC.GroupDeli(myGroup:myGroupList[0])
            }
        }
        else{
            chooseMyGroupVC = ChooseMyGroupVC()
            chooseMyGroupVC.selectedGroup = myGroupList[0]
            chooseMyGroupVC.isLike = isLike
            self.view.addSubview(chooseMyGroupVC.view)
            chooseMyGroupVC.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            chooseMyGroupVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            chooseMyGroupVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            chooseMyGroupVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            
            chooseMyGroupVC.contentView.closeBtn.addTarget(self, action: #selector(chooseGroupCloseBtnFunc(_:)), for: .touchUpInside)
            
            chooseMyGroupVC.contentView.sendBtn.addTarget(self, action: #selector(chooseGroupSendBtnFunc(_:)), for: .touchUpInside)
        }
    }
    @objc func alreadyCloseBtnFunc(_ sender:UIButton){
        alreadyActionVC.contentView.closeAnimation(){
            self.alreadyActionVC.dismiss(animated: false, completion: {
                self.alreadyActionVC.removeFromParent()
                self.alreadyActionVC.view.removeFromSuperview()
                self.alreadyActionVC = nil
            })
        }
    }
    @objc func emptyLikeCloseBtnFunc(_ sender:UIButton){
        noLikeVC.contentView.closeAnimation {
            self.noLikeVC.dismiss(animated: false, completion: {
                self.noLikeVC.removeFromParent()
                self.noLikeVC.view.removeFromSuperview()
                self.noLikeVC = nil
            })
        }
    }
    @objc func emptyDeliCloseBtnFunc(_ sender:UIButton){
        noDeliVC.contentView.closeAnimation {
            self.noDeliVC.dismiss(animated: false, completion: {
                self.noDeliVC.removeFromParent()
                self.noDeliVC.view.removeFromSuperview()
                self.noDeliVC = nil
            })
        }
    }
    @objc func errorCloseBtnFunc(_ sender:UIButton){
        errorVC.contentView.closeAnimation(){
            self.errorVC.dismiss(animated: false, completion: {
                self.errorVC.removeFromParent()
                self.errorVC.view.removeFromSuperview()
                self.errorVC = nil
            })
        }
    }
    @objc func plusCloseBtnFunc(_ sender:UIButton){
        plusUserVC.contentView.closeAnimation {
            self.plusUserVC.dismiss(animated: false, completion: {
                self.plusUserVC.removeFromParent()
                self.plusUserVC.view.removeFromSuperview()
                self.plusUserVC = nil
            })
        }
    }
    @objc func soloMatchCloseBtnFunc(_ sender:UIButton){
        removeSoloMatchView()
    }
    @objc func noGroupCloseBtnFunc(_ sender:UIButton){
        noGroupVC.contentView.closeAnimation {
            self.noGroupVC.dismiss(animated: false, completion: {
                self.noGroupVC.removeFromParent()
                self.noGroupVC.view.removeFromSuperview()
                self.noGroupVC = nil
            })
        }
    }
    func removeChooseGroupVC(){
        chooseMyGroupVC.contentView.closeAnimation {
            self.chooseMyGroupVC.dismiss(animated: false, completion: {
                self.chooseMyGroupVC.removeFromParent()
                self.chooseMyGroupVC.view.removeFromSuperview()
                self.chooseMyGroupVC = nil
            })
        }
    }
    @objc func chooseGroupCloseBtnFunc(_ sender:UIButton){
        removeChooseGroupVC()
    }
    @objc func chooseGroupSendBtnFunc(_ sender:UIButton){
        if chooseMyGroupVC == nil{ return }
        guard let selectedGroup = chooseMyGroupVC.selectedGroup else { return }
        guard let isLike = chooseMyGroupVC.isLike else { return }
        if isLike{
            self.tab0VC.GroupLike(myGroup: selectedGroup)
        }else{
            self.tab0VC.GroupDeli(myGroup: selectedGroup)
        }
    }
}
extension RootVC:MenuDelegate{
    func showMyProfile() {
        guard let userData = mainService.userInfo else { return }
        myProfileVC = SoloProfileVC()
        myProfileVC.userInfo = userData
        
        self.view.addSubview(myProfileVC.view)
        myProfileVC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myProfileVC.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        myProfileVC.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        myProfileVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        myProfileVC.contentView.editBtn.addTarget(self, action: #selector(showEditProfile(_:)), for: .touchUpInside)
    }
    
    @objc func showEditProfile(_ sender:UIButton){
        myProfileVC.contentView.closeAnimation {
            self.myProfileVC.dismiss(animated: false, completion: {
                self.myProfileVC.removeFromParent()
                self.myProfileVC.view.removeFromSuperview()
                self.myProfileVC = nil
                let controller = ShowProfileEdit(viewController: self, userData: self.mainService.userInfo)
                controller.ShowIndicator()
            })
        }
    }
    func showCreateGroup() {
        let vc = CreateGroupVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: {})
    }
}
extension RootVC:RootViewProtocol{
    func dismissChatVC() {
        if soloChatContentVC != nil{
            self.soloChatContentVC.dismiss(animated: false, completion: {
                self.soloChatContentVC.removeFromParent()
                self.soloChatContentVC.view.removeFromSuperview()
                self.soloChatContentVC = nil
            })
        }
        if group2ChatContentVC != nil{
            self.group2ChatContentVC.dismiss(animated: false, completion: {
                self.group2ChatContentVC.removeFromParent()
                self.group2ChatContentVC.view.removeFromSuperview()
                self.group2ChatContentVC = nil
            })
        }
        if group3ChatContentVC != nil{
            self.group3ChatContentVC.dismiss(animated: false, completion: {
                self.group3ChatContentVC.removeFromParent()
                self.group3ChatContentVC.view.removeFromSuperview()
                self.group3ChatContentVC = nil
            })
        }
        if group4ChatContentVC != nil{
            self.group4ChatContentVC.dismiss(animated: false, completion: {
                self.group4ChatContentVC.removeFromParent()
                self.group4ChatContentVC.view.removeFromSuperview()
                self.group4ChatContentVC = nil
            })
        }
    }
}
