//
//  MainService.swift
//  Delius
//
//  Created by 박진호 on 2020/06/24.
//  Copyright © 2020 정윤환. All rights reserved.
//

import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseFunctions
class MainService:FirestoreService{
    
    var delegate : MainServiceDelegate?
    
    var tokenSetting:Bool = false
    
    var initialTime:Int64!
    
    
    var vc:RootVC!
    
    var pushViewFrame:CGRect!
    
    var myMatchArray=[String]()
    
    init(viewController:RootVC,pushFrame:CGRect) {
        super.init()
        
        vc = viewController
        
        
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = false
        Firestore.firestore().settings = settings
        
        db = Firestore.firestore()
        print("TRUETRUE",db.settings.isPersistenceEnabled)
        
        functions = Functions.functions()
        
        
        myGroupList = [MyinfoStruct]()
        groupDataArray = [GroupStruct]()
        userDataArray = [UserStruct]()
        
        initialTime = Int64(Date().timeIntervalSince1970)
        
        
        
        self.pushViewFrame = pushFrame
        
        if let fcmToken = UserDefaults.standard.string(forKey: "fcmToken"){
            self.tk = fcmToken
        }
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        
        myinfoListener = db.collection("user1").document(currentUid).collection("user2").document(currentUid).addSnapshotListener{ snapShot, err in
            
            
            guard let snap = snapShot, snap.exists else { return }
            
            
            let id = ["uid":snap.documentID] as [String:Any]
            var im = [imgStruct]()
            if let snapIm = snap.data()!["im"] as? [[String:Any]]{
                for i in snapIm{
                    let imgObj = imgStruct(dictionary: i)
                    im.append(imgObj)
                }
            }
            self.userInfo = UserStruct(dictionary: id.merging(snap.data()!){ (_,f) -> Any in f })
            self.userInfo.im = im
            self.delegate?.transfetUserInfo(userInfo: self.userInfo)
            guard let userIndex = self.userInfo.ind1 else { return }
            if userIndex == 100{
                self.delegate?.ControlUserStateView(type: userIndex)
            }
            else if userIndex == 201 || userIndex == 202 || userIndex == 203{
                self.delegate?.ControlUserStateView(type: userIndex)
            }
            else if userIndex == 301{
                self.secondViewOpenStep(currentUid: currentUid)
            }
            else if userIndex == 801{
                self.delegate?.ControlUserStateView(type: userIndex)
            }
            else if userIndex == 801{
                self.delegate?.ControlUserStateView(type: userIndex)
            }
            if let sx = self.userInfo?.sx{
//                self.cashLogService = RenewalCashItem(cashItem: self.cashItem!, db: self.db, sx: sx)
            }
            if let fcmTokenInDB = self.userInfo.tk{
                if fcmTokenInDB != self.tk{
                    self.updateToken()
                }
            }
        }
        
        setSoloLikeListener()
        setSoloDeliListener()
        setSoloMatchListener()
        
        
    }
    func secondViewOpenStep(currentUid:String){
        
        
        myGroupListener = db.collection("myinfo").document(currentUid).collection("milist").addSnapshotListener{ querySnapshot, err in
            guard let snapshot = querySnapshot else {
                return
            }
            snapshot.documentChanges.forEach{ diff in
                let data = MyinfoStruct(dictionary: diff.document.data())
                if (diff.type == .added){
                    self.addMyGroup(mData: data)
                }
                if (diff.type == .modified){
                    self.modifyMyGroup(mData: data)
                }
            }
        }
        cashItemListener = db.collection("cash").document(currentUid).collection("chlist").document("uch").addSnapshotListener{ snapShot, err in
            guard let snap = snapShot, snap.exists else { return }
            let cashData = CashItemStruct(dictionary: snap.data()!)
            self.cashItem = cashData
            self.delegate?.transferCashItem(cashItem: cashData)
        }

        self.setMainListener()
        
        self.delegate?.ControlUserStateView(type: 301)
        
    }
    private func shotUserLog(completion:@escaping(String)->Void){
//        let requestData:[String:Any] = ["gpx":!userInfo.sx!,"msx":userInfo.sx!,"psx":!userInfo.sx!]
        let requestData:[String:Any] = ["gpx":false,"msx":true,"psx":false]
        functions.httpsCallable("ShotUserLog").call(requestData){(result,err)in
            if err != nil{
                completion("internalError")
                return
            }
            guard let resultObj = (result?.data as? [String:Any]) else { return }
            if let type = resultObj["type"] as? String{
                switch type{
                case "noLogItem":
                    completion("noLogItem")
                case "success":
                    completion("success")
                case "noData":
                    completion("noData")
                case "error":
                    completion("error")
                default:()
                }
            }
        }
    }
    func ReloadMainListener(){
        self.isOncall = true
        mainList.removeAll()
        if mainListListener != nil{
            mainListListener.remove()
            mainListListener = nil
        }
        setMainListener()
    }
    
    
    var isOncall:Bool = true
    func setMainListener(){
        self.delegate?.ControlMainDelegate(resultStr: "Remove", im: [])
        self.mainList.removeAll()
//        self.delegate?.ControlMainDelegate(resultStr: "", im: [imgStruct]())
//        return

        print("CRITICAL POINT0")
        print("CRITICAL POINT",mainList.count)
        
        guard let currentUser = Auth.auth().currentUser else { return }
        let currentUid = currentUser.uid
        mainListListener = db.collection("mlist").document(currentUid).collection("mmlist").whereField("in1",isEqualTo: 100).order(by: "cdit").addSnapshotListener{ querySnapshot, err in
            guard let snapshot = querySnapshot else{ return }
            print("querySnahpshot",snapshot.count,snapshot.metadata.isFromCache,snapshot.metadata.hasPendingWrites)
            print("querySnahpshot",snapshot)
            
            
            

//            return
            
            
            if self.isOncall && !snapshot.metadata.isFromCache{
                print("CRITICAL POINT1")
                if querySnapshot!.count < 10{
                    print("CRITICAL POINT2")
                    if self.mainListListener != nil{
                        self.mainListListener.remove()
                        self.mainListListener = nil
                    }
                    self.delegate?.ControlMainDelegate(resultStr: "onCallFunction", im: self.userInfo.im!)
                    self.shotUserLog { (output) in
                        self.delegate?.ControlMainDelegate(resultStr: output,im:self.userInfo.im!)
                    }
                    return
                }else{
                    print("CRITICAL POINT3")
                    self.delegate?.ControlMainDelegate(resultStr: "continue",im:self.userInfo.im!)
                }
                self.isOncall = false
            }
            print("CRITICAL POINT4")
            var i = 0
            snapshot.documentChanges.forEach{diff in
                let data = MStruct(dictionary: diff.document.data())
                if (diff.type == .added){
                    
                    
                    
                    
                    if i > 10{ return }
                    else{ i += 1 }
                    
//                    if (self.mainList.contains(where: {$0.mStruct?.pid == data.pid})){return}
                    
                    if data.type == 101{
                        self.loadSoloProflie(mData: data)
                    }else{
                        self.loadGroupProfile(mData: data)
                    }
                }
                if (diff.type == .modified){
                    self.updateMainList(mData: data)
                }
                if (diff.type == .removed){
                    diff.document.reference.getDocument(completion: {(snap,error) in
                        guard let removedSnapshot = snap, removedSnapshot.exists else { return }
                        if error == nil{
                            let removedData = MStruct(dictionary: removedSnapshot.data()!)
                            self.removeMainList(mData: removedData)
                        }
                    })
                }
            }
        }
    }
    
