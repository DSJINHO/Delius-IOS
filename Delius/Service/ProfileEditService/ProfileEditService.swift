//
//  ProfileEditService.swift
//  Delius
//
//  Created by user on 2020/07/23.
//  Copyright © 2020 정윤환. All rights reserved.
//


import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFunctions
import FirebaseStorage
class ProfileEditService:ProfileEdit{
    init(userData:UserStruct){
        super.init()
        
//        let settings = FirestoreSettings()
//        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        functions = Functions.functions()
        
        
        self.formerData = userData
        self.ex = userData.ex
        self.fo1 = userData.fo1
        self.fo2 = userData.fo2
        self.fo3 = userData.fo3
        self.fo4 = userData.fo4
        self.st = userData.st
        self.job = userData.job
        self.formerImgArray = CreateThumbUrl.allImages(imgObjs: userData.im!)
        self.imgArray = formerImgArray
        
        if let im = userData.im{
            let urlArr = CreateThumbUrl.allImgUrls(uid: userData.uid!, imgObjs: im)
            for url in urlArr{
                self.totalImgArr.append(newImgStruct(url: url))
            }
        }
    }
    func checkUploadImages(imgObjs:[[String:UIImage]],completion:@escaping(Bool)->Void){
//        var willUploadImgs = [UIImage]()
//        var willUploadImgDatas = [imgStruct]()
//        var new:Bool = false
//        if self.formerImgArray == imgArray{
//            self.uploadImgObjs = self.formerData?.im! as! [imgStruct]
//            completion(true)
//            return
//        }
//        guard let array = self.imgArray else { completion(false); return }
//        print(formerData!.im,"imgStruct")
//        guard let imgDatas = formerData?.im else { completion(false); return }
//        var i = 0
//        for imgString in array{
//            if !(self.formerImgArray?.contains(imgString))!{
//                if let uploadImgObj = imgObjs.first(where: {$0.keys.contains(imgString)}){
//                    if let img = uploadImgObj[imgString] as? UIImage{
//                        if i == 0{
//                            new = true
//                        }
//                        willUploadImgs.append(img)
//                    }
//                }
//            }else{
//                if let img = imgDatas.first(where: {$0.imgNa == imgString}){
//                    if i == 0{
//                        img.isMain = "true"
//                    }else{
//                        img.isMain = "false"
//                    }
//                    willUploadImgDatas.append(img)
//                }
//            }
//            i+=1
//        }
//        self.uploadImgObjs = willUploadImgDatas
//        self.newImgs = willUploadImgs
//        self.newUpload = new
//        completion(true)
    }
    func firestoreWork(imgObjs:[imgStruct],newImgs:[UIImage],newMain:Bool,completion:@escaping(Bool)->Void){
        var im = [[String:Any]]()
        for i in imgObjs{
            let obj:[String:Any] = ["imgNa":i.imgNa!,"tp":i.tp!,"isMain":i.isMain]
            im.append(obj)
        }
        let uid = Auth.auth().currentUser?.uid
        let ref = db.collection("user1").document(uid!).collection("user2").document(uid!)
        let willData:[String:Any] = ["fo1":self.fo1,"fo2":self.fo2,"fo3":self.fo3,"fo4":self.fo4,"job":self.job,"st":self.st,"ex":self.ex,"im":im]
        ref.updateData(willData){(err) in
            if err != nil{
                completion(false)
                return
            }
            completion(true)
        }
    }
    func uploadMultipleImages(imgs:[UIImage],new:Bool,completion:@escaping([Int])->Void){
        var failArray=[Int]()
        var i = 0
        let userId = Auth.auth().currentUser?.uid
        let dispatchGroup = DispatchGroup()
        let dispatchQueue = DispatchQueue(label: "imageUploadQueue")
        let dispatchSemaphore = DispatchSemaphore(value: 0)
        dispatchQueue.async{
            for img in imgs{
                dispatchGroup.enter()
                let imgName = UUID().uuidString
                let storeageRef =  Storage.storage(url:"gs://delius-original").reference().child("profile").child(userId!).child(imgName)
                if let uploadData = img.pngData(){
                    let metadata = StorageMetadata()
                    var ismain = "false"
                    if i == 0 { if new { ismain = "true" } }
                    metadata.contentType = "image/jpg"
                    metadata.customMetadata = ["uid":userId!,"isMain":String(ismain)]
                    storeageRef.putData(uploadData,metadata: metadata){(metaData,err) in
                        if err != nil{
                            failArray.append(i)
                        }
                        i+=1
                        dispatchSemaphore.signal()
                        dispatchGroup.leave()
                    }
                    dispatchSemaphore.wait()
                }
            }
        }
        dispatchGroup.notify(queue: dispatchQueue) {
            DispatchQueue.main.async {
                completion(failArray)
            }
        }
    }
}
