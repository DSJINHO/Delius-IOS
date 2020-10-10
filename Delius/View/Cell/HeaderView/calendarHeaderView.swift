//
//  calendarHeaderView.swift
//  Delius
//
//  Created by 박진호 on 2020/06/14.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class calendarHeaderView:UICollectionReusableView{
    
    var label:UILabel={
        let l = UILabel()
        l.tag = 1
        l.textColor = UIColor.white
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        l.font = UIFont.boldSystemFont(ofSize: 17)
        l.backgroundColor = .GroupTextColor()
        l.layer.cornerRadius = 17
        l.clipsToBounds = true
        return l
    }()
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        self.clipsToBounds = true
        setupLayout()
    }
    
    private func setupLayout(){
        addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 34).isActive = true
        label.widthAnchor.constraint(equalToConstant: 110).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
