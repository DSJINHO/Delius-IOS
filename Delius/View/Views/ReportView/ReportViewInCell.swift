//
//  ReportViewInCell.swift
//  Delius
//
//  Created by 박진호 on 2020/06/15.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class ReportViewInCell:UIButton{
    
    
    let txtLabel:UIImageView={
        let l = UIImageView()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.image = UIImage(named: "Report")
        l.contentMode = .scaleAspectFit
        l.tintColor = .MainGrayColor()
        return l
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    private func setup(){
        
        self.addSubview(txtLabel)
        txtLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        txtLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        txtLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        txtLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
