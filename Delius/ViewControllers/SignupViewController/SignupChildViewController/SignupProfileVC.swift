//
//  SignupProfileVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 06/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class SignupProfileVC: UIViewController {
    
    
    var userSex:Bool?
    var userBirth:Int?
    var fo1,fo2,fo3,fo4:Int?
    
    var profileAuthView:ProfileAuthView!
    
    var gesture:UILongPressGestureRecognizer!
    
    var imgArray=[UIImage]()
    var pressEnable : Bool = false
    
    
    
    var localPhoneView:LocalPhoneNumPickerView!
    var birthView:BirthPickerView!
    
    let info1Arr:[String] = String.SoloInfo1Array()
    let info2Arr:[String] = String.SoloInfo2Array()
    let info3Arr:[String] = String.SoloInfo3Array()
    let info4Arr:[String] = String.SoloInfo4Array()
    
    
    let screenView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.gray
        v.alpha = 0
        return v
    }()
    
    
    let yearArray = ["Year","1992","1993","1994","1995","1996","1997"]
    let monthArray = ["Month","1","2","3","4","5","6","7"]
    let dayArray = ["Day","1","2","3","4","5","6","7","8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.alpha = 0
        setView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
    }
    
    func setView(){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let subFrame = CGRect(x:0,y:0,width:view.frame.width,height:view.frame.height-topPadding - 60)
        profileAuthView = ProfileAuthView(frame: subFrame)
        
        
        view.addSubview(profileAuthView)
        profileAuthView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        profileAuthView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        profileAuthView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        profileAuthView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.addSubview(screenView)
        screenView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        screenView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        screenView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        screenView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        setProperty()
        
    }
    func setProperty(){
        profileAuthView.imageView.collectionView.delegate = self
        profileAuthView.imageView.collectionView.dataSource = self
        
        profileAuthView.birthBtmView.pickerView.delegate = self
        profileAuthView.birthBtmView.pickerView.dataSource = self
        gesture = UILongPressGestureRecognizer(target: self, action: #selector(gestureFunc(_:)))
        profileAuthView.imageView.collectionView.addGestureRecognizer(gesture)
        
        profileAuthView.sexBtmView.btn1.addTarget(self, action: #selector(sexFunc(_:)), for: .touchUpInside)
        profileAuthView.sexBtmView.btn2.addTarget(self, action: #selector(sexFunc(_:)), for: .touchUpInside)
        
        
        
        profileAuthView.info1BtmView.collectionViewTag.register(SoloTagCell.self, forCellWithReuseIdentifier: "AuthProfileTagCell1")
        profileAuthView.info2BtmView.collectionViewTag.register(SoloTagCell.self, forCellWithReuseIdentifier: "AuthProfileTagCell2")
        profileAuthView.info3BtmView.collectionViewTag.register(SoloTagCell.self, forCellWithReuseIdentifier: "AuthProfileTagCell3")
        profileAuthView.info4BtmView.collectionViewTag.register(SoloTagCell.self, forCellWithReuseIdentifier: "AuthProfileTagCell4")
        profileAuthView.info1BtmView.collectionViewTag.delegate = self
        profileAuthView.info2BtmView.collectionViewTag.delegate = self
        profileAuthView.info3BtmView.collectionViewTag.delegate = self
        profileAuthView.info4BtmView.collectionViewTag.delegate = self
        
        profileAuthView.info1BtmView.collectionViewTag.dataSource = self
        profileAuthView.info2BtmView.collectionViewTag.dataSource = self
        profileAuthView.info3BtmView.collectionViewTag.dataSource = self
        profileAuthView.info4BtmView.collectionViewTag.dataSource = self
        
        
        profileAuthView.nameView.textField.delegate = self
        profileAuthView.jobView.textField.delegate = self
        profileAuthView.statusView.textField.delegate = self
    }
    
    @objc func sexFunc(_ sender:UIButton){
        switch sender{
        case profileAuthView.sexBtmView.btn1:
            sender.backgroundColor = UIColor.gradientColor()[2]
            profileAuthView.sexBtmView.btn2.backgroundColor = UIColor.MainBlackColor3()
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (Timer) in
                self.profileAuthView.sexViewAnimation(reverse: true){
                    self.profileAuthView.sexView.inputLabel.text = "Man".localize()
                    self.userSex = true
                }
            }
        case profileAuthView.sexBtmView.btn2:
            sender.backgroundColor = UIColor.gradientColor()[2]
            profileAuthView.sexBtmView.btn1.backgroundColor = UIColor.MainBlackColor3()
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (Timer) in
                self.profileAuthView.sexViewAnimation(reverse: true){
                    self.profileAuthView.sexView.inputLabel.text = "Woman".localize()
                    self.userSex = false
                }
            }
        default:()
        }
    }
    
    @objc func gestureFunc(_ sender:UILongPressGestureRecognizer){
        let imgcollection = profileAuthView.imageView.collectionView
        switch(sender.state) {
        case .began:
            guard let selectedIndexPath = imgcollection.indexPathForItem(at: sender.location(in: imgcollection)) else {
                return
            }
            if selectedIndexPath.row == imgArray.count{
                return
            }
            if pressEnable{
                imgcollection.beginInteractiveMovementForItem(at: selectedIndexPath)
            }
        case .changed:
            imgcollection.updateInteractiveMovementTargetPosition(sender.location(in: sender.view!))
        case .ended:
            imgcollection.endInteractiveMovement()
            imgcollection.reloadData()
        default:
            imgcollection.cancelInteractiveMovement()
        }
    }
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        if collectionView == profileAuthView.imageView.collectionView{
            return true
        }else{
            return false
        }
    }
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if collectionView != profileAuthView.imageView.collectionView{
            return
        }
        let tmp = imgArray[sourceIndexPath.row]
        let dest = imgArray[destinationIndexPath.row]
        
        imgArray[sourceIndexPath.row] = dest
        imgArray[destinationIndexPath.row] = tmp
        collectionView.reloadData()
    }
    @objc func plusFunc(_ sender:UIButton){
        imagePick()
    }
    @objc func removeBtnClick(_ sender: UIButton)   {
        let imgcollection = profileAuthView.imageView.collectionView
        let hitPoint = sender.convert(CGPoint.zero, to: imgcollection)
        let hitIndex = imgcollection.indexPathForItem(at: hitPoint)
        
        self.imgArray.remove(at: (hitIndex?.row)!)
        if imgArray.count == 0{
            pressEnable = false
        }
        imgcollection.reloadData()
    }
}