    func setSoloLikeListener(){
        guard let currentUser = Auth.auth().currentUser else { return }
        let currentUid = currentUser.uid
        soloLikeListener = db.collection("mlist").document(currentUid).collection("mmlist").whereField("in2", isEqualTo: 300).addSnapshotListener{ querySnapshot, err in
            guard let snapshot = querySnapshot else { return }
            snapshot.documentChanges.forEach{diff in
                let data = MStruct(dictionary: diff.document.data())
                if (diff.type == .added){
                    self.SoloFeedAdd(mData: data)
                }
                if (diff.type == .modified){
                    if data.in2! != 300{
                        self.SoloFeedRemove(mData: data)
                    }
                }
                if (diff.type ==  .removed){
                    self.SoloFeedRemove(mData: data)
                }
            }
        }
    }
    func setSoloDeliListener(){
        guard let currentUser = Auth.auth().currentUser else { return }
        let currentUid = currentUser.uid
        soloDeliListener = db.collection("mlist").document(currentUid).collection("mmlist").whereField("in2", isEqualTo: 400).addSnapshotListener{ querySnapshot, err in
            guard let snapshot = querySnapshot else { return }
            snapshot.documentChanges.forEach{diff in
                let data = MStruct(dictionary: diff.document.data())
                if (diff.type == .added){
                    self.SoloFeedAdd(mData: data)
                }
                if (diff.type == .modified){
                    if data.in2! != 400{
                        self.SoloFeedRemove(mData: data)
                    }
                }
                if (diff.type ==  .removed){
                    self.SoloFeedRemove(mData: data)
                }
            }
        }
    }
    func setSoloMatchListener(){
        guard let currentUser = Auth.auth().currentUser else { return }
        let currentUid = currentUser.uid
        soloMatchListener = db.collection("mlist").document(currentUid).collection("mmlist").whereField("in2", isEqualTo: 500).addSnapshotListener{ querySnapshot, err in
            guard let snapshot = querySnapshot else { return }
            snapshot.documentChanges.forEach{diff in
                let data = MStruct(dictionary: diff.document.data())
                if (diff.type == .added){
                    if data.tp!.seconds > self.initialTime!{
                        self.vc.showPushView(inputView: PushMatchSoloView(frame: self.pushViewFrame))
                    }
                    print("mData!",data)
                    self.SoloMatchAdd(mData: data)
                }
                if (diff.type == .modified){
                    if data.in1! > 500{
                        self.SoloMatchRemove(mData: data)
                    }
                }
                if (diff.type == .removed){
                    if data.in2! > 500 {
                        self.SoloMatchRemove(mData: data)
                    }
                }
            }
        }
    }
    
    
    func setGroupListener(gid:String){
        let LikeListener = db.collection("gl").document(gid).collection("ggl").whereField("ind2", isEqualTo: 300).addSnapshotListener { (querySnapshot, err) in
            if err != nil{
                return
            }
            guard let snapshot = querySnapshot else { return }
            snapshot.documentChanges.forEach{ diff in
                let targetId : [String:Any] = ["targetid":diff.document.documentID]
                let data = GLStruct(dictionary: diff.document.data().merging(targetId){(f,_)->Any in f})
                if (diff.type == .added){
                    self.AddSideGroupFeed(gData: data)
                }
                if (diff.type == .modified){
                    
                }
                if (diff.type == .removed){
                    
                }
            }
        }
        let DeliListener = db.collection("gl").document(gid).collection("ggl").whereField("ind2", isEqualTo: 400).addSnapshotListener { (querySnapshot, err) in
            if err != nil{
                return
            }
            guard let snapshot = querySnapshot else { return }
            snapshot.documentChanges.forEach{ diff in
            let targetId : [String:Any] = ["targetid":diff.document.documentID]
            let data = GLStruct(dictionary: diff.document.data().merging(targetId){(f,_)->Any in f})
                if (diff.type == .added){
                    self.AddSideGroupFeed(gData: data)
                }
                if (diff.type == .modified){
                    
                }
                if (diff.type == .removed){
                    
                }
            }
        }
        let WaitListener = db.collection("gl").document(gid).collection("ggl").whereField("ind1", isEqualTo: 100).addSnapshotListener { (querySnapshot, err) in
            if err != nil{
                return
            }
            guard let snapshot = querySnapshot else { return }
            snapshot.documentChanges.forEach{ diff in
            let targetId : [String:Any] = ["targetid":diff.document.documentID]
            let data = GLStruct(dictionary: diff.document.data().merging(targetId){(f,_)->Any in f})
                if (diff.type == .added){
                    if data.ind2! < 200{
                        self.AddSideGroupWait(gData: data)
                    }
                }
                if (diff.type == .modified){
                }
                if (diff.type == .removed){
                    
                }
            }
        }
        let MatchListener = db.collection("gl").document(gid).collection("ggl").whereField("ind2", isEqualTo: 500).addSnapshotListener { (querySnapshot, err) in
            if err != nil{
                return
            }
            guard let snapshot = querySnapshot else { return }
            snapshot.documentChanges.forEach{ diff in
            let targetId : [String:Any] = ["targetid":diff.document.documentID]
            let data = GLStruct(dictionary: diff.document.data().merging(targetId){(f,_)->Any in f})
                if (diff.type == .added){
                    self.AddSideGroupMatch(gData: data)
                }
                if (diff.type == .modified){
                    
                }
                if (diff.type == .removed){
                    
                }
            }
        }
        self.groupListener.append([gid:[LikeListener,DeliListener,WaitListener,MatchListener]])
        self.sideGroupFeedList.append([gid:[]])
        self.sideGroupWaitList.append([gid:[]])
        self.sideGroupMatchList.append([gid:[]])
        
    }
    private func AddSideGroupFeed(gData:GLStruct){
        let async = DispatchGroup()
        var userData = [UserStruct]()
        var groupData:GroupStruct!
        let uids = gData.uids!
        let gid = gData.targetid!
        for uid in uids{
            if uid != ""{
                async.enter()
                let ref = db.collection("user1").document(uid).collection("user2").document(uid)
                ref.getDocument{ (doc,err) in
                    if let document = doc, document.exists{
                        let id = ["uid":document.documentID] as [String:Any]
                        var im = [imgStruct]()
                        if let snapIm = document.data()!["im"] as? [[String:Any]]{
                            for i in snapIm{
                                let imgObj = imgStruct(dictionary: i)
                                im.append(imgObj)
                            }
                        }
                        let data = UserStruct(dictionary: id.merging(document.data()!){ (_,f) -> Any in f})
                        data.im = im
                        self.myGroupUsers.append(data)
                        userData.append(data)
                    }
                    async.leave()
                }
            }
        }
        async.enter()
        let ref = db.collection("group").document(gid).collection("glist").document("ginfo")
        ref.getDocument{ (doc,err) in
            if let document = doc ,document.exists{
                let data = GroupStruct(dictionary: document.data()!)
                self.groupDataArray.append(data)
                groupData = data
                self.myGroupData.append(groupData)
            }
            async.leave()
        }
        async.notify(queue: .main, execute: {
            let myGroupData = SideGroupStruct(group: groupData, members: userData, GL: gData)
            self.delegate?.AddGroupFeedVote(gData: myGroupData)
            if gData.tp!.seconds > self.initialTime!{
                if !self.myMatchArray.contains(gData.targetid!){
                    if gData.ind2 == 400{
                        self.showPushGroup2Feed(groupData: groupData, userData: userData, isLike: false, isHide: false)
                    }
                    if gData.ind2 == 300{
                        if self.userInfo.ind2!{
                            self.showPushGroup2Feed(groupData: groupData, userData: userData, isLike: true, isHide: false)
                        }else{
                            self.showPushGroup2Feed(groupData: groupData, userData: userData, isLike: true, isHide: true)
                        }
                    }
                }
            }
        })
        
    }
    private func showPushGroup2Feed(groupData:GroupStruct,userData:[UserStruct],isLike:Bool,isHide:Bool){
        var url1 : URL!
        var url2 : URL!
        var groupName:String!
        if let user = userData.first(where: {$0.uid! == groupData.uid1!}){
            if let im = user.im{
                let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                url1 = url
            }
        }
        if let user = userData.first(where: {$0.uid! == groupData.uid2!}){
            if let im = user.im{
                let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                url2 = url
            }
        }
        if let gNa = groupData.na{
            groupName = gNa
        }
        if !isHide && !isLike{
            let pushView = PushFeedGroup2DeliView(frame: pushViewFrame)
            pushView.imgView1.sd_setImage(with: url1)
            pushView.imgView2.sd_setImage(with: url2)
            vc.showPushView(inputView: pushView)
            return
        }
        if isHide{
            let pushView = PushFeedGroup2HideView(frame: pushViewFrame)
            pushView.imgView1.sd_setImage(with: url1)
            pushView.imgView2.sd_setImage(with: url2)
            vc.showPushView(inputView: pushView)
            return
        }
        if !isHide && isLike{
            let pushView = PushFeedGroup2LikeView(frame: pushViewFrame)
            pushView.imgView1.sd_setImage(with: url1)
            pushView.imgView2.sd_setImage(with: url2)
            vc.showPushView(inputView: pushView)
            return
        }
        
    }
    private func showPushGroup3Feed(groupData:GroupStruct,userData:[UserStruct],isLike:Bool,isHide:Bool){
        
        var url1 : URL!
        var url2 : URL!
        var url3 : URL!
        var groupName:String!
        if let user = userData.first(where: {$0.uid! == groupData.uid1!}){
            if let im = user.im{
                let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                url1 = url
            }
        }
        if let user = userData.first(where: {$0.uid! == groupData.uid2!}){
            if let im = user.im{
                let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                url2 = url
            }
        }
        if let user = userData.first(where: {$0.uid! == groupData.uid3!}){
            if let im = user.im{
                let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                url3 = url
            }
        }
        if let gNa = groupData.na{
            groupName = gNa
        }
        if !isHide && !isLike{
            let pushView = PushFeedGroup3DeliView(frame: pushViewFrame)
            pushView.imgView1.sd_setImage(with: url1)
            pushView.imgView2.sd_setImage(with: url2)
            pushView.imgView3.sd_setImage(with: url3)
            vc.showPushView(inputView: pushView)
            return
        }
        if isHide{
            let pushView = PushFeedGroup3HideView(frame: pushViewFrame)
            pushView.imgView1.sd_setImage(with: url1)
            pushView.imgView2.sd_setImage(with: url2)
            pushView.imgView3.sd_setImage(with: url3)
            vc.showPushView(inputView: pushView)
            return
        }
        if !isHide && isLike{
            let pushView = PushFeedGroup3LikeView(frame: pushViewFrame)
            pushView.imgView1.sd_setImage(with: url1)
            pushView.imgView2.sd_setImage(with: url2)
            pushView.imgView3.sd_setImage(with: url3)
            vc.showPushView(inputView: pushView)
            return
        }
    }
    private func showPushGroup4Feed(groupData:GroupStruct,userData:[UserStruct],isLike:Bool,isHide:Bool){
        
        
        var url1 : URL!
        var url2 : URL!
        var url3 : URL!
        var url4 : URL!
        var groupName:String!
        if let user = userData.first(where: {$0.uid! == groupData.uid1!}){
            if let im = user.im{
                let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                url1 = url
            }
        }
        if let user = userData.first(where: {$0.uid! == groupData.uid2!}){
            if let im = user.im{
                let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                url2 = url
            }
        }
        if let user = userData.first(where: {$0.uid! == groupData.uid3!}){
            if let im = user.im{
                let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                url3 = url
            }
        }
        if let user = userData.first(where: {$0.uid! == groupData.uid4!}){
            if let im = user.im{
                let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                url4 = url
            }
        }
        if let gNa = groupData.na{
            groupName = gNa
        }
        if !isHide && !isLike{
            let pushView = PushFeedGroup4DeliView(frame: pushViewFrame)
            pushView.imgView1.sd_setImage(with: url1)
            pushView.imgView2.sd_setImage(with: url2)
            pushView.imgView3.sd_setImage(with: url3)
            pushView.imgView4.sd_setImage(with: url4)
            vc.showPushView(inputView: pushView)
            return
        }
        if isHide{
            let pushView = PushFeedGroup4HideView(frame: pushViewFrame)
            pushView.imgView1.sd_setImage(with: url1)
            pushView.imgView2.sd_setImage(with: url2)
            pushView.imgView3.sd_setImage(with: url3)
            pushView.imgView4.sd_setImage(with: url4)
            vc.showPushView(inputView: pushView)
            return
        }
        if !isHide && isLike{
            let pushView = PushFeedGroup4LikeView(frame: pushViewFrame)
            pushView.imgView1.sd_setImage(with: url1)
            pushView.imgView2.sd_setImage(with: url2)
            pushView.imgView3.sd_setImage(with: url3)
            pushView.imgView4.sd_setImage(with: url4)
            vc.showPushView(inputView: pushView)
            return
        }
    }
    private func showPushGroup2Match(groupData:GroupStruct,userData:[UserStruct]){
        var url1 : URL!
        var url2 : URL!
        var groupName:String!
        if let user = userData.first(where: {$0.uid! == groupData.uid1!}){
            if let im = user.im{
                let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                url1 = url
            }
        }
        if let user = userData.first(where: {$0.uid! == groupData.uid2!}){
            if let im = user.im{
                let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                url2 = url
            }
        }
        if let gNa = groupData.na{
            groupName = gNa
        }
        let pushView = PushMatchGroup2View(frame: pushViewFrame)
        pushView.imgView1.sd_setImage(with: url1)
        pushView.imgView2.sd_setImage(with: url2)
        self.vc.showPushView(inputView: pushView)
        return
    }
    private func showPushGroup3Match(groupData:GroupStruct,userData:[UserStruct]){
        var url1 : URL!
        var url2 : URL!
        var url3 : URL!
        var groupName:String!
        if let user = userData.first(where: {$0.uid! == groupData.uid1!}){
            if let im = user.im{
                let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                url1 = url
            }
        }
        if let user = userData.first(where: {$0.uid! == groupData.uid2!}){
            if let im = user.im{
                let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                url2 = url
            }
        }
        if let user = userData.first(where: {$0.uid! == groupData.uid3!}){
            if let im = user.im{
                let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                url3 = url
            }
        }
        if let gNa = groupData.na{
            groupName = gNa
        }
        let pushView = PushMatchGroup3View(frame: pushViewFrame)
        pushView.imgView1.sd_setImage(with: url1)
        pushView.imgView2.sd_setImage(with: url2)
        pushView.imgView3.sd_setImage(with: url3)
        self.vc.showPushView(inputView: pushView)
        return
    }
    private func showPushGroup4Match(groupData:GroupStruct,userData:[UserStruct]){
        var url1 : URL!
        var url2 : URL!
        var url3 : URL!
        var url4 : URL!
        var groupName:String!
        if let user = userData.first(where: {$0.uid! == groupData.uid1!}){
            if let im = user.im{
                let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                url1 = url
            }
        }
        if let user = userData.first(where: {$0.uid! == groupData.uid2!}){
            if let im = user.im{
                let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                url2 = url
            }
        }
        if let user = userData.first(where: {$0.uid! == groupData.uid3!}){
            if let im = user.im{
                let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                url3 = url
            }
        }
        if let user = userData.first(where: {$0.uid! == groupData.uid4!}){
            if let im = user.im{
                let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                url4 = url
            }
        }
        if let gNa = groupData.na{
            groupName = gNa
        }
        let pushView = PushMatchGroup4View(frame: pushViewFrame)
        pushView.imgView1.sd_setImage(with: url1)
        pushView.imgView2.sd_setImage(with: url2)
        pushView.imgView3.sd_setImage(with: url3)
        pushView.imgView4.sd_setImage(with: url4)
        self.vc.showPushView(inputView: pushView)
        return
    }
    
