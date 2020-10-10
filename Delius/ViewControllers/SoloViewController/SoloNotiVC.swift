//
//  SoloNotiVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/03.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SoloNotiVC: UIViewController {
    
    
    
    var likeArray=[SoloStruct]()
    var deliArray=[SoloStruct]()
    var notiArray=[SoloStruct]()
    var imgArray=[[String:[UIImage]]]()
    
    
    var delegate:SoloNotiDelegate!
    
    
    var feedList = [MainListStruct]()
    
    
    var userProfileVC:FeedUserProfileVC!
    
    
    var currentUser:UserStruct!
    
    
    var contentView:SoloSideNotiView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        setup()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        contentView.notiCollectionView.reloadData()
        
    }
    
    private func setup(){
        contentView = SoloSideNotiView()
        
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.notiCollectionView.register(SoloFeedCell.self, forCellWithReuseIdentifier: "SoloFeedCellid")
        contentView.notiCollectionView.register(SoloFeedHideCell.self, forCellWithReuseIdentifier: "SoloFeedHideCellid")
        contentView.notiCollectionView.delegate = self
        contentView.notiCollectionView.dataSource = self
        
    }
    func removeTarget(target:MStruct){
        guard let id = target.pid else { return }
        self.feedList.removeAll(where: {$0.mStruct?.pid! == id})
        self.contentView.notiCollectionView.reloadData()
    }
    private func setupNotiCell(cell:SoloFeedCell,uid:String) -> SoloFeedCell{
        guard let data = notiArray.first(where: {$0.uid! == uid}) else { return cell }
        if let name = data.na{
            cell.titleLabel.text = name
            if let age = data.bt{
                let year = floorf(Float(age/10000))
                let month = floorf(Float(age)/100 - year*100)
                let day = floorf(Float(age) - year*10000 - month*100)
                let ageStr = CalculateAge.CalculateAgeFromBirth(Year: Int(year), Month: Int(month), Day: Int(day))
                
                cell.titleLabel.text = "\(name), \(ageStr)"
            }
        }
        if let receive = data.receive {
            if receive == 300{
                cell.logoImg.image = UIImage(named: "NotiLike")
            }
            if receive == 400{
                cell.logoImg.image = UIImage(named: "NotiDeli")
            }
        }
        if let imArr = data.im{
            if let cellImgs = imgArray.first(where: { $0.keys.contains(uid)}){
                if let imgs = cellImgs[uid]{
                    cell.imgView.image = imgs[0]
                }
            }else{
                CreateThumbUrl.createImageArray(uid: uid, imArr: imArr, completion: {(imgs) in
                    self.imgArray.append([uid:imgs])
                    self.contentView.notiCollectionView.reloadData()
                })
            }
        }
        return cell
    }
    private func configNotiCell(cell:SoloFeedCell,mData:MainListStruct)->SoloFeedCell{
        guard let soloData = mData.soloStruct else { return cell}
        guard let mainData = mData.mStruct else { return cell }
        if let imgUrl = soloData.im{
            let url = CreateThumbUrl.mainImgUrl(uid: soloData.uid!, imgObjs: imgUrl)
            cell.imgView.sd_setImage(with: url)
        }
        var name = ""
        if let na = soloData.na{
            name = na
        }
        if let bt = soloData.bt{
            let age = CalculateAge.returnAge(birth: bt)
            name = name + ", " + age
        }
        cell.titleLabel.text = name
        if let index = mainData.in2{
            if index == 300{
                cell.logoImg.image = UIImage(named: "NotiLike")
            }
            if index == 400{
                cell.logoImg.image = UIImage(named: "NotiDeli")
            }
        }
        return cell
    }
    private func configHideCell(cell:SoloFeedHideCell,mData:MainListStruct,count:Int)->SoloFeedHideCell{
        
        guard let soloData = mData.soloStruct else { return cell}
        guard let mainData = mData.mStruct else { return cell }
        if let imgUrl = soloData.im{
            let url = CreateThumbUrl.mainImgUrl(uid: soloData.uid!, imgObjs: imgUrl)
            cell.imgView.sd_setImage(with: url)
        }
        let countString = "+\(count)"
        cell.countLabel.text = countString
//        var name = ""
//        if let na = soloData.na{
//            name = na
//        }
//        if let bt = soloData.bt{
//            let age = CalculateAge.returnAge(birth: bt)
//            name = name + ", " + age
//        }
//        cell.titleLabel.text = name
//        if let index = mainData.in2{
//            if index == 300{
//                cell.logoImg.image = UIImage(named: "NotiLike")
//            }
//            if index == 400{
//                cell.logoImg.image = UIImage(named: "NotiDeli")
//            }
//        }
        return cell
    }
    


}
extension SoloNotiVC:UICollectionViewDelegate{

}
extension SoloNotiVC:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
//        contentView.showEmptyView()
//        return 0
        
        
        
        if let user = currentUser{
            if let ind2 = user.ind2,ind2{
                return feedList.count
            }
        }
        let deliArray = feedList.filter({$0.mStruct?.in2 == 400})
        let likeArray = feedList.filter({$0.mStruct?.in2 == 300})
        
        if likeArray.count == 0{
            return deliArray.count
        }else{
            return deliArray.count + 1
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let user = currentUser{
            
            if let ind2 = user.ind2,ind2{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SoloFeedCellid", for: indexPath) as! SoloFeedCell
                return configNotiCell(cell: cell, mData: feedList[indexPath.row])
            }
            
        }
        
        let deliArray = feedList.filter({$0.mStruct?.in2 == 400})
        let likeArray = feedList.filter({$0.mStruct?.in2 == 300})
        
        if likeArray.count == 0{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SoloFeedCellid", for: indexPath) as! SoloFeedCell
            return configNotiCell(cell: cell, mData: feedList[indexPath.row])
        }else{
            if indexPath.row == 0{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SoloFeedHideCellid", for: indexPath) as! SoloFeedHideCell
                return configHideCell(cell: cell, mData: likeArray[0], count: likeArray.count)
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SoloFeedCellid", for: indexPath) as! SoloFeedCell
                return configNotiCell(cell: cell, mData: deliArray[indexPath.row-1])
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width/2 - 5
        let height = width + 30
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let user = currentUser{
            
            if let ind2 = user.ind2,ind2{
                let selectedItem = feedList[indexPath.row]
                delegate.openPartnerDeatil(pData: selectedItem)
                return
            }
            
        }
        
        let deliArray = feedList.filter({$0.mStruct?.in2 == 400})
        let likeArray = feedList.filter({$0.mStruct?.in2 == 300})
        
        if likeArray.count == 0{
            
        }else{
            if indexPath.row == 0{
            }else{
                let selectedItem = deliArray[indexPath.row - 1]
                
            }
        }
//        let pData = feedList[indexPath.row]
//
//        delegate.openPartnerDeatil(pData: pData)
    }

}
