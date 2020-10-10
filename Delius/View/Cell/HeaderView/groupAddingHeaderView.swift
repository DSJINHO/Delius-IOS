//
//  groupAddingHeaderView.swift
//  Delius
//
//  Created by 박진호 on 2020/06/14.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

class groupAddingHeaderView:UICollectionReusableView{
    
    var label:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = UIColor.white
        return l
    }()
    override init(frame: CGRect){
        super.init(frame: frame)
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.backgroundColor = UIColor.lightGray
        setup()
    }
    private func setup(){
        self.addSubview(label)
        label.topAnchor.constraint(equalTo: self.topAnchor,constant: 10).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