    private func AddSideGroupMatch(gData:GLStruct){
        let async = DispatchGroup()
        var userData = [UserStruct]()
        var groupData:GroupStruct!
        let uids = gData.uids!
        let gid = gData.targetid!
        for uid in uids{
            if uid != ""{
                async.enter()
                let ref = db.collection("user1").document(uid).collection("user2").document(uid)
                ref.getDocument{ (doc,err) in
                    if let document = doc, document.exists{
                        let id = ["uid":document.documentID] as [String:Any]
                        var im = [imgStruct]()
                        if let snapIm = document.data()!["im"] as? [[String:Any]]{
                            for i in snapIm{
                                let imgObj = imgStruct(dictionary: i)
                                im.append(imgObj)
                            }
                        }
                        let data = UserStruct(dictionary: id.merging(document.data()!){ (_,f) -> Any in f})
                        data.im = im
                        self.myGroupUsers.append(data)
                        userData.append(data)
                    }
                    async.leave()
                }
            }
        }
        async.enter()
        let ref = db.collection("group").document(gid).collection("glist").document("ginfo")
        ref.getDocument{ (doc,err) in
            if let document = doc ,document.exists{
                let data = GroupStruct(dictionary: document.data()!)
                self.groupDataArray.append(data)
                groupData = data
                self.myGroupData.append(groupData)
                async.leave()
            }
        }
        async.notify(queue: .main, execute: {
            let myGroupData = SideGroupStruct(group: groupData, members: userData, GL: gData)
            guard let findListIndex = self.sideGroupMatchList.firstIndex(where: {$0.keys.contains(gData.gid!)}) else { return }
            self.sideGroupMatchList[findListIndex][gData.gid!]?.append(myGroupData)
            self.delegate?.AddGroupMatch(gData: myGroupData)
        })
        
    }
    private func AddSideGroupWait(gData:GLStruct){
        let async = DispatchGroup()
        var userData = [UserStruct]()
        var groupData:GroupStruct!
        let uids = gData.uids!
        let gid = gData.targetid!
        for uid in uids{
            if uid != ""{
                async.enter()
                let ref = db.collection("user1").document(uid).collection("user2").document(uid)
                ref.getDocument{ (doc,err) in
                    if let document = doc, document.exists{
                        let id = ["uid":document.documentID] as [String:Any]
                        var im = [imgStruct]()
                        if let snapIm = document.data()!["im"] as? [[String:Any]]{
                            for i in snapIm{
                                let imgObj = imgStruct(dictionary: i)
                                im.append(imgObj)
                            }
                        }
                        let data = UserStruct(dictionary: id.merging(document.data()!){ (_,f) -> Any in f})
                        data.im = im
                        self.myGroupUsers.append(data)
                        userData.append(data)
                    }
                    async.leave()
                }
            }
        }
        async.enter()
        let ref = db.collection("group").document(gid).collection("glist").document("ginfo")
        ref.getDocument{ (doc,err) in
            if let document = doc ,document.exists{
                let data = GroupStruct(dictionary: document.data()!)
                self.groupDataArray.append(data)
                groupData = data
                self.myGroupData.append(groupData)
            }
            async.leave()
        }
        async.notify(queue: .main, execute: {
            let myGroupData = SideGroupStruct(group: groupData, members: userData, GL: gData)
            guard let findListIndex = self.sideGroupMatchList.firstIndex(where: {$0.keys.contains(gData.gid!)}) else { return }
            self.sideGroupWaitList[findListIndex][gData.gid!]?.append(myGroupData)
            self.delegate?.AddGroupFeedVote(gData: myGroupData)
        })
        
    }
    private func RemoveSideGroupFeed(gData:GLStruct){
        guard let findItem = self.sideGroupFeedList.first(where: {$0.keys.contains(gData.gid!)}) else { return }
        guard var findArray = findItem[gData.gid!] as? [SideGroupStruct] else { return }
        findArray.removeAll(where: {$0.GL?.gid == gData.gid!})
        
    }
    private func RemoveSideGroupMatch(gData:GLStruct){
        
    }
    private func RemoveSideGRoupWait(gData:GLStruct){
        
    }
    
    
    
    
    
    
    private func addMyGroup(mData:MyinfoStruct){
        let async = DispatchGroup()
        var userData = [UserStruct]()
        var groupData:GroupStruct!
        let uids = mData.uids!
        let gid = mData.id!
        for uid in uids{
            if uid != ""{
                async.enter()
                let ref = db.collection("user1").document(uid).collection("user2").document(uid)
                ref.getDocument{ (doc,err) in
                    if let document = doc, document.exists{
                        let id = ["uid":document.documentID] as [String:Any]
                        var im = [imgStruct]()
                        if let snapIm = document.data()!["im"] as? [[String:Any]]{
                            for i in snapIm{
                                let imgObj = imgStruct(dictionary: i)
                                im.append(imgObj)
                            }
                        }
                        let data = UserStruct(dictionary: id.merging(document.data()!){ (_,f) -> Any in f})
                        data.im = im
                        self.myGroupUsers.append(data)
                        userData.append(data)
                    }
                    async.leave()
                }
            }
        }
        async.enter()
        let ref = db.collection("group").document(gid).collection("glist").document("ginfo")
        ref.getDocument{ (doc,err) in
            if let document = doc ,document.exists{
                let data = GroupStruct(dictionary: document.data()!)
                self.groupDataArray.append(data)
                groupData = data
                self.myGroupData.append(groupData)
                async.leave()
            }
        }
        async.notify(queue: .main, execute: {
            let myGroupData = MyGroupListStruct(list: mData, group: groupData, member: userData)
            if mData.ind2 == 500{
                self.activeGroupList.append(myGroupData)
                self.setGroupListener(gid: mData.id!)
            }
            if mData.ind2 != 1000{
                self.userGroupList.insert(myGroupData, at: 0)
            }
            self.delegate?.AddMyGroup(data: myGroupData)
        })
    }
    private func modifyMyGroup(mData:MyinfoStruct){
        if mData.ind2! == 1000{
            self.userGroupList.removeAll(where: {$0.listInfo?.id! == mData.id!})
            self.activeGroupList.removeAll(where: {$0.listInfo?.id! == mData.id!})
            delegate?.ModifyMyGroup(data: mData)
            return
        }
        
        if mData.ind2! == 500{
            if let findItem = self.userGroupList.first(where: {$0.listInfo?.id! == mData.id! }){
                findItem.listInfo = mData
                self.activeGroupList.append(findItem)
            }
            self.userGroupList.removeAll(where: {$0.listInfo?.id! == mData.id!})
        }else{
            if let findItem = self.userGroupList.first(where: {$0.listInfo?.id! == mData.id!}){
                findItem.listInfo = mData
            }
        }
        delegate?.ModifyMyGroup(data: mData)
    }
    
