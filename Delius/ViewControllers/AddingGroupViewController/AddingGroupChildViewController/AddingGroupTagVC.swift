//
//  AddingGroupTagVC.swift
//  Delius
//
//  Created by 박진호 on 2020/06/14.
//  Copyright © 2020 정윤환. All rights reserved.
//
protocol ProtocolAddingGroupTag{
    func completeTag(obj:[String:Any])
}
import UIKit
class AddingGroupTagVC:UIViewController{
    
    
    var delegate:CreateGroupTagDelegate?=nil
    
    let kItemPadding:CGFloat = 20
    let arrData1 = String.GroupInfo1Array()
    let arrData2 = String.GroupInfo2Array()
    let arrData3 = String.GroupInfo3Array()
    
    
    
    
    var contentView:AddingGroupTagView!
    
    var info1,info2,info3:Int!
    
    lazy var collectionViewTag: UICollectionView = {
        let layout = groupTagLayout()
        layout.delegate = self
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 12.0
        layout.headerReferenceSize = CGSize(width: 100, height: 200)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.white
        cv.showsVerticalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
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
        contentView = AddingGroupTagView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        
        contentView.saveBtn.addTarget(self, action: #selector(completeBtnFunc(_:)), for: .touchUpInside)
        
        collectionViewTag.register(groupTagCell.self, forCellWithReuseIdentifier: "AddingGroupTagCellid")
        collectionViewTag.register(groupAddingHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "AddingGroupHeaderid")
        
        contentView.contentView.addSubview(collectionViewTag)
        collectionViewTag.topAnchor.constraint(equalTo: contentView.Descriptionlabel.bottomAnchor,constant: 20).isActive = true
        collectionViewTag.leftAnchor.constraint(equalTo: contentView.contentView.leftAnchor, constant: 20).isActive = true
        collectionViewTag.rightAnchor.constraint(equalTo: contentView.contentView.rightAnchor, constant: -20).isActive = true
        collectionViewTag.bottomAnchor.constraint(equalTo: contentView.contentView.bottomAnchor).isActive = true
        
        contentView.contentView.sendSubviewToBack(collectionViewTag)
        
    }
    private func checkInfoData(completion:@escaping()->Void={}){
        if info1 == nil || info2 == nil || info3 == nil {
            self.delegate?.showNoInfoAlertVC()
            return
        }
        completion()
        
    }
    @objc func completeBtnFunc(_ sender:UIButton){
        checkInfoData {
            self.delegate?.transfer(fo1: self.info1, fo2: self.info2, fo3: self.info3)
        }
    }
}

extension AddingGroupTagVC:UICollectionViewDelegate{
    
}
extension AddingGroupTagVC:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,GroupTagCollectionViewBubbleLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            print("section 0")
            return 8
        }else if section == 1{
            print("section 1")
            return 8
        }else{
            print("section 2")
            return 8
        }
//        print(section)
//        return arrData[section].count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "AddingGroupTagCellid", for: indexPath) as! groupTagCell
        
        if indexPath.section == 0{
            cell1.layer.borderColor = UIColor.MainLightGrayColor().cgColor
            cell1.label.textColor = .MainLightGrayColor()
            cell1.label.font = .DeliusSystemType1()
            cell1.label.textAlignment = .center
            cell1.label.text = arrData1[indexPath.row]
            return cell1
        }else if indexPath.section == 1{
            cell1.layer.borderColor = UIColor.MainLightGrayColor().cgColor
            cell1.label.textColor = .MainLightGrayColor()
            cell1.label.font = .DeliusSystemType1()
            cell1.label.textAlignment = .center
            cell1.label.text = arrData2[indexPath.row]
            return cell1
        }else{
            cell1.layer.borderColor = UIColor.MainLightGrayColor().cgColor
            cell1.label.textColor = .MainLightGrayColor()
            cell1.label.font = .DeliusSystemType1()
            cell1.label.textAlignment = .center
            cell1.label.text = arrData3[indexPath.row]
            return cell1
        }
    }
    func collectionView(_ collectionView: UICollectionView, itemSizeAt indexPath: NSIndexPath) -> CGSize {
        var title = String()
        
        if indexPath.section == 0{
            title = arrData1[indexPath.row] as String
        }else if indexPath.section == 1{
            title = arrData2[indexPath.row] as String
        }else{
            title = arrData3[indexPath.row] as String
        }
        
        var size = title.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)])
        size.width = CGFloat(ceilf(Float(size.width + CGFloat(kItemPadding * 2) + 2)))
        size.height = 30
        //...Checking if item width is greater than collection view width then set item width == collection view width.
        if size.width > collectionView.frame.size.width {
            size.width = collectionView.frame.size.width
        }
        return size
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0{
            self.info1 = indexPath.row
            for i in 0...7{
                if i == indexPath.row{
                    let cell = collectionViewTag.cellForItem(at: indexPath) as! groupTagCell
                    cell.label.textColor = .MainGrayColor()
                    cell.layer.borderColor = UIColor.MainGrayColor().cgColor
                }else{
                    let idx = IndexPath(row: i, section: 0)
                    let cell = collectionViewTag.cellForItem(at: idx) as! groupTagCell
                    cell.label.textColor = .MainLightGrayColor()
                    cell.layer.borderColor = UIColor.MainLightGrayColor().cgColor
                }
            }
        }else if indexPath.section == 1{
            self.info2 = indexPath.row
            for i in 0...7{
                if i == indexPath.row{
                    let cell = collectionViewTag.cellForItem(at: indexPath) as! groupTagCell
                    cell.label.textColor = .MainGrayColor()
                    cell.layer.borderColor = UIColor.MainGrayColor().cgColor
                }else{
                    let idx = IndexPath(row: i, section: 1)
                    let cell = collectionViewTag.cellForItem(at: idx) as! groupTagCell
                    cell.label.textColor = .MainLightGrayColor()
                    cell.layer.borderColor = UIColor.MainLightGrayColor().cgColor
                }
            }
        }else{
            self.info3 = indexPath.row
            for i in 0...7{
                if i == indexPath.row{
                    let cell = collectionViewTag.cellForItem(at: indexPath) as! groupTagCell
                    cell.label.textColor = .MainGrayColor()
                    cell.layer.borderColor = UIColor.MainGrayColor().cgColor
                }else{
                    let idx = IndexPath(row: i, section: 2)
                    let cell = collectionViewTag.cellForItem(at: idx) as! groupTagCell
                    cell.label.textColor = .MainLightGrayColor()
                    cell.layer.borderColor = UIColor.MainLightGrayColor().cgColor
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "AddingGroupHeaderid", for: indexPath) as! groupAddingHeaderView
        
        let strings = ["관심사","목적","성격"]
        headerView.backgroundColor = UIColor.clear
        headerView.label.textColor = UIColor.MainBlackColor()
        headerView.label.text = strings[indexPath.section]
        headerView.label.font = .DeliusBoldType6()
        return headerView
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
}
