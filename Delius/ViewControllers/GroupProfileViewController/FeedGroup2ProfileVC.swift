//
//  FeedGroup2ProfileVC.swift
//  Delius
//
//  Created by user on 2020/09/25.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class FeedGroup2ProfileVC:UIViewController{
    
    var contentView:FeedGroup2ProfileView!
    
    var groupData:SideGroupStruct!
    

    var imgUrls = [URL]()
    var tagArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        contentView.openAnimation()
    }
    private func setup(){
        contentView = FeedGroup2ProfileView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.imgCollectionView.register(Tab0GroupImageCell.self, forCellWithReuseIdentifier: "FeedGroupProfileCellid")
        contentView.tagCollectionView.register(MainTagCell.self, forCellWithReuseIdentifier: "FeedGroupProfileTagCellid")
        
        contentView.imgCollectionView.delegate = self
        contentView.imgCollectionView.dataSource = self
        
        contentView.tagCollectionView.delegate = self
        contentView.tagCollectionView.dataSource = self
    }
    func setData(data:SideGroupStruct){
        self.groupData = data
        guard let groupData = data.group else { return }
        guard let memberData = data.members else { return }
        guard let user1 = memberData.first(where: {$0.uid! == groupData.uid1!}) else { return }
        guard let user2 = memberData.first(where: {$0.uid! == groupData.uid2!}) else { return }
        
        if let user1Name = user1.na{
            if let bt = user1.bt{
                let ageStr = CalculateAge.returnAge(birth: bt)
                contentView.nameLabel1.text = "\(user1Name), \(ageStr)"
            }else{
                contentView.nameLabel1.text = user1Name
            }
        }
        if let user2Name = user2.na{
            if let bt = user2.bt{
                let ageStr = CalculateAge.returnAge(birth: bt)
                contentView.nameLabel2.text = "\(user2Name), \(ageStr)"
            }else{
                contentView.nameLabel2.text = user2Name
            }
        }
        if let userIm1 = user1.im{
            let url = CreateThumbUrl.mainImgUrl(uid: user1.uid!, imgObjs: userIm1)
            contentView.imgView1.sd_setImage(with: url)
            self.imgUrls.append(url)
        }
        if let userIm2 = user2.im{
            let url = CreateThumbUrl.mainImgUrl(uid: user2.uid!, imgObjs: userIm2)
            contentView.imgView2.sd_setImage(with: url)
            self.imgUrls.append(url)
        }
        if let groupName = groupData.na{
            contentView.nameLabel.text = groupName
        }
        if let groupSt = groupData.st{
            contentView.statusLabel.text = groupSt
        }
        if let groupLo = groupData.lo{
            self.tagArray.append(groupLo)
        }
        if let groupFo1 = groupData.fo1{
            self.tagArray.append(String.GroupInfo1Array()[groupFo1])
        }
        if let groupFo2 = groupData.fo2{
            self.tagArray.append(String.GroupInfo2Array()[groupFo2])
        }
        if let groupFo3 = groupData.fo3{
            self.tagArray.append(String.GroupInfo3Array()[groupFo3])
        }
        contentView.tagArray = self.tagArray
        contentView.imgCollectionView.reloadData()
        contentView.tagCollectionView.reloadData()
    }
}
extension FeedGroup2ProfileVC:UICollectionViewDelegate{
    
}
extension FeedGroup2ProfileVC:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == contentView.imgCollectionView{
            return imgUrls.count
        }else{
            return tagArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == contentView.imgCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedGroupProfileCellid", for: indexPath) as! Tab0GroupImageCell
            let url = imgUrls[indexPath.row]
            cell.imgView.sd_setImage(with: url)
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedGroupProfileTagCellid", for: indexPath) as! MainTagCell
            switch indexPath.row{
            case 0:cell.imgView.image = UIImage(named: "LocationTag")
            default:cell.imgView.image = UIImage(named: "HashTag")
            }
            cell.titleLabel.text = tagArray[indexPath.row]
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == contentView.imgCollectionView{
            contentView.imgAnimation(offset: scrollView.contentOffset.x)
            return
        }
    }
    
    
}
