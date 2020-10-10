//
//  BuyPlusUserVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/05.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class BuyPlusUserVC:UIViewController{
    var contentView:BuyPlusUserView!
    
    let imgArray = [UIImage(named: "BuyPlusView1"),UIImage(named: "BuyPlusView2"),UIImage(named: "BuyPlusView3")]
    let txtArray = ["BuyPlusView501".localize(),"BuyPlusView502".localize(),"BuyPlusView503".localize()]
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        contentView.appearAnimation()
    }
    private func setup(){
        contentView = BuyPlusUserView(frame: view.bounds)
        view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.tempCollectionView.register(BuyPlusUserCell.self, forCellWithReuseIdentifier: "BuyPlusUserCellid")
        contentView.tempCollectionView.dataSource = self
        contentView.tempCollectionView.delegate = self
        
        contentView.cancelBtn.addTarget(self, action: #selector(cancelBtnFunc(_:)), for: .touchUpInside)
        
    }
    @objc func cancelBtnFunc(_ sender:UIButton){
        contentView.disappearAnimation(completion: {
            self.dismiss(animated: false, completion: {})
        })
    }
    
}
extension BuyPlusUserVC:UICollectionViewDelegate{
    
}
extension BuyPlusUserVC:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BuyPlusUserCellid", for: indexPath) as! BuyPlusUserCell
        cell.imgView.image = imgArray[indexPath.row]
        cell.titleLabel.text = txtArray[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width:collectionView.frame.width,height:collectionView.frame.height)
    }
    
    
}
