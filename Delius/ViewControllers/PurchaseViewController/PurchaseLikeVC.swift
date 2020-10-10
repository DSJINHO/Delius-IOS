//
//  PurchaseDeliVC.swift
//  Delius
//
//  Created by user on 2020/08/29.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class PurchaseLikeVC:UIViewController{
    
    let imgNameArr = ["PurchaseLikeMain1","PurchaseLikeMain1","PurchaseLikeMain1"]
    let titleArr = ["PurchaseDeliString001".localize(),"PurchaseDeliString011".localize(),"PurchaseDeliString021".localize()]
    let subArr = ["PurchaseDeliString002".localize(),"PurchaseDeliString012".localize(),"PurchaseDeliString022".localize()]
    var contentView:PurchaseLikeView!
    
    
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
        contentView.collectionView.register(PurchaseDeliCell.self, forCellWithReuseIdentifier: "PurchaseLikeCellid")
    }
    private func setup(){
        contentView = PurchaseLikeView(frame: view.bounds)
        view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.purchaseBtn1.addTarget(self, action: #selector(typeBtnFunc(_:)), for: .touchUpInside)
        contentView.purchaseBtn2.addTarget(self, action: #selector(typeBtnFunc(_:)), for: .touchUpInside)
        contentView.purchaseBtn3.addTarget(self, action: #selector(typeBtnFunc(_:)), for: .touchUpInside)
    }
    @objc func tapFunc(_ sender:UITapGestureRecognizer){
        contentView.closeAnimation {
            self.dismiss(animated: false, completion: {})
        }
    }
    @objc func typeBtnFunc(_ sender:UIButton){
        if sender == contentView.purchaseBtn1{
            contentView.typeBtnFunc(type: 1)
            return
        }
        if sender == contentView.purchaseBtn2{
            contentView.typeBtnFunc(type: 2)
            return
        }
        if sender == contentView.purchaseBtn3{
            contentView.typeBtnFunc(type: 3)
            return
        }
    }
}
extension PurchaseLikeVC:UICollectionViewDelegate{
    
}
extension PurchaseLikeVC:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PurchaseLikeCellid", for: indexPath) as! PurchaseDeliCell
        cell.imgView.image = UIImage(named: imgNameArr[indexPath.row])
        cell.titleLabel.text = titleArr[indexPath.row]
        cell.subLabel.text = subArr[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 230)
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x/scrollView.frame.width)
        if page < 0 || page > 2{
            return
        }
        contentView.currentPage = page
    }
    
    
}


