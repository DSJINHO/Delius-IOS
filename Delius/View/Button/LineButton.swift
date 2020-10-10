//
//  LineButton.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 04/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit

class LineButton:UIButton{
    
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(txt:String,color:UIColor,frame: CGRect) {
        super.init(frame:frame)
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(txt, for: .normal)
        setTitleColor(color, for: .normal)
        lineView.backgroundColor = color
        addSubview(lineView)
        lineView.topAnchor.constraint(equalTo: titleLabel!.bottomAnchor, constant: 5).isActive = true
        lineView.leftAnchor.constraint(equalTo: titleLabel!.leftAnchor).isActive = true
        lineView.rightAnchor.constraint(equalTo: titleLabel!.rightAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