    private func loadSoloProflie(mData:MStruct){
        let tempMdata = MainListStruct(m: mData)
        delegate?.AddMainList(mData: tempMdata)
        let uid = mData.pid!
        let ref = db.collection("user1").document(uid).collection("user2").document(uid)
        ref.getDocument{ (doc,err) in
            if let document = doc,document.exists{
                var im = [imgStruct]()
                if let snapIm = document.data()!["im"] as? [[String:Any]]{
                    for i in snapIm{
                        let imgObj = imgStruct(dictionary: i)
                        im.append(imgObj)
                    }
                }
                let id = ["uid":document.documentID] as [String:Any]
                let data = UserStruct(dictionary: id.merging(document.data()!){(_,f) -> Any in f})
                data.im = im
                let mainData = MainListStruct(m: mData, solo: data)
                self.mainList.append(mainData)
                self.delegate?.AddMainList(mData: mainData)
            }
        }
    }
    private func loadGroupProfile(mData:MStruct){
        let tempMdata = MainListStruct(m: mData)
        delegate?.AddMainList(mData: tempMdata)
        let async = DispatchGroup()
        var userData = [UserStruct]()
        var groupData = GroupStruct()
        let gid = mData.pid!
        let uids = mData.pids!
        for uid in uids{
            if uid != ""{
                async.enter()
                let ref = db.collection("user1").document(uid).collection("user2").document(uid)
                ref.getDocument{ (doc,err) in
                    if let document = doc, document.exists{
                        let id = ["uid":document.documentID] as [String:Any]
                        var im = [imgStruct]()
                        if let snapIm = document.data()!["im"] as? [[String:Any]]{
                            for i in snapIm{
                                let imgObj = imgStruct(dictionary: i)
                                im.append(imgObj)
                            }
                        }
                        let data = UserStruct(dictionary: id.merging(document.data()!){ (_,f) -> Any in f})
                        data.im = im
                        userData.append(data)
                    }
                    async.leave()
                }
            }
        }
        async.enter()
        let ref = db.collection("group").document(gid).collection("glist").document("ginfo")
        ref.getDocument{ (doc,err) in
            if let document = doc ,document.exists{
                let data = GroupStruct(dictionary: document.data()!)
                groupData = data
            }
            async.leave()
        }
        async.notify(queue: .main, execute: {
            let mainData = MainListStruct(m: mData, group: groupData, member: userData)
            self.mainList.append(mainData)
            self.delegate?.AddMainList(mData: mainData)
        })
    }
    private func updateMainList(mData:MStruct){
        if let element = mainList.first(where: {$0.mStruct?.pid == mData.pid}){
            element.mStruct!.in2 = mData.in2
        }
        delegate?.UpdateMainList(mData: mData)
    }
    private func removeMainList(mData:MStruct){
        if let element = mainList.first(where: {$0.mStruct?.pid == mData.pid}){
            element.mStruct!.in1 = mData.in1
        }
        delegate?.UpdateMainList(mData: mData)
    }
    
    
    
    
    private func SoloFeedAdd(mData:MStruct){
        print("hereAdd",mData)
        let tempMdata = MainListStruct(m: mData)
        if self.SoloFeedList.count != 0{
            if (self.SoloFeedList[0].mStruct?.tp!.seconds)! > mData.tp!.seconds{
                self.SoloFeedList.append(tempMdata)
            }else{
                self.SoloFeedList.insert(tempMdata, at: 0)
            }
        }else{
            self.SoloFeedList.append(tempMdata)
        }
        let uid = mData.pid!
        let ref = db.collection("user1").document(uid).collection("user2").document(uid)
        ref.getDocument{ (doc,err) in
            if let document = doc,document.exists{
                var im = [imgStruct]()
                if let snapIm = document.data()!["im"] as? [[String:Any]]{
                    for i in snapIm{
                        let imgObj = imgStruct(dictionary: i)
                        im.append(imgObj)
                    }
                }
                let id = ["uid":document.documentID] as [String:Any]
                let data = UserStruct(dictionary: id.merging(document.data()!){(_,f) -> Any in f})
                data.im = im
                let mainData = MainListStruct(m: mData, solo: data)
                self.delegate?.AddSoloFeed(data:mainData)
                
                if mData.in2 == 300{
                    if mData.tp!.seconds > self.initialTime!{
                        if !self.myMatchArray.contains(mData.pid!){
                            let url = CreateThumbUrl.mainImgUrl(uid: mData.pid!, imgObjs: data.im!)
                            if let plus = self.userInfo.ind2, plus == true{
                                let pushView = PushFeedSoloLikeView(frame: self.pushViewFrame)
                                pushView.imgView.sd_setImage(with: url)
                                self.vc.showPushView(inputView: pushView)
                            }else{
                                let pushView = PushFeedSoloHideView(frame: self.pushViewFrame)
                                pushView.imgView.sd_setImage(with: url)
                                self.vc.showPushView(inputView: pushView)
                            }
                        }
                    }
                }
                if mData.in2 == 400{
                    if mData.tp!.seconds > self.initialTime!{
                        if !self.myMatchArray.contains(mData.pid!){
                            let url = CreateThumbUrl.mainImgUrl(uid: mData.pid!, imgObjs: data.im!)
                            let pushView = PushFeedSoloDeliView(frame: self.pushViewFrame)
                            pushView.imgView.sd_setImage(with: url)
                            self.vc.showPushView(inputView: pushView)
                        }
                    }
                }
            }
        }
        
    }
    private func SoloMatchAdd(mData:MStruct){
        let uid = mData.pid!
        let ref = db.collection("user1").document(uid).collection("user2").document(uid)
        ref.getDocument{ (doc,err) in
            if let document = doc,document.exists{
                var im = [imgStruct]()
                if let snapIm = document.data()!["im"] as? [[String:Any]]{
                    for i in snapIm{
                        let imgObj = imgStruct(dictionary: i)
                        im.append(imgObj)
                    }
                }
                let id = ["uid":document.documentID] as [String:Any]
                let data = UserStruct(dictionary: id.merging(document.data()!){(_,f) -> Any in f})
                data.im = im
                let mainData = MainListStruct(m: mData, solo: data)
                self.delegate?.AddSoloMatch(data:mainData)
            }
        }
    }
    private func SoloFeedRemove(mData:MStruct){
        self.delegate?.RemoveSoloFeed(data: mData)
    }
    
