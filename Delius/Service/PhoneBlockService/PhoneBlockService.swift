//
//  PhoneBlockService.swift
//  Delius
//
//  Created by user on 2020/08/05.
//  Copyright © 2020 정윤환. All rights reserved.
//
import FirebaseFirestore
import FirebaseAuth
class PhoneBlockService:PhoneBlock{
    
    var delegate:PhoneBlockDelegate!
    
    override init() {
        super.init()
        
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        guard let user = Auth.auth().currentUser else { return }
        blockListener = db?.collection("pb").document(user.uid).collection("pblist").addSnapshotListener({ (snapshot, err) in
            if (err != nil){
                return
            }
            
            snapshot!.documentChanges.forEach{ diff in
                let data = PhoneBlockDictionary(dictionary: diff.document.data())
                if (diff.type == .added){
                    self.blockedUsers.append(data)
                    self.delegate.reloadCollectionView()
                }
                if (diff.type == .modified){
                }
                if (diff.type == .removed){
                    
                }
            }
        })
    }
    func uploadBlockUser(name:String,phoneNumber:String){
        guard let user = Auth.auth().currentUser else { return }
        
        let ref = db.collection("pb").document(user.uid).collection("pblist").document()
        let uploadData : [String:Any] = ["na":name,"ph":phoneNumber,"uid":user.uid,"tp":FieldValue.serverTimestamp()]
        ref.setData(uploadData) { (err) in
            if (err != nil){
                self.delegate.complete(success: false)
                return
            }
            self.delegate.complete(success: true)
            return
        }
    }
}