extension SignupProfileVC:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePick(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .savedPhotosAlbum)!
        openPicker(imagePicker: imagePicker)
    }
    func checkPermission(){
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.profileAuthView.scrollView.isScrollEnabled = true
        picker.view.removeFromSuperview()
        picker.removeFromParent()
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            imgArray.append(image)
            profileAuthView.imageView.collectionView.reloadData()
        }
        
    }
    func openPicker(imagePicker:UIImagePickerController){
        
        imagePicker.view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imagePicker.view)
        imagePicker.view.topAnchor.constraint(equalTo: self.view.topAnchor,constant: view.frame.width/2 + 60).isActive = true
        imagePicker.view.leftAnchor.constraint(equalTo:self.view.leftAnchor).isActive = true
        imagePicker.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        imagePicker.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        self.profileAuthView.scrollView.setContentOffset(CGPoint(x:0,y:90), animated: true)
        self.profileAuthView.scrollView.isScrollEnabled = false
        self.view.layoutIfNeeded()
    }
}
extension SignupProfileVC:UICollectionViewDelegate{
    
}
extension SignupProfileVC:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == profileAuthView.imageView.collectionView{
            if imgArray.count > 5{
                return 5
            }else{
                if pressEnable{
                    return imgArray.count
                }else{
                    return imgArray.count + 1
                }
            }
        }else{
            switch collectionView{
            case profileAuthView.info1BtmView.collectionViewTag:
                return info1Arr.count
            case profileAuthView.info2BtmView.collectionViewTag:
                return info2Arr.count
            case profileAuthView.info3BtmView.collectionViewTag:
                return info3Arr.count
            case profileAuthView.info4BtmView.collectionViewTag:
                return info4Arr.count
            default:return 0
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == profileAuthView.imageView.collectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AuthProfileImageCell", for: indexPath) as! AddPlusCell
            if pressEnable == true{
                cell.startAnimate()
            }else{
                cell.stopAnimate()
            }
            cell.plusBtn.addTarget(self, action: #selector(plusFunc(_:)), for: .touchUpInside)
            cell.removeBtn.addTarget(self, action: #selector(removeBtnClick(_:)), for: .touchUpInside)
            if indexPath.row == imgArray.count{
                cell.profileImage.alpha = 0
                cell.plusBtn.alpha = 1
            }else{
                cell.plusBtn.alpha = 0
                cell.profileImage.alpha = 1
                cell.profileImage.image = imgArray[indexPath.row]
            }
            return cell
        }else{
            switch collectionView{
            case profileAuthView.info1BtmView.collectionViewTag:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AuthProfileTagCell1", for: indexPath) as! SoloTagCell
                cell.titleLabel.text = info1Arr[indexPath.row]
                return cell
            case profileAuthView.info2BtmView.collectionViewTag:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AuthProfileTagCell2", for: indexPath) as! SoloTagCell
                cell.titleLabel.text = info2Arr[indexPath.row]
                return cell
            case profileAuthView.info3BtmView.collectionViewTag:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AuthProfileTagCell3", for: indexPath) as! SoloTagCell
                cell.titleLabel.text = info3Arr[indexPath.row]
                return cell
            case profileAuthView.info4BtmView.collectionViewTag:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AuthProfileTagCell4", for: indexPath) as! SoloTagCell
                cell.titleLabel.text = info4Arr[indexPath.row]
                return cell
            default:
                let cell = UICollectionViewCell(frame: CGRect.zero)
                return cell
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == profileAuthView.imageView.collectionView{
            if indexPath.row == imgArray.count{
                return
            }
            if pressEnable{
                pressEnable = false
                collectionView.reloadData()
            }else{
                pressEnable = true
                collectionView.reloadData()
            }
        }else{
            switch collectionView{
            case profileAuthView.info1BtmView.collectionViewTag:
                profileAuthView.info1ViewAnimation(reverse: true, completion: {
                    self.fo1 = indexPath.row
                    self.profileAuthView.info1View.inputLabel.text = String.SoloInfo1Array()[indexPath.row]
                })
            case profileAuthView.info2BtmView.collectionViewTag:
                profileAuthView.info2ViewAnimation(reverse: true, completion: {
                    self.fo2 = indexPath.row
                    self.profileAuthView.info2View.inputLabel.text = String.SoloInfo2Array()[indexPath.row]
                })
            case profileAuthView.info3BtmView.collectionViewTag:
                profileAuthView.info3ViewAnimation(reverse: true, completion: {
                    self.fo3 = indexPath.row
                    self.profileAuthView.info3View.inputLabel.text = String.SoloInfo3Array()[indexPath.row]
                })
            case profileAuthView.info4BtmView.collectionViewTag:
                profileAuthView.info4ViewAnimation(reverse: true, completion: {
                    self.fo4 = indexPath.row
                    self.profileAuthView.info4View.inputLabel.text = String.SoloInfo4Array()[indexPath.row]
                })
            default:()
            }
        }
    }
}

extension SignupProfileVC:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return yearArray.count
        }else if component == 1{
            return monthArray.count
        }else{
            return dayArray.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return yearArray[row]
        }else if component == 1{
            return monthArray[row]
        }else{
            return dayArray[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var year = 0
        var month = 0
        var day = 0
        
        let yearRow = pickerView.selectedRow(inComponent: 0)
        let monthRow = pickerView.selectedRow(inComponent: 1)
        let dayRow = pickerView.selectedRow(inComponent: 2)
        if yearRow == 0{
            return
        }else{
            year = Int(yearArray[yearRow])!
        }
        if monthRow == 0{
            return
        }else{
            month = Int(monthArray[monthRow])!
        }
        if dayRow == 0{
           return
        }else{
            day = Int(dayArray[dayRow])!
        }
        self.userBirth = year*10000 + month*100 + day
        profileAuthView.birthViewAnimation(reverse: true){
            self.profileAuthView.ageView.inputLabel.text = CalculateAge.CalculateAgeFromBirth(Year: year, Month: month, Day: day)
        }
        
    }
}
extension SignupProfileVC:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
