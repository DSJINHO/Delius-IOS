//
//  GroupProfileVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/09.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class GroupProfileVC:UIViewController{
    
    let label:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "여긴 그룹뷰"
        l.font = UIFont.DeliusBoldType1()
        return l
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setup()
    }
    private func setup(){
        self.view.addSubview(label)
        label.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
//extension GroupProfileVC:UICollectionViewDelegate{
//
//}
//extension GroupProfileVC:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == contentView.imgCollectionView{
//            return imgArray.count
//        }else{
//            return tagArray.count
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == contentView.imgCollectionView{
//            let imgCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupDetailImageCellid", for: indexPath) as! Tab0GroupImageCell
//            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "Group2DetailImageCellid", for: indexPath) as! Tab0GroupCell2
//            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "Group3DetailImageCEllid", for: indexPath) as! Tab0GroupCell3
//            let cell4 = collectionView.dequeueReusableCell(withReuseIdentifier: "Group4DetailImageCellid", for: indexPath) as! Tab0GroupCell4
//
//            return cell2
//        }else{
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SoloDetailTagCellid", for: indexPath) as! MainTagCell
//            cell.titleLabel.text = tagArray[indexPath.row]
//            return cell
//        }
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == contentView.imgCollectionView{
//            let width = collectionView.frame.width
//            return CGSize(width:width,height:width)
//        }else{
//            return CGSize.zero
//        }
//    }
//}
