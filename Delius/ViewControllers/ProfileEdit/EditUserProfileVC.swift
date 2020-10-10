//
//  EditUserProfileVC.swift
//  Delius
//
//  Created by 박진호 on 2020/07/07.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class EditUserProfileVC:UIViewController{
    
    var service:ProfileEditService!
    var userData:UserStruct?
    
    var contentView:EditUserProfileView!
    var imgArray=[[String:String]]()
    let info1Arr = String.SoloInfo1Array()
    let info2Arr = String.SoloInfo2Array()
    let info3Arr = String.SoloInfo3Array()
    let info4Arr = String.SoloInfo4Array()
    var imgUrls = [URL]()
    
    var pressEnable = false
    var newImages = [[String:UIImage]]()
    
    
    
    
    var longGesture:UILongPressGestureRecognizer!
    var shortGesture:UIPanGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setData()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    private func setup(){
        contentView = EditUserProfileView(frame: view.bounds, x: "")
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.backBtn.addTarget(self, action: #selector(backBtnFunc(_:)), for: .touchUpInside)
        
        contentView.imgView.collectionView.register(AddPlusCell.self, forCellWithReuseIdentifier: "ProfileEditImagesCellid")
        contentView.info1BtmView.collectionViewTag.register(SoloTagCell.self, forCellWithReuseIdentifier: "ProfileEditTagCellid1")
        contentView.info2BtmView.collectionViewTag.register(SoloTagCell.self, forCellWithReuseIdentifier: "ProfileEditTagCellid2")
        contentView.info3BtmView.collectionViewTag.register(SoloTagCell.self, forCellWithReuseIdentifier: "ProfileEditTagCellid3")
        contentView.info4BtmView.collectionViewTag.register(SoloTagCell.self, forCellWithReuseIdentifier: "ProfileEditTagCellid4")
        
        contentView.imgView.collectionView.delegate = self
        contentView.imgView.collectionView.dataSource = self
        
        contentView.info1BtmView.collectionViewTag.dataSource = self
        contentView.info1BtmView.collectionViewTag.delegate = self
        contentView.info2BtmView.collectionViewTag.delegate = self
        contentView.info2BtmView.collectionViewTag.dataSource = self
        contentView.info3BtmView.collectionViewTag.dataSource = self
        contentView.info3BtmView.collectionViewTag.delegate = self
        contentView.info4BtmView.collectionViewTag.delegate = self
        contentView.info4BtmView.collectionViewTag.dataSource = self
        
        
        contentView.statusView.textField.delegate = self
        contentView.jobView.textField.delegate = self
        contentView.extraView.textField.delegate = self
        
        contentView.scrollView.delegate = self
        
        contentView.info1View.InputView.addTarget(self, action: #selector(infoBtnFunc(_:)), for: .touchUpInside)
        contentView.info2View.InputView.addTarget(self, action: #selector(infoBtnFunc(_:)), for: .touchUpInside)
        contentView.info3View.InputView.addTarget(self, action: #selector(infoBtnFunc(_:)), for: .touchUpInside)
        contentView.info4View.InputView.addTarget(self, action: #selector(infoBtnFunc(_:)), for: .touchUpInside)
        
        contentView.completeBtn.addTarget(self, action: #selector(completeBtnFunc(_:)), for: .touchUpInside)
        
        longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longGestureFunc(_:)))
        shortGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureFunc(_:)))
        contentView.imgView.collectionView.addGestureRecognizer(longGesture)
        contentView.imgView.collectionView.addGestureRecognizer(shortGesture)
        
    }
    private func setData(){
        guard let user = userData else { return }
        service = ProfileEditService(userData: user)
        if let im = user.im{
            let urls = CreateThumbUrl.allImgUrls(uid: user.uid!, imgObjs: im)
            self.imgUrls = urls
        }
        if let status = user.st{
            contentView.statusView.textField.text = status
        }
        if let job = user.job{
            contentView.jobView.textField.text = job
        }
        if let fo1 = user.fo1 {
            contentView.info1View.inputLabel.text = String.SoloInfo1Array()[fo1]
            contentView.info1BtmView.collectionViewTag.selectItem(at: IndexPath(row: fo1, section: 0), animated: false, scrollPosition: .top)
        }
        if let fo2 = user.fo2 {
            contentView.info2View.inputLabel.text = String.SoloInfo2Array()[fo2]
            contentView.info2BtmView.collectionViewTag.selectItem(at: IndexPath(row: fo2, section: 0), animated: false, scrollPosition: .top)
        }
        if let fo3 = user.fo3 {
            contentView.info3View.inputLabel.text = String.SoloInfo3Array()[fo3]
            contentView.info3BtmView.collectionViewTag.selectItem(at: IndexPath(row: fo3, section: 0), animated: false, scrollPosition: .top)
        }
        if let fo4 = user.fo4 {
            contentView.info4View.inputLabel.text = String.SoloInfo4Array()[fo4]
            contentView.info4BtmView.collectionViewTag.selectItem(at: IndexPath(row: fo4, section: 0), animated: false, scrollPosition: .top)
        }
        if let ex = user.ex{
            contentView.extraView.textField.text = ex
        }
        contentView.imgView.collectionView.reloadData()
    }
    @objc func longGestureFunc(_ sender:UILongPressGestureRecognizer){
        let imgCollection = contentView.imgView.collectionView
        switch sender.state {
        case .began:
            if !pressEnable{
                pressEnable = true
                imgCollection.reloadData()
            }
        case .changed:()
        case .ended:()
        default:()
        }
    }
    @objc func panGestureFunc(_ sender:UIPanGestureRecognizer){
        let imgCollection = contentView.imgView.collectionView
        switch sender.state{
        case .began:
            guard let selectedIndexPath = imgCollection.indexPathForItem(at: sender.location(in: imgCollection)) else { return }
            if selectedIndexPath.row == service.totalImgArr.count{
                return
            }
            if pressEnable{
                imgCollection.beginInteractiveMovementForItem(at: selectedIndexPath)
            }
        case .changed:
            imgCollection.updateInteractiveMovementTargetPosition(sender.location(in: sender.view!))
        case .ended:
            imgCollection.endInteractiveMovement()
            imgCollection.reloadData()
        default:
            imgCollection.cancelInteractiveMovement()
        }
    }
    @objc func infoBtnFunc(_ sender:UIButton){
        switch sender{
        case contentView.info1View.InputView:
            contentView.info1ViewAnimation(reverse: false, completion: {})
        case contentView.info2View.InputView:
            contentView.info2ViewAnimation(reverse: false, completion: {})
        case contentView.info3View.InputView:
            contentView.info3ViewAnimation(reverse: false, completion: {})
        case contentView.info4View.InputView:
            contentView.info4ViewAnimation(reverse: false, completion: {})
        default:()
        }
    }
    @objc func backBtnFunc(_ sender:UIButton){
        if service.isChanged{
            ShowAlert.OnlyDefault(vc: self, title: "", message: "수정사항저장 안할꺼?")
        }else{
            dismiss(animated: true, completion: {})
        }
    }
    
    @objc func removeBtnClick(_ sender: UIButton)   {
        let imgcollection = contentView.imgView.collectionView
        let hitPoint = sender.convert(CGPoint.zero, to: imgcollection)
        let hitIndex = imgcollection.indexPathForItem(at: hitPoint)
        
        self.service.totalImgArr.remove(at: hitIndex!.row)
        if service.totalImgArr.count == 0{
            pressEnable = false
        }
        imgcollection.reloadData()
    }
    @objc func plusFunc(_ sender:UIButton){
        showPicker(restImgCount: 5 - service.totalImgArr.count)
//        imagePick()
    }
    private func validateData()->Bool{
        if contentView.extraView.textField.text == nil || contentView.extraView.textField.text?.count == 0{
            ShowAlert.OnlyDefault(vc: self, title: "", message: "Extra")
            return false
        }else{
            self.service.ex = contentView.extraView.textField.text!
        }
        if contentView.jobView.textField.text == nil || contentView.jobView.textField.text?.count == 0{
            ShowAlert.OnlyDefault(vc: self, title: "", message: "Job")
            return false
        }else{
            self.service.job = contentView.jobView.textField.text!
        }
        if contentView.statusView.textField.text == nil || contentView.statusView.textField.text?.count == 0 {
            ShowAlert.OnlyDefault(vc: self, title: "", message: "Status")
            return false
        }else{
            self.service.st = contentView.statusView.textField.text!
        }
        
        return true
    }
    @objc func completeBtnFunc(_ sender:UIButton){
        if !validateData(){
            return
        }
        let controller = ShowMainIndicator(viewController: self)
        controller.ShowIndicator()
        service.checkUploadImages(imgObjs: newImages,completion: {(success) in
            if success{
                self.service.firestoreWork(imgObjs: self.service.uploadImgObjs, newImgs: self.service.newImgs, newMain: self.service.newUpload, completion: {(success) in
                    if success{
                        if self.service.newImgs.count == 0 {
                            controller.removeIndicator {
                                self.dismiss(animated: true, completion: {})
                            }
                        }
                        self.service.uploadMultipleImages(imgs: self.service.newImgs, new: self.service.newUpload, completion: {(fail) in
                            if fail.count == 0{
                                controller.removeIndicator {
                                    self.dismiss(animated: true, completion: {})
                                }
                            }else{
                                controller.removeIndicator {
                                    ShowAlert.OnlyDefault(vc: self, title: "error", message: "error")
                                }
                            }
                        })
                    }else{
                        controller.removeIndicator {
                            ShowAlert.OnlyDefault(vc: self, title: "error", message: "error")
                        }
                    }
                })
            }else{
                controller.removeIndicator {
                    ShowAlert.OnlyDefault(vc: self, title: "Error", message: "Error")
                }
            }
        })
    }
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        if collectionView == contentView.imgView.collectionView{
            return true
        }else{
            return false
        }
    }
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if collectionView != contentView.imgView.collectionView{
            return
        }
        let tmp = service.totalImgArr[sourceIndexPath.row]
        let dest = service.totalImgArr[destinationIndexPath.row]
        
        service.totalImgArr[sourceIndexPath.row] = dest
        service.totalImgArr[destinationIndexPath.row] = tmp
        collectionView.reloadData()
    }
    private func showPicker(restImgCount:Int){
    }
}
extension EditUserProfileVC:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == contentView.statusView.textField{
            service.st = textField.text
        }
        if textField == contentView.jobView.textField{
            service.job = textField.text
        }
        if textField == contentView.extraView.textField{
            service.ex = textField.text
        }
        service.isChanged = service.checkChangedData()
        textField.resignFirstResponder()
        return true
    }
}
extension EditUserProfileVC:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePick(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        openPicker(imagePicker: imagePicker)
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.view.removeFromSuperview()
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            let imgName = UUID().uuidString
            let random = Int.random(in: 1..<11)
            let bucketName = "delius-\(random)"
            service.totalImgArr.append(newImgStruct(imgName: imgName, bucket: bucketName, img: image))
            contentView.imgView.collectionView.reloadData()
        }
    }
    func openPicker(imagePicker:UIImagePickerController){
        
        imagePicker.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imagePicker.view)
        imagePicker.view.topAnchor.constraint(equalTo: self.view.topAnchor,constant: view.frame.width/2 + 60).isActive = true
        imagePicker.view.leftAnchor.constraint(equalTo:self.view.leftAnchor).isActive = true
        imagePicker.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        imagePicker.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.contentView.scrollView.setContentOffset(CGPoint(x:0,y:0), animated: true)
        self.contentView.scrollView.isScrollEnabled = false
        self.view.layoutIfNeeded()
    }
}
extension EditUserProfileVC:UICollectionViewDelegate{
    
}
extension EditUserProfileVC:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == contentView.imgView.collectionView{
            if service.totalImgArr.count >= 5{
                return 5
            }else{
                if pressEnable{
                    return service.totalImgArr.count
                }else{
                    return service.totalImgArr.count + 1
                }
            }
        }else{
            switch collectionView{
            case contentView.info1BtmView.collectionViewTag:
                return info1Arr.count
            case contentView.info2BtmView.collectionViewTag:
                return info2Arr.count
            case contentView.info3BtmView.collectionViewTag:
                return info3Arr.count
            case contentView.info4BtmView.collectionViewTag:
                return info4Arr.count
            default:return 0
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == contentView.imgView.collectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileEditImagesCellid", for: indexPath) as! AddPlusCell
            if pressEnable == true{
                cell.startAnimate()
            }else{
                cell.stopAnimate()
            }
            cell.plusBtn.addTarget(self, action: #selector(plusFunc(_:)), for: .touchUpInside)
            cell.removeBtn.addTarget(self, action: #selector(removeBtnClick(_:)), for: .touchUpInside)
            
            if indexPath.row == service.totalImgArr.count{
                cell.profileImage.alpha = 0
                cell.plusBtn.alpha = 1
            }else{
                cell.plusBtn.alpha = 0
                cell.profileImage.alpha = 1
                if let newImg = service.totalImgArr[indexPath.row].img{
                    cell.profileImage.image = newImg
                    return cell
                }
                if let existedUrl = service.totalImgArr[indexPath.row].url{
                    cell.profileImage.sd_setImage(with: existedUrl)
                }
            }
            return cell
        }else{
            switch collectionView{
            case contentView.info1BtmView.collectionViewTag:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileEditTagCellid1", for: indexPath) as! SoloTagCell
                cell.titleLabel.text = info1Arr[indexPath.row]
                return cell
            case contentView.info2BtmView.collectionViewTag:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileEditTagCellid2", for: indexPath) as! SoloTagCell
                cell.titleLabel.text = info2Arr[indexPath.row]
                return cell
            case contentView.info3BtmView.collectionViewTag:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileEditTagCellid3", for: indexPath) as! SoloTagCell
                cell.titleLabel.text = info3Arr[indexPath.row]
                return cell
            case contentView.info4BtmView.collectionViewTag:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileEditTagCellid4", for: indexPath) as! SoloTagCell
                cell.titleLabel.text = info4Arr[indexPath.row]
                return cell
            default:
                let cell = UICollectionViewCell(frame: CGRect.zero)
                return cell
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == contentView.imgView.collectionView{
            if indexPath.row == service.totalImgArr.count{
                return
            }
        }else{
            switch collectionView{
            case contentView.info1BtmView.collectionViewTag:
                contentView.info1ViewAnimation(reverse: true, completion: {
                    self.service.fo1 = indexPath.row
                    self.contentView.info1View.inputLabel.text = String.SoloInfo1Array()[indexPath.row]
                })
            case contentView.info2BtmView.collectionViewTag:
                contentView.info2ViewAnimation(reverse: true, completion: {
                    self.service.fo2 = indexPath.row
                    self.contentView.info2View.inputLabel.text = String.SoloInfo2Array()[indexPath.row]
                })
            case contentView.info3BtmView.collectionViewTag:
                contentView.info3ViewAnimation(reverse: true, completion: {
                    self.service.fo3 = indexPath.row
                    self.contentView.info3View.inputLabel.text = String.SoloInfo3Array()[indexPath.row]
                })
            case contentView.info4BtmView.collectionViewTag:
                contentView.info4ViewAnimation(reverse: true, completion: {
                    self.service.fo4 = indexPath.row
                    self.contentView.info4View.inputLabel.text = String.SoloInfo4Array()[indexPath.row]
                })
            default:()
            }
        }
    }
    
    
}
extension EditUserProfileVC:UIScrollViewDelegate{
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if pressEnable{
            pressEnable = false
            contentView.imgView.collectionView.reloadData()
        }
    }
}
