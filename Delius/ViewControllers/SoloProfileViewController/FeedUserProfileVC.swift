//
//  FeedUserProfileVC.swift
//  Delius
//
//  Created by 박진호 on 2020/07/07.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class FeedUserProfileVC:UIViewController{
    var contentView:FeedUserProfileView!
    var userInfo:SoloStruct?
    var imgArray = [UIImage]()
    var tagArray = [String]()
    
    var imgUrls = [URL]()
    
    var detailUser:MainListStruct!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        setup()
        print("viewDidLoad")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        contentView.OpenAnimation()
        print("viewDidAppear")
    }
    private func setup(){
        contentView = FeedUserProfileView(frame:view.bounds)
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
        
        contentView.likeBtn.addTarget(self, action: #selector(likeBtnFunc(_:)), for: .touchUpInside)
        contentView.deliBtn.addTarget(self, action: #selector(deliBtnFunc(_:)), for: .touchUpInside)
        contentView.rejectBtn.addTarget(self, action: #selector(rejectBtnFunc(_:)), for: .touchUpInside)
        contentView.closeBtn.addTarget(self, action: #selector(closeBtnFunc(_:)), for: .touchUpInside)
        
        setData()
        
    }
    func setData(){
        
        guard let soloData = detailUser else { return }
        guard let userData = soloData.soloStruct else { return }

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
        if let im = userData.im{
            let urls = CreateThumbUrl.allImgUrls(uid: userData.uid!, imgObjs: im)
            self.imgUrls = urls
        }
        tagArray.append("1km")
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
    }
    @objc func rejectBtnFunc(_ sender:UIButton){
        
    }
    @objc func likeBtnFunc(_ sender:UIButton){
        print("clicked")
        
    }
    @objc func deliBtnFunc(_ sender:UIButton){
        contentView.closeAnimation {
            self.dismiss(animated: false, completion: {
                self.view.removeFromSuperview()
            })
        }
        
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
extension FeedUserProfileVC:UICollectionViewDelegate{
    
}
extension FeedUserProfileVC:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
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
            let url = imgUrls[indexPath.row]
            cell.imgView.sd_setImage(with: url)
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
}
