//
//  PurchaseDeliVC.swift
//  Delius
//
//  Created by user on 2020/08/29.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
import StoreKit

class PurchaseDeliVC:UIViewController,SKProductsRequestDelegate{
    
    let imgNameArr = ["PurchasePlusMain1","PurchasePlusMain2","PurchasePlusMain3","PurchasePlusMain4"]
    let titleArr = ["PurchasePlusString001".localize(),"PurchasePlusString011".localize(),"PurchasePlusString021".localize(),"PurchasePlustString031".localize()]
    let subArr = ["PurchasePlusString002".localize(),"PurchasePlusString012".localize(),"PurchasePlusString022".localize(),"PurchasePlusString032".localize()]
    
    
    let productIds = Set(["com.delius.delius.Delius.DeliType1"])
    var product: SKProduct?
    var productsArr = [SKProduct]()
    
    var contentView:PurchaseDeliView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        contentView.openAnimation()
        requestProductData()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapFunc(_:)))
        contentView.shadowView.addGestureRecognizer(tapGesture)
        
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
        contentView.collectionView.register(PurchaseDeliCell.self, forCellWithReuseIdentifier: "PurchaseDeliCellid")
    }
    private func setup(){
        contentView = PurchaseDeliView(frame: view.bounds)
        view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.purchaseBtn.addTarget(self, action: #selector(showPurchase(_:)), for: .touchUpInside)
        
    }
    @objc func tapFunc(_ sender:UITapGestureRecognizer){
        contentView.closeAnimation {
            self.dismiss(animated: false, completion: {})
        }
    }
    @objc func showPurchase(_ sender:UIButton){
        print("BUTTONCLICKED")
    }
    
    
    func requestProductData()
    {
        if SKPaymentQueue.canMakePayments() {
            let request = SKProductsRequest(productIdentifiers: self.productIds)
            request.delegate = self
            request.start()
        } else {
            var alert = UIAlertController(title: "In-App Purchases Not Enabled", message: "Please enable In App Purchase in Settings", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { alertAction in
                alert.dismiss(animated: true, completion: nil)
                
                let url: NSURL? = NSURL(string: UIApplication.openSettingsURLString)
                if url != nil
                {
                    UIApplication.shared.openURL(url! as URL)
                }
                
            }))
            alert.addAction(UIAlertAction(title: "Ok", style:.default, handler: { alertAction in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        var products = response.products
        
        if (products.count != 0) {
            for i in products{
                print(i)
            }
//            for var i = 0; i < products.count; i++
//            {
//                self.product = products[i] as? SKProduct
//                self.productsArray.append(product!)
//            }
//            self.tableView.reloadData()
        } else {
            print("No products found")
        }
        
//        products = response.invalidProductIdentifiers
        
        for product in products
        {
            print("Product not found: \(product)")
        }
    }
    
    
    
    
}
extension PurchaseDeliVC:UICollectionViewDelegate{
    
}
extension PurchaseDeliVC:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PurchaseDeliCellid", for: indexPath) as! PurchaseDeliCell
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
        if page < 0 || page > 3{
            return
        }
        contentView.currentPage = page
    }
    
    
}
