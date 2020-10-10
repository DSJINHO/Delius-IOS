//
//  ChooseMyGroupVC.swift
//  Delius
//
//  Created by user on 2020/08/16.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class ChooseMyGroupVC:UIViewController{
    
    var delegate:ChooseMyGroupDelegate!
    
    var contentView:ChooseMyGroupView!
    
    var myGroupList:[MyGroupListStruct]!
    
    var selectedGid:String!
    var myUids:[String]!
    var partnerUids:[String]!
    var partnerGid:String!
    
    
    var selectedGroup:MyGroupListStruct!
    
    var tapGesture:UITapGestureRecognizer!
    
    var isLike:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        contentView.openAnimation()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapFunc(_:)))
        contentView.shadowView.addGestureRecognizer(tapGesture)
    }
    private func setup(){
        contentView = ChooseMyGroupView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
        
        contentView.collectionView.register(ChooseGroup2Cell.self, forCellWithReuseIdentifier: "chooseGroup2Cellid")
        contentView.collectionView.register(ChooseGroup3Cell.self, forCellWithReuseIdentifier: "chooseGroup3Cellid")
        contentView.collectionView.register(ChooseGroup4Cell.self, forCellWithReuseIdentifier: "chooseGroup4Cellid")
        
        tapGesture = UITapGestureRecognizer()
        contentView.shadowView.addGestureRecognizer(tapGesture)
        tapGesture.addTarget(self, action: #selector(tapFunc(_:)))
        
        
        contentView.imgView.image = (isLike!) ? (UIImage(named: "SendLike")) : (UIImage(named: "SendDeli"))
        
        
        self.selectedGroup = myGroupList[0]
        
        
        let groupName = myGroupList[0].groupInfo?.na!
        contentView.titleLabel.text = groupName
        if isLike!{
            contentView.sendBtn.setTitle("라이크보내기", for: .normal)
        }else{
            contentView.sendBtn.setTitle("딜리보내기", for: .normal)
        }
        if let firstGid = myGroupList[0].listInfo?.id!{
            self.selectedGid = firstGid
        }
        if let mUids = myGroupList[0].listInfo?.uids{
            self.myUids = mUids
        }
        
        
    }
    @objc func tapFunc(_ sender:UITapGestureRecognizer){
        contentView.closeAnimation {
            self.dismiss(animated: false, completion: {
                self.removeFromParent()
                self.view.removeFromSuperview()
            })
        }
    }
}
extension ChooseMyGroupVC:UICollectionViewDelegate{
    
}
extension ChooseMyGroupVC:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let list = myGroupList {
            return list.count
        }else{
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "chooseGroup2Cellid", for: indexPath) as! ChooseGroup2Cell
        let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "chooseGroup3Cellid", for: indexPath) as! ChooseGroup3Cell
        let cell4 = collectionView.dequeueReusableCell(withReuseIdentifier: "chooseGroup4Cellid", for: indexPath) as! ChooseGroup4Cell
        
        guard let list = myGroupList else { return cell2 }
        
        let data = list[indexPath.row]
        guard let groupData = data.groupInfo else { return cell2 }
        if data.listInfo?.num! == 2{
            guard let firstUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid1!}) else { return cell2 }
            guard let secondUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid2!}) else {return cell2}
            if let im = firstUser.im{
                let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: im)
                cell2.imgView.sd_setImage(with: url)
                cell2.backView.sd_setImage(with: url)
            }
            if let im = secondUser.im{
                let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: im)
                cell2.imgView2.sd_setImage(with: url)
            }
            return cell2
        }
        if data.listInfo?.num! == 3{
            guard let firstUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid1!}) else { return cell2 }
            guard let secondUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid2!}) else {return cell2}
            guard let thirdUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid3!}) else {return cell2}
            if let im = firstUser.im{
                let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: im)
                cell3.imgView1.sd_setImage(with: url)
            }
            if let im = secondUser.im{
                let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: im)
                cell3.imgView2.sd_setImage(with: url)
            }
            if let im = thirdUser.im{
                let url = CreateThumbUrl.mainImgUrl(uid: thirdUser.uid!, imgObjs: im)
                cell3.imgView3.sd_setImage(with: url)
            }
            if let na = groupData.na{
                cell3.nameLabel.text = na
            }
            return cell3
            
        }
        if data.listInfo?.num! == 4{
            guard let firstUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid1!}) else { return cell4 }
            guard let secondUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid2!}) else {return cell4}
            guard let thirdUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid3!}) else {return cell4}
            guard let fourthUser = data.memberInfo?.first(where: {$0.uid! == groupData.uid4!}) else {return cell4}
            if let im = firstUser.im{
                let url = CreateThumbUrl.mainImgUrl(uid: firstUser.uid!, imgObjs: im)
                cell4.imgView1.sd_setImage(with: url)
            }
            if let im = secondUser.im{
                let url = CreateThumbUrl.mainImgUrl(uid: secondUser.uid!, imgObjs: im)
                cell4.imgView2.sd_setImage(with: url)
            }
            if let im = thirdUser.im{
                let url = CreateThumbUrl.mainImgUrl(uid: thirdUser.uid!, imgObjs: im)
                cell4.imgView3.sd_setImage(with: url)
            }
            if let im = fourthUser.im{
                let url = CreateThumbUrl.mainImgUrl(uid: fourthUser.uid!, imgObjs: im)
                cell4.imgView4.sd_setImage(with: url)
            }
            if let na = groupData.na{
                cell4.nameLabel.text = na
            }
            return cell4
            
        }
        return cell2
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let list = myGroupList else { return }
        let data = list[indexPath.row]
        selectedGid = data.groupInfo?.gid!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x/scrollView.frame.width)
        print("page",page)
        let max = (myGroupList[0].groupInfo?.num!)! - 1
        if page > max {
            self.selectedGroup = myGroupList[max]
            return
        }
        if page < 0{
            self.selectedGroup = myGroupList[0]
            return
        }
        self.selectedGroup = myGroupList[page]
    }
    
}
