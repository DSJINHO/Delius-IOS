//
//  BuyDeliVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/05.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class BuyDeliVC:UIViewController{
    
    
    public struct InAppProducts {
        public static let product = "DeliusFirstTypeOfDeli"
        private static let productIdentifiers: Set<ProductIdentifier> = [InAppProducts.product]
        public static let store = IAPHelper(productIds: InAppProducts.productIdentifiers)
    }
    
    var contentView : BuyDeliView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        contentView.appearAnimation()
    }
    private func setup(){
        contentView = BuyDeliView(frame: view.bounds)
        view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.cancelBtn.addTarget(self, action: #selector(cancelBtnFunc(_:)), for: .touchUpInside)
        
        contentView.deliBtn1.addTarget(self, action: #selector(deliType1Func(_:)), for: .touchUpInside)
        contentView.deliBtn2.addTarget(self, action: #selector(deliType2Func(_:)), for: .touchUpInside)
        contentView.deliBtn3.addTarget(self, action: #selector(deliType3Func(_:)), for: .touchUpInside)
        
    }
    @objc func cancelBtnFunc(_ sender:UIButton){
        contentView.disappearAnimation(completion: {
            self.dismiss(animated: false, completion: {})
        })
    }
    @objc func deliType1Func(_ sender:UIButton){
//        InAppProducts.store.buyProduct(product)
        InAppProducts.store.requestProducts{ (success, products) in
            print(products)
            
//            InAppProducts.store.buyProduct((products?.first)!)
        }
    }
    @objc func deliType2Func(_ sender:UIButton){
        
    }
    @objc func deliType3Func(_ sender:UIButton){
        
    }
}