    private func SoloMatchRemove(mData:MStruct){
        self.delegate?.RemoveSoloMatch(data:mData)
    }
    
    
    
    
    
    private func addMyGroupList(data:MyinfoStruct,completion:@escaping()->Void={}){
        
        self.myGroupList.append(data)
        completion()
    }
    private func modifyMyGroupList(data:MyinfoStruct,completion:@escaping()->Void){
        if let findData = myGroupList.first(where: {$0.id! == data.id!}){
            let newIndex = data.ind2
            findData.ind2 = newIndex
        }
        completion()
    }
    private func updateView(cv:UICollectionView){
        cv.reloadData()
    }
    private func downloadGroupProfile(gid:String,uids:[String]){
        let async = DispatchGroup()
        
        var userData = [UserStruct]()
        var groupData:GroupStruct!
        for uid in uids{
            if uid != nil && uid != ""{
                async.enter()
                let ref = db.collection("user1").document(uid).collection("user2").document(uid)
                ref.getDocument{ (doc,err) in
                    if let document = doc, document.exists{
                        let id = ["uid":document.documentID] as [String:Any]
                        var im = [imgStruct]()
                        if let snapIm = document.data()!["im"] as? [[String:Any]]{
                            for i in snapIm{
                                let imgObj = imgStruct(dictionary: i)
                                im.append(imgObj)
                            }
                        }
                        let data = UserStruct(dictionary: id.merging(document.data()!){ (_,f) -> Any in f})
                        data.im = im
                        self.myGroupUsers.append(data)
                        userData.append(data)
                    }
                    async.leave()
                }
            }
        }
        async.enter()
        let ref = db.collection("group").document(gid).collection("glist").document("ginfo")
        ref.getDocument{ (doc,err) in
            if let document = doc ,document.exists{
                let data = GroupStruct(dictionary: document.data()!)
                self.groupDataArray.append(data)
                groupData = data
                self.myGroupData.append(groupData)
                async.leave()
            }
        }
        async.notify(queue: .main, execute: {
            self.delegate?.addMyGroupData(groupData:groupData,userData: userData)
        })
    }
    private func downloadUserProfile(userData:MStruct){
        guard let uid = userData.pid as? String else { return }
        let ref = db.collection("user1").document(uid).collection("user2").document(uid)
        ref.getDocument{ (doc,err) in
            if let document = doc,document.exists{
                let id = ["uid":document.documentID] as [String:Any]
                let data = UserStruct(dictionary: id.merging(document.data()!){(_,f) -> Any in f})
                self.userDataArray.append(data)
                self.delegate?.createMainList(listData: userData, userData: data)
            }
        }
    }
    private func downloadMainSolo(mData:MStruct){
        guard let uid = mData.pid else {
            return
        }
        let ref = db.collection("user1").document(uid).collection("user2").document(uid)
        ref.getDocument { (doc, err) in
            if (err != nil){
                return
            }
            
            
        }
    }
    private func MatchSoloUser(userData:MStruct){
        if let action = userData.in1 {
            if action != 500{
                if let deleteIndex = soloMatchArray.firstIndex(where: {$0.uid! == userData.uid!}){
                    self.soloMatchArray.remove(at: deleteIndex)
                }
                self.delegate?.removeSoloMatchUser(userIdentifier: userData.uid!)
            }
        }
        
        guard let uid = userData.pid as? String  else { return }
        let ref = db.collection("user1").document(uid).collection("user2").document(uid)
        ref.getDocument{ (doc,err) in
            if let document = doc,document.exists{
                let addingData = ["uid":document.documentID,"send":userData.in1!,"receive":userData.in2!,"actionTp":userData.tp!] as [String:Any]
                let data = SoloStruct(dictionary: addingData.merging(document.data()!){(_,f) -> Any in f})
                self.soloMatchArray.append(data)
                self.delegate?.addSoloMatchUser(userData: data)
            }
        }
    }
    private func LikeSoloUser(userData:MStruct){
        if let action = userData.in2 {
            if action != 300{
                if let deleteIndex = self.soloLikeArray.firstIndex(where: {$0.uid! == userData.uid!}){
                    soloLikeArray.remove(at: deleteIndex)
                }
                
                if let deleteIndex = self.soloLikeArray.firstIndex(where: {$0.uid! == userData.uid!}){
                    soloLikeArray.remove(at: deleteIndex)
                }
                self.delegate?.removeSoloLikeUser(userIdentifier: userData.uid!)
                
            }
        }
        
        guard let uid = userData.pid as? String  else { return }
        let ref = db.collection("user1").document(uid).collection("user2").document(uid)
        ref.getDocument{ (doc,err) in
            if let document = doc,document.exists{
                let addingData = ["uid":document.documentID,"send":userData.in1!,"receive":userData.in2!,"actionTp":userData.tp!] as [String:Any]
                let data = SoloStruct(dictionary: addingData.merging(document.data()!){(_,f) -> Any in f})
                self.soloLikeArray.append(data)
                self.soloNotiArray.append(data)
                self.delegate?.addSoloLikeUser(userData: data)
            }
        }
    }
    
