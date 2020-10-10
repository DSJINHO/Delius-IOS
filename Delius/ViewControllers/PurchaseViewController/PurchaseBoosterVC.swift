//
//  PurchaseDeliVC.swift
//  Delius
//
//  Created by user on 2020/08/29.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class PurchaseBoosterVC:UIViewController{
    
    let imgNameArr = ["PurchaseBoosterMain"]
    let titleArr = ["PurchaseBoosterString001".localize()]
    let subArr = ["PurchaseBoosterString002".localize()]
    var contentView:PurchaseBoosterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        contentView.openAnimation()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapFunc(_:)))
        contentView.shadowView.addGestureRecognizer(tapGesture)
        
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
        contentView.collectionView.register(PurchaseDeliCell.self, forCellWithReuseIdentifier: "PurchaseBoosterCellid")
    }
    private func setup(){
        contentView = PurchaseBoosterView(frame: view.bounds)
        view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }
    @objc func tapFunc(_ sender:UITapGestureRecognizer){
        contentView.closeAnimation {
            self.dismiss(animated: false, completion: {})
        }
    }
}
extension PurchaseBoosterVC:UICollectionViewDelegate{
    
}
extension PurchaseBoosterVC:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PurchaseBoosterCellid", for: indexPath) as! PurchaseDeliCell
        cell.imgView.image = UIImage(named: imgNameArr[indexPath.row])
        cell.titleLabel.text = titleArr[indexPath.row]
        cell.subLabel.text = subArr[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 230)
    }
    
    
}

