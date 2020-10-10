//
//  Tab0GroupImageCell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 28/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Tab0GroupImageCell:UICollectionViewCell{
    
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        setup()
    }
    private func setup(){
        self.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imgView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(blurEffectView)
        blurEffectView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        blurEffectView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        blurEffectView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        blurEffectView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
}
