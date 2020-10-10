//
//  CheckUserAccountVC.swift
//  Delius
//
//  Created by user on 2020/07/27.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
class CheckUserAccountVC:UIViewController{
    
    var db:Firestore!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setup()
        
        
    }
    private func setup(){
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        let indicator = ShowMainIndicator(viewController: self)
        indicator.ShowIndicator()
        
        guard let user = Auth.auth().currentUser else { return }
        
        let ref = db.collection("si1").document(user.uid).collection("si2").document("step")
        ref.getDocument{(doc,err) in
            if err != nil{
                indicator.removeIndicator {
                    
                }
                return
            }
            guard let document = doc, document.exists else {
                indicator.removeIndicator {
                    
                }
                return
            }
            guard let data = document.data() else {
                indicator.removeIndicator {
                    
                }
                return
                
            }
            let signupData = SignupStepStruct(dictionary: data)
            let type = signupData.ind
            
            if type == 10{
                
                indicator.removeIndicator {
                    let vc = SignupVC()
                    vc.setView(type: "email")
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: false, completion: {})
                    return
                }
            }
            if type == 20{
                indicator.removeIndicator {
                    let vc = SignupVC()
                    vc.setView(type: "profile")
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: false, completion: {})
                    return
                }
            }
            if type == 30{
                indicator.removeIndicator {
                    let vc = SignupVC()
                    vc.setView(type: "listener")
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: false, completion: {})
                    return
                }
            }
            if type == 40{
                indicator.removeIndicator {
                    let vc = RootVC()
                    UserDefaults.standard.set("signupCompleted",forKey: user.uid)
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: false, completion: {})
                    return
                }
            }
            if type == 50{
                indicator.removeIndicator {
                    let vc = SignupVC()
                    vc.setView(type: "listener")
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: false, completion: {})
                    return
                }
            }
        }
        
    }
}
