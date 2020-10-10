//
//  BuyDeliSelectionView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/05.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class BuyDeliSelectionView:UIButton{

    var ImgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.tintColor = UIColor.MainGrayColor()
        return v
    }()
    
    required init?(coder:NSCoder){
        super.init(coder:coder)
    }
    init(imgName:String,frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        
        
        
        ImgView.image = UIImage(named:imgName)
        setup()
        
    }
    private func setup(){
        self.addSubview(ImgView)
        ImgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        ImgView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        ImgView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        ImgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
    }
}