    private func DeliSoloUser(userData:MStruct){
        if let action = userData.in2 {
            if action != 400{
                if let deleteIndex = self.soloLikeArray.firstIndex(where: {$0.uid! == userData.uid!}){
                    soloLikeArray.remove(at: deleteIndex)
                }
                
                if let deleteIndex = self.soloLikeArray.firstIndex(where: {$0.uid! == userData.uid!}){
                    soloLikeArray.remove(at: deleteIndex)
                }
                self.delegate?.removeSoloDeliUser(userIdentifier: userData.uid!)
            }
        }
        guard let uid = userData.pid as? String  else { return }
        let ref = db.collection("user1").document(uid).collection("user2").document(uid)
        ref.getDocument{ (doc,err) in
            if let document = doc,document.exists{
                let addingData = ["uid":document.documentID,"send":userData.in1!,"receive":userData.in2!,"actionTp":userData.tp!] as [String:Any]
                let data = SoloStruct(dictionary: addingData.merging(document.data()!){(_,f) -> Any in f})
                self.soloDeliArray.append(data)
                self.soloNotiArray.append(data)
                self.delegate?.addSoloDeliUser(userData: data)
            }
        }
    }
    private func updateToken(){
        if tokenSetting{
            return
        }
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let ref = db.collection("user1").document(uid).collection("user2").document(uid)
        ref.updateData(["tk":self.tk!]){(err) in
            if err == nil{
                self.tokenSetting = true
            }
        }
    }
    
    
    
    
    
    
    
    
    func sendSoloLike(targetStruct:MainListStruct,completion:@escaping(Bool)->Void){
        
        guard let currentUser = userInfo else { return }
        guard let partnerUser = targetStruct.soloStruct else { return }
        guard let partnerState = targetStruct.mStruct else { return }
        var defaultLike = currentUser.sx! ? 10 : 15
        if currentUser.ind2!{
            defaultLike = currentUser.sx! ? 20 : 30
        }
        let isUpdateTP = cashItem.like == defaultLike ? true : false
        let mRef = db.collection("mlist").document(currentUser.uid!).collection("mmlist").document(partnerUser.uid!)
        let cashRef = db.collection("cash").document(currentUser.uid!).collection("chlist").document("uch")
        let mlistUpdateData:[String:Any] = partnerState.in2 == 300 || partnerState.in2 == 400 ? ["in1":500,"in2":500,"tp":FieldValue.serverTimestamp()] :  ["in1":300,"tp":FieldValue.serverTimestamp()]
        let cashUpdateData:[String:Any] = isUpdateTP ? ["like" : FieldValue.increment(Int64(-1)),"litp":FieldValue.serverTimestamp()] : ["like" : FieldValue.increment(Int64(-1))]
        let asyncGroup = DispatchGroup()
        var isFail = false
        asyncGroup.enter()
        mRef.updateData(mlistUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
        }
        asyncGroup.enter()
        cashRef.updateData(cashUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
        }
        asyncGroup.notify(queue: .main){
            completion(isFail)
        }
    }
    func sendSoloDeli(targetStruct:MainListStruct,completion:@escaping(Bool)->Void){
        guard let currentUser = userInfo else { return }
        guard let partnerUser = targetStruct.soloStruct else { return }
        guard let partnerState = targetStruct.mStruct else { return }
        var defaultDeli = 2
        if currentUser.ind2!{
            defaultDeli = 5
        }
        let isUpdateTP = cashItem.deli == defaultDeli ? false : true
        let mRef = db.collection("mlist").document(currentUser.uid!).collection("mmlist").document(partnerUser.uid!)
        let cashRef = db.collection("cash").document(currentUser.uid!).collection("chlist").document("uch")
        let mlistUpdateData:[String:Any] = partnerState.in2 == 300 || partnerState.in2 == 400 ? ["in1":500,"in2":500,"tp":FieldValue.serverTimestamp()] :  ["in1":300,"tp":FieldValue.serverTimestamp()]
        var cashUpdateData:[String:Any] = isUpdateTP ? ["deli" : FieldValue.increment(Int64(-1)),"dltp":FieldValue.serverTimestamp()] : ["deli" : FieldValue.increment(Int64(-1))]
        if (cashItem.deli == 0 && cashItem.deli2! > 0){
            cashUpdateData = ["deli2" : FieldValue.increment(Int64(-1))]
        }
        let asyncGroup = DispatchGroup()
        var isFail = false
        asyncGroup.enter()
        mRef.updateData(mlistUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
        }
        asyncGroup.enter()
        cashRef.updateData(cashUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
        }
        asyncGroup.notify(queue: .main){
            completion(isFail)
        }
    }
    func rejectSolo(targetUid:String){
        guard let currentUser = Auth.auth().currentUser else { return }
        let ref = db.collection("mlist").document(currentUser.uid).collection("mmlist").document(targetUid)
        let updateData : [String:Any] = ["in1":901,"tp":FieldValue.serverTimestamp()]
        ref.updateData(updateData)
    }
    func reportSolo(targetUid:String,reportType:Int){
        guard let currentUser = Auth.auth().currentUser else { return }
        let ref = db.collection("mlist").document(currentUser.uid).collection("mmlist").document(targetUid)
        let updateData : [String:Any] = ["in1":reportType,"tp":FieldValue.serverTimestamp()]
        ref.updateData(updateData)
    }
    func sendGroupLike(groupData:SideGroupStruct,myGid:String,completion:@escaping(Bool)->Void){
        guard let groupStruct = groupData.GL else { return }
        guard let currentUser = Auth.auth().currentUser else { return }
        let groupSize = groupStruct.num!
        let groupState:ClassifyGroupStruct!
        if groupSize == 2{
            groupState = ClassifyGroupState.group2State(groupData: groupStruct, inputState: 300)
        }else if groupSize == 3{
            groupState = ClassifyGroupState.group3State(groupData: groupStruct, inputState: 300)
        }else{
            groupState = ClassifyGroupState.group3State(groupData: groupStruct, inputState: 300)
        }
        if groupState.needGroupUpdate == nil{
            return
        }
        let cashRef = db.collection("cash").document(currentUser.uid).collection("chlist").document("uch")
        let groupRef = db.collection("gl").document(myGid).collection("ggl").document(groupStruct.targetid!)
        let mlistRef = db.collection("mlist").document(currentUser.uid).collection("mmlist").document(groupStruct.targetid!)
        let groupUpdateData:[String:Any]!
        var cashUpdateData:[String:Any]!
        let mlistUpdateData:[String:Any]!
        
        
        var defaultLike = userInfo.sx! ? 10 : 15
        if userInfo.ind2!{
            defaultLike = userInfo.sx! ? 20 : 30
        }
        if cashItem.like != 0 && cashItem.like == defaultLike{
            cashUpdateData = ["like" : FieldValue.increment(Int64(-1))]
        }
        if cashItem.like != 0 && cashItem.like != defaultLike{
            cashUpdateData = ["like" : FieldValue.increment(Int64(-1)),"litp":FieldValue.serverTimestamp()]
        }
        var isCash = false
        if groupState.needGroupUpdate!{
            if groupState.needCash!{
                isCash = true
                let state = groupState.groupIndex!
                groupUpdateData = state == 500 || state == 1000 ? ["ind1":state,"ind2":state, "mid" : FieldValue.arrayUnion([currentUser.uid,300]),"tp" : FieldValue.serverTimestamp()] : ["ind1":state,"mid" : FieldValue.arrayUnion([currentUser.uid,300]),"tp" : FieldValue.serverTimestamp()]
                mlistUpdateData = ["in1":300,"tp":FieldValue.serverTimestamp()]
                
            }else{
                let state = groupState.groupIndex!
                groupUpdateData = state == 500 || state == 1000 ? ["ind1":state,"ind2":state, "mid" : FieldValue.arrayUnion([currentUser.uid,300]),"tp" : FieldValue.serverTimestamp()] : ["ind1":state,"mid" : FieldValue.arrayUnion([currentUser.uid,300]),"tp" : FieldValue.serverTimestamp()]
                mlistUpdateData = ["in1":300,"tp":FieldValue.serverTimestamp()]
                
            }
        }else{
            if groupState.needCash!{
                isCash = true
                let state = groupState.groupIndex!
                groupUpdateData = [ "mid" : FieldValue.arrayUnion([currentUser.uid,300]),"tp" : FieldValue.serverTimestamp()]
                mlistUpdateData = ["in1":300,"tp":FieldValue.serverTimestamp()]
                
            }else{
                let state = groupState.groupIndex!
                groupUpdateData = ["mid" : FieldValue.arrayUnion([currentUser.uid,300]),"tp" : FieldValue.serverTimestamp()]
                mlistUpdateData = ["in1":300,"tp":FieldValue.serverTimestamp()]
                
            }
        }
        var isFail = false
        let asyncGroup = DispatchGroup()
        asyncGroup.enter()
        groupRef.updateData(groupUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
            
        }
        asyncGroup.enter()
        mlistRef.updateData(mlistUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
        }
        if isCash{
            asyncGroup.enter()
            cashRef.updateData(cashUpdateData){(err) in
                if err != nil{
                    isFail = true
                }
                asyncGroup.leave()
            }
        }
        asyncGroup.notify(queue: .main){
            completion(isFail)
        }
        
    }
    func sendGroupDeli(groupData:SideGroupStruct,myGid:String,completion:@escaping(Bool)->Void){
        
        guard let groupStruct = groupData.GL else { return }
        guard let currentUser = Auth.auth().currentUser else { return }
        let groupSize = groupStruct.num!
        let groupState:ClassifyGroupStruct!
        if groupSize == 2{
            groupState = ClassifyGroupState.group2State(groupData: groupStruct, inputState: 400)
        }else if groupSize == 3{
            groupState = ClassifyGroupState.group3State(groupData: groupStruct, inputState: 400)
        }else{
            groupState = ClassifyGroupState.group3State(groupData: groupStruct, inputState: 400)
        }
        if groupState.needGroupUpdate == nil{
            return
        }
        let cashRef = db.collection("cash").document(currentUser.uid).collection("chlist").document("uch")
        let groupRef = db.collection("gl").document(myGid).collection("ggl").document(groupStruct.targetid!)
        let mlistRef = db.collection("mlist").document(currentUser.uid).collection("mmlist").document(groupStruct.targetid!)
        let groupUpdateData:[String:Any]!
        var cashUpdateData:[String:Any]!
        let mlistUpdateData:[String:Any]!
        
        let defaultDeli = !userInfo.ind2! ? 2 : 5
        if cashItem.deli != 0 && cashItem.deli == defaultDeli{
            cashUpdateData = ["deli" : FieldValue.increment(Int64(-1))]
        }
        if cashItem.deli != 0 && cashItem.deli != defaultDeli{
            cashUpdateData = ["deli" : FieldValue.increment(Int64(-1)),"dltp":FieldValue.serverTimestamp()]
        }
        if cashItem.deli == 0 && cashItem.deli2! > 0{
            cashUpdateData = ["deli2" : FieldValue.increment(Int64(-1))]
        }
        var isCash = false
        if groupState.needGroupUpdate!{
            if groupState.needCash!{
                isCash = true
                let state = groupState.groupIndex!
                groupUpdateData = state == 500 || state == 1000 ? ["ind1":state,"ind2":state, "mid" : FieldValue.arrayUnion([currentUser.uid,400]),"tp" : FieldValue.serverTimestamp()] : ["ind1":state,"mid" : FieldValue.arrayUnion([currentUser.uid,400]),"tp" : FieldValue.serverTimestamp()]
                mlistUpdateData = ["in1":400,"tp":FieldValue.serverTimestamp()]
                
            }else{
                let state = groupState.groupIndex!
                groupUpdateData = state == 500 || state == 1000 ? ["ind1":state,"ind2":state, "mid" : FieldValue.arrayUnion([currentUser.uid,400]),"tp" : FieldValue.serverTimestamp()] : ["ind1":state,"mid" : FieldValue.arrayUnion([currentUser.uid,400]),"tp" : FieldValue.serverTimestamp()]
                mlistUpdateData = ["in1":400,"tp":FieldValue.serverTimestamp()]
                
            }
        }else{
            if groupState.needCash!{
                isCash = true
                let state = groupState.groupIndex!
                groupUpdateData = [ "mid" : FieldValue.arrayUnion([currentUser.uid,400]),"tp" : FieldValue.serverTimestamp()]
                mlistUpdateData = ["in1":400,"tp":FieldValue.serverTimestamp()]
                
            }else{
                let state = groupState.groupIndex!
                groupUpdateData = ["mid" : FieldValue.arrayUnion([currentUser.uid,400]),"tp" : FieldValue.serverTimestamp()]
                mlistUpdateData = ["in1":400,"tp":FieldValue.serverTimestamp()]
                
            }
        }
        var isFail = false
        let asyncGroup = DispatchGroup()
        asyncGroup.enter()
        groupRef.updateData(groupUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
            
        }
        asyncGroup.enter()
        mlistRef.updateData(mlistUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
        }
        if isCash{
            asyncGroup.enter()
            cashRef.updateData(cashUpdateData){(err) in
                if err != nil{
                    isFail = true
                }
                asyncGroup.leave()
            }
        }
        asyncGroup.notify(queue: .main){
            completion(isFail)
        }
        
    }
    func rejectGroup(groupData:SideGroupStruct,myGid:String,completion:@escaping(Bool)->Void){
        
        guard let groupStruct = groupData.GL else { return }
        guard let currentUser = Auth.auth().currentUser else { return }
        let groupSize = groupStruct.num!
        let groupState:ClassifyGroupStruct!
        if groupSize == 2{
            groupState = ClassifyGroupState.group2State(groupData: groupStruct, inputState: 400)
        }else if groupSize == 3{
            groupState = ClassifyGroupState.group3State(groupData: groupStruct, inputState: 400)
        }else{
            groupState = ClassifyGroupState.group3State(groupData: groupStruct, inputState: 400)
        }
        if groupState.needGroupUpdate == nil{
            return
        }
        let cashRef = db.collection("cash").document(currentUser.uid).collection("chlist").document("uch")
        let groupRef = db.collection("gl").document(myGid).collection("ggl").document(groupStruct.targetid!)
        let mlistRef = db.collection("mlist").document(currentUser.uid).collection("mmlist").document(groupStruct.targetid!)
        let groupUpdateData:[String:Any]!
        var cashUpdateData:[String:Any]!
        let mlistUpdateData:[String:Any]!
        
        if groupState.needGroupUpdate!{
            if groupState.needCash!{
                let state = groupState.groupIndex!
                groupUpdateData = state == 500 || state == 1000 ? ["ind1":state,"ind2":state, "mid" : FieldValue.arrayUnion([currentUser.uid,901]),"tp" : FieldValue.serverTimestamp()] : ["ind1":state,"mid" : FieldValue.arrayUnion([currentUser.uid,901]),"tp" : FieldValue.serverTimestamp()]
                mlistUpdateData = ["in1":901,"tp":FieldValue.serverTimestamp()]
                
            }else{
                let state = groupState.groupIndex!
                groupUpdateData = state == 500 || state == 1000 ? ["ind1":state,"ind2":state, "mid" : FieldValue.arrayUnion([currentUser.uid,901]),"tp" : FieldValue.serverTimestamp()] : ["ind1":state,"mid" : FieldValue.arrayUnion([currentUser.uid,901])]
                mlistUpdateData = ["in1":901,"tp":FieldValue.serverTimestamp()]
                
            }
        }else{
            if groupState.needCash!{
                let state = groupState.groupIndex!
                groupUpdateData = [ "mid" : FieldValue.arrayUnion([currentUser.uid,901]),"tp" : FieldValue.serverTimestamp()]
                mlistUpdateData = ["in1":901,"tp":FieldValue.serverTimestamp()]
                
            }else{
                let state = groupState.groupIndex!
                groupUpdateData = ["mid" : FieldValue.arrayUnion([currentUser.uid,901]),"tp" : FieldValue.serverTimestamp()]
                mlistUpdateData = ["in1":901,"tp":FieldValue.serverTimestamp()]
                
            }
        }
        var isFail = false
        let asyncGroup = DispatchGroup()
        asyncGroup.enter()
        groupRef.updateData(groupUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
            
        }
        asyncGroup.enter()
        mlistRef.updateData(mlistUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
        }
        asyncGroup.notify(queue: .main){
            completion(isFail)
        }
        
    }
    func reportGroup(groupData:SideGroupStruct,myGid:String,report:Int,completion:@escaping(Bool)->Void){
        
        guard let groupStruct = groupData.GL else { return }
        guard let currentUser = Auth.auth().currentUser else { return }
        let groupSize = groupStruct.num!
        let groupState:ClassifyGroupStruct!
        if groupSize == 2{
            groupState = ClassifyGroupState.group2State(groupData: groupStruct, inputState: report)
        }else if groupSize == 3{
            groupState = ClassifyGroupState.group3State(groupData: groupStruct, inputState: report)
        }else{
            groupState = ClassifyGroupState.group3State(groupData: groupStruct, inputState: report)
        }
        if groupState.needGroupUpdate == nil{
            return
        }
        let groupRef = db.collection("gl").document(myGid).collection("ggl").document(groupStruct.targetid!)
        let mlistRef = db.collection("mlist").document(currentUser.uid).collection("mmlist").document(groupStruct.targetid!)
        let groupUpdateData:[String:Any]!
        let mlistUpdateData:[String:Any]!
        
        if groupState.needGroupUpdate!{
            let state = groupState.groupIndex!
            groupUpdateData = state == 500 || state == 1000 ? ["ind1":state,"ind2":state,"mid" : FieldValue.arrayUnion([currentUser.uid,report]),"tp":FieldValue.serverTimestamp()] : ["ind1":state,"mid" : FieldValue.arrayUnion([currentUser.uid,report]),"tp":FieldValue.serverTimestamp()]
            mlistUpdateData =  ["in1":report,"tp":FieldValue.serverTimestamp()]
        }else{
            let state = groupState.groupIndex!
            groupUpdateData = ["mid" : FieldValue.arrayUnion([currentUser.uid,report]),"tp":FieldValue.serverTimestamp()]
            mlistUpdateData =  ["in1":report,"tp":FieldValue.serverTimestamp()]
        }
        var isFail = false
        let asyncGroup = DispatchGroup()
        asyncGroup.enter()
        groupRef.updateData(groupUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
            
        }
        asyncGroup.enter()
        mlistRef.updateData(mlistUpdateData){(err) in
            if err != nil{
                isFail = true
            }
            asyncGroup.leave()
        }
        asyncGroup.notify(queue: .main){
            completion(isFail)
        }
        
    }
    
}
