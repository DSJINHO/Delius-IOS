//
//  SignupService.swift
//  Delius
//
//  Created by 정윤환 on 2020/06/10.
//  Copyright © 2020 정윤환. All rights reserved.
//

import Firebase
import UIKit
import FirebaseAuth
import FirebaseFunctions
import FirebaseFirestore
import FirebaseStorage
import CoreLocation

class SignupService:Signup{
    
    var delegate:signupServiceDelegate!
    
    
    override init(){
        super.init()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        functions = Functions.functions()
        
        
        if let fcmToken = UserDefaults.standard.string(forKey: "fcmToken"){
            self.tk = fcmToken
        }else{
            self.tk = ""
        }
    }
    
    func emailLogin(email:String,password:String,completion:@escaping([String:Any])->Void){
        Auth.auth().signIn(withEmail: email, password: password){(user,err) in
            if err == nil{
                self.checkUserSignupStep(ph:"1"){(result) in
                    completion(result)
                }
            }else{
                if let errCode = AuthErrorCode(rawValue: err!._code){
                    switch errCode{
                    case .invalidEmail:completion(["type":"invalidEmail"])
                    case .userDisabled:completion(["type":"userDisabled"])
                    case .wrongPassword:completion(["type":"wrongPassword"])
                    default:completion(["type":"etc"])
                    }
                }else{
                    completion(["type":"etc"])
                }
            }
        }
    }
    private func checkUserSignupStep(ph:String,completion:@escaping([String:Any])->Void){
        functions.httpsCallable("LoginFunction").call(["ph":ph]) { (result, error) in
          if let error = error as NSError? {
            print("*****")
            print(error)
            print(error.localizedDescription)
            completion(["type":"err","err":error])
          }
          if let resultData = (result?.data as? [String: Any]) {
            completion(resultData)
          }
        }

    }
    func sendVerifyNumber(phoneNumber ph:String,completion:@escaping(Bool)->Void){
        
        let phoneNumber = ph
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate:nil) {
            verificationID, error in
            if ((error) != nil) {
                print("@@@@")
                completion(false)
                return
            }else{
                self.userPhone = ph
                self.verifiedID = verificationID
                completion(true)
            }
        }
    }
    func signinByPhoneNumber(verifyNumber Num:String,completion:@escaping([String:Any])->Void){
        if self.verifiedID == nil{
            print("####")
            completion(["type":"err"])
            return
        }
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.verifiedID! ,verificationCode: Num)
        Auth.auth().signIn(with: credential){
            (authData,error) in
            if error != nil{
                print(error)
                print("&&&&&&")
                completion(["type":"err"])
            }else{
                Auth.auth().currentUser?.updatePhoneNumber(credential, completion: nil)
                self.user = Auth.auth().currentUser!
                print(self.userPhone!,"!!!")
                self.checkUserSignupStep(ph: self.userPhone!){(result) in
                    completion(result)
                }
            }
        }
    }
    
    
    func linkWithEmail(email:String,password:String,completion:@escaping([String:Any])->Void){
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        guard let currentUser = self.user else{ return }
        currentUser.link(with: credential){(authResult,err)in
            if err != nil{
                completion(["type":"err"])
                return
            }
            self.updateEmail(email: email){(result) in
                completion(result)
            }
        }
    }
    

    private func updateEmail(email:String,completion:@escaping([String:Any])->Void){
        functions.httpsCallable("EmailLink").call(["em":email]) { (result, error) in
          if let error = error as NSError? {
            completion(["type":"err"])
          }
          if let resultData = (result?.data as? [String: Any]) {
            completion(resultData)
          }
        }
    }
    func httpsCreateProfile(completion:@escaping([String:Any])->Void){
        let requestData : [String:Any] = ["bt":self.bt!,
                                          "fo1":self.fo1!,
                                          "fo2":self.fo2!,
                                          "fo3":self.fo3!,
                                          "fo4":self.fo4!,
                                          "job":self.job!,
                                          "lc":self.lc!,
                                          "lo1":self.lo1!,
                                          "lo2":self.lo2!,
                                          "na":self.na!,
                                          "st":self.st!,
                                          "sx":self.sx!,
                                          "tk":self.tk!]
        functions.httpsCallable("ProfileSignup").call(requestData) { (result, error) in
          if let error = error as NSError? {
            completion(["type":"err"])
          }
          if let resultData = (result?.data as? [String: Any]) {
            completion(resultData)
          }
            
        }
        
    }
    func verifyUID(){
        if let signupUser = Auth.auth().currentUser{
            self.uid = signupUser.uid
        }
    }
    var uploadImgOrder:Int = 0
    func uploadMultipleImages(imgs:[UIImage],completion:@escaping([Int])->Void){
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
                let bucketNum = Int.random(in: 1..<11)
                let bucketName = "delius-\(bucketNum)"
                let storeageRef =  Storage.storage(url:"gs://\(bucketName)").reference().child("profile").child(userId!).child(imgName)
                if let uploadData = img.pngData(){
                    let metadata = StorageMetadata()
                    let ismain = img == imgs[0]
                    metadata.contentType = "image/jpg"
                    metadata.customMetadata = ["uid":userId!,"isMain":String(ismain),"bucket":bucketName]
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
    func uploadImage(img:UIImage,imgName:String,completion:@escaping(Bool)->Void){
        
        let storeageRef = Storage.storage().reference().child("profile").child(uid!)
        if let uploadData = img.pngData(){
            let metadata = StorageMetadata()
            storeageRef.putData(uploadData,metadata: nil){(metaData,err) in
                if err != nil{
                    completion(false)
                    return
                }
                completion(true)
            }
        }
    }
    
    func setListener(){
        
        let uid = Auth.auth().currentUser?.uid
        self.SignupListener = db.collection("si1").document(uid!).collection("si2").document("step").addSnapshotListener({ (snapshot, err) in
            if (err != nil){
                self.delegate?.wait40Listener(ind:0)
                self.SignupListener.remove()
                return
            }
            guard let document = snapshot, document.exists else { self.delegate?.wait40Listener(ind:0);self.SignupListener.remove();return}
            
            if let ind = document["ind"] as? Int{
                if ind == 40{
                    self.delegate?.wait40Listener(ind: 40)
                    self.SignupListener.remove()
                    return
                }
                if ind == 50{
                    self.delegate?.wait40Listener(ind: 50)
                    self.SignupListener.remove()
                    return
                }
            }
            
        })
    }

}
