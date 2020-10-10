//
//  SoloProfileVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/08.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SoloProfileVC:UIViewController{
    var contentView:SoloProfileDetailView!
    
    
    
    var userInfo:UserStruct?
    var imgArray = [[String]]()
    var imgUrls = [URL]()
    var tagArray = [String]()
    
    
    var detailUser:MainListStruct!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        contentView.OpenAnimation()
    }
    private func setup(){
        contentView = SoloProfileDetailView(frame:view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.tagArray = tagArray
        
        contentView.imgCollectionView.delegate = self
        contentView.imgCollectionView.dataSource = self
        contentView.tagCollectionView.delegate = self
        contentView.tagCollectionView.dataSource = self
        
        contentView.imgCollectionView.register(SoloProfileImageCell.self, forCellWithReuseIdentifier: "SoloDetailImageCellid")
        contentView.tagCollectionView.register(MainTagCell.self, forCellWithReuseIdentifier: "SoloDetailTagCellid")
        
        contentView.closeBtn.addTarget(self, action: #selector(closeBtnFunc(_:)), for: .touchUpInside)
        contentView.editBtn.addTarget(self, action: #selector(editBtnFunc(_:)), for: .touchUpInside)
    }
    func setData(){
        guard let userData = userInfo else { return }
        if let name = userData.na {
            contentView.nameLabel.text = name
            if let age = userData.bt {
                let year = floorf(Float(age/10000))
                let month = floorf(Float(age)/100 - year*100)
                let day = floorf(Float(age) - year*10000 - month*100)
                let ageStr = CalculateAge.CalculateAgeFromBirth(Year: Int(year), Month: Int(month), Day: Int(day))
                contentView.nameLabel.text = "\(name), \(ageStr)"
            }
        }
        tagArray.append("1km")
        if let im = userData.im {
            let urls = CreateThumbUrl.allImgUrls(uid: userData.uid!, imgObjs: im)
            self.imgUrls = urls
        }
        if let status = userData.st {
            contentView.statusLabel.text = status
        }
        if let ex = userData.ex {
            contentView.extraLabel.text = ex
        }
        if let job = userData.job {
            tagArray.append(job)
        }
        if let fo1 = userData.fo1 {
            tagArray.append(String.SoloInfo1Array()[fo1])
        }
        if let fo2 = userData.fo2 {
            tagArray.append(String.SoloInfo2Array()[fo2])
        }
        if let fo3 = userData.fo3 {
            tagArray.append(String.SoloInfo3Array()[fo3])
        }
        if let fo4 = userData.fo4 {
            tagArray.append(String.SoloInfo4Array()[fo4])
        }
        
        contentView.tagArray = self.tagArray
        
        contentView.tagCollectionView.reloadData()
        contentView.imgCollectionView.reloadData()
    }
    @objc func editBtnFunc(_ sender:UIButton){
        return
        
//        contentView.closeAnimation {
//            self.updateTimer.removeTimer()
//
//            weak var pvc = self.presentingViewController
//            self.dismiss(animated: false, completion: {
//                let buyController = ShowBuyDeliVC(viewController: pvc!)
//                buyController.ShowIndicator()
//            })
//        }
        guard var pvc = self.presentingViewController else { return }
        self.dismiss(animated: false, completion: {
            let presentController = ShowProfileEdit(viewController: pvc,userData: self.userInfo!)
            presentController.ShowIndicator()
        })
    }
    @objc func closeBtnFunc(_ sender:UIButton){
        contentView.closeAnimation {
            self.dismiss(animated: false, completion: {
                self.removeFromParent()
                self.view.removeFromSuperview()
            })
        }
    }
}
extension SoloProfileVC:UICollectionViewDelegate{
    
}
extension SoloProfileVC:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == contentView.imgCollectionView{
            return imgUrls.count
        }else{
            return tagArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == contentView.imgCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SoloDetailImageCellid", for: indexPath) as! SoloProfileImageCell
            
            cell.imgView.sd_setImage(with: imgUrls[indexPath.row])
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SoloDetailTagCellid", for: indexPath) as! MainTagCell
            switch indexPath.row{
            case 0:cell.imgView.image = UIImage(named: "LocationTag")
            case 1:cell.imgView.image = UIImage(named:"JobTag")
            default:cell.imgView.image = UIImage(named: "HashTag")
            }
            cell.titleLabel.text = tagArray[indexPath.row]
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == contentView.imgCollectionView{
            let width = collectionView.frame.width
            return CGSize(width:width,height:width)
        }else{
            return CGSize.zero
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.reloadData()
    }
}
