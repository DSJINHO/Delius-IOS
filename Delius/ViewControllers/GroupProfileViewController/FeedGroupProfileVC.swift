//
//  FeedGroupProfileVC.swift
//  Delius
//
//  Created by user on 2020/08/17.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class FeedGroupProfileVC:UIViewController{
    
    var contentView:FeedGroupProfileView!
    var userInfo:SoloStruct?
    var imgArray = [UIImage]()
    var tagArray = [String]()
    
    var imgUrls = [URL]()
    
    var groupData:SideGroupStruct!
    
    var detailGroup:SideGroupStruct!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        contentView.OpenAnimation()
    }
    
    private func setup(){
        contentView = FeedGroupProfileView(frame:view.bounds)
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
        
        contentView.imgCollectionView.register(Tab0GroupImageCell.self, forCellWithReuseIdentifier: "FeedGroupProfileCellid")
        contentView.imgCollectionView.register(Tab0GroupImageFirstCell2.self, forCellWithReuseIdentifier: "FeedGroup2ProfileCellid")
        contentView.imgCollectionView.register(Tab0GroupImageFirstCell3.self, forCellWithReuseIdentifier: "FeedGroup3ProfileCellid")
        contentView.imgCollectionView.register(Tab0GroupImageFirstCell4.self, forCellWithReuseIdentifier: "FeedGroup4ProfileCellid")
        contentView.tagCollectionView.register(MainTagCell.self, forCellWithReuseIdentifier: "GroupDetailTagCellid")
        
        contentView.likeBtn.addTarget(self, action: #selector(likeBtnFunc(_:)), for: .touchUpInside)
        contentView.deliBtn.addTarget(self, action: #selector(deliBtnFunc(_:)), for: .touchUpInside)
        contentView.rejectBtn.addTarget(self, action: #selector(rejectBtnFunc(_:)), for: .touchUpInside)
        contentView.closeBtn.addTarget(self, action: #selector(closeBtnFunc(_:)), for: .touchUpInside)
        
        setData(groupData: detailGroup, completion: {})
        
    }
    func setData(groupData:SideGroupStruct,completion:@escaping()->Void){
        
        guard let groupInfo = groupData.group else { return }
        
        if groupInfo.num! == 2{
            if let user = groupData.members?.first(where: {$0.uid! == groupInfo.uid1!}){
                if let im = user.im{
                    let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                    imgUrls.append(url)
                }
            }
            if let user = groupData.members?.first(where: {$0.uid! == groupInfo.uid2!}){
                if let im = user.im{
                    let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                    imgUrls.append(url)
                }
            }
        }
        if groupInfo.num! == 3{
            if let user = groupData.members?.first(where: {$0.uid! == groupInfo.uid1!}){
                if let im = user.im{
                    let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                    imgUrls.append(url)
                }
            }
            if let user = groupData.members?.first(where: {$0.uid! == groupInfo.uid2!}){
                if let im = user.im{
                    let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                    imgUrls.append(url)
                }
            }
            if let user = groupData.members?.first(where: {$0.uid! == groupInfo.uid3!}){
                if let im = user.im{
                    let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                    imgUrls.append(url)
                }
            }
        }
        if groupInfo.num! == 4{
            
            if let user = groupData.members?.first(where: {$0.uid! == groupInfo.uid1!}){
                if let im = user.im{
                    let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                    imgUrls.append(url)
                }
            }
            if let user = groupData.members?.first(where: {$0.uid! == groupInfo.uid2!}){
                if let im = user.im{
                    let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                    imgUrls.append(url)
                }
            }
            if let user = groupData.members?.first(where: {$0.uid! == groupInfo.uid3!}){
                if let im = user.im{
                    let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                    imgUrls.append(url)
                }
            }
            if let user = groupData.members?.first(where: {$0.uid! == groupInfo.uid4!}){
                if let im = user.im{
                    let url = CreateThumbUrl.mainImgUrl(uid: user.uid!, imgObjs: im)
                    imgUrls.append(url)
                }
            }
        }
        if let na = groupInfo.na{
            contentView.nameLabel.text = na
        }
        if let st = groupInfo.st{
            contentView.statusLabel.text = st
        }
        if let lo = groupInfo.lo{
            tagArray.append(lo)
        }
        if let fo1 = groupInfo.fo1{
            tagArray.append(String.GroupInfo1Array()[fo1])
        }
        if let fo2 = groupInfo.fo2{
            tagArray.append(String.GroupInfo2Array()[fo2])
        }
        if let fo3 = groupInfo.fo3{
            tagArray.append(String.GroupInfo3Array()[fo3])
        }
        if let ex = groupInfo.ex{
            contentView.extraLabel.text = ex
        }
        
        contentView.tagArray = self.tagArray
        contentView.tagCollectionView.reloadData()
        completion()
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
            self.dismiss(animated: false, completion: {})
        }
    }
}

extension FeedGroupProfileVC:UICollectionViewDelegate{
    
}
extension FeedGroupProfileVC:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == contentView.imgCollectionView{
            return imgUrls.count + 1
        }else{
            return tagArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == contentView.imgCollectionView{
            
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedGroup2ProfileCellid", for: indexPath) as! Tab0GroupImageFirstCell2
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedGroup3ProfileCellid", for: indexPath) as! Tab0GroupImageFirstCell3
            let cell4 = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedGroup4ProfileCellid", for: indexPath) as! Tab0GroupImageFirstCell4
            let defaultCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedGroupProfileCellid", for: indexPath) as! Tab0GroupImageCell
            
            guard let groupData = detailGroup else{ return  cell2}
            if groupData.group?.num! == 2{
                if indexPath.row == 0{
                    cell2.imgView1.sd_setImage(with: imgUrls[0])
                    cell2.imgView2.sd_setImage(with: imgUrls[1])
                    return cell2
                }else{
                    defaultCell.imgView.sd_setImage(with: imgUrls[indexPath.row-1])
                    return defaultCell
                }
            }else if groupData.group?.num! == 3{
                if indexPath.row == 0{
                    cell3.imgView1.sd_setImage(with: imgUrls[0])
                    cell3.imgView2.sd_setImage(with: imgUrls[1])
                    cell3.imgView3.sd_setImage(with: imgUrls[2])
                    return cell3
                }else{
                    defaultCell.imgView.sd_setImage(with: imgUrls[indexPath.row-1])
                    return defaultCell
                }
            }else{
                
                if indexPath.row == 0{
                    cell4.imgView1.sd_setImage(with: imgUrls[0])
                    cell4.imgView2.sd_setImage(with: imgUrls[1])
                    cell4.imgView3.sd_setImage(with: imgUrls[2])
                    cell4.imgView4.sd_setImage(with: imgUrls[3])
                    return cell4
                }else{
                    defaultCell.imgView.sd_setImage(with: imgUrls[indexPath.row-1])
                    return defaultCell
                }
            }
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupDetailTagCellid", for: indexPath) as! MainTagCell
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
