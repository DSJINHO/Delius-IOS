//
//  calendarCell.swift
//  Delius
//
//  Created by 박진호 on 2020/06/14.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class calendarCell:UICollectionViewCell {
    
    
    var view:UIView={
        let v = UIView()
        v.tag = 1
        v.backgroundColor = .GroupTextColor()
        v.layer.cornerRadius = 4
        
        return v
    }()
    var label:UILabel={
        let l = UILabel()
        l.tag = 1
        l.textColor = UIColor.red
        l.textAlignment = .center
        
        return l
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.clipsToBounds = true
        setupLayout()
    }
    
    private func setupLayout(){
        
        view.frame = CGRect(x:8,y:8,width: 30,height:30)
        label.frame = CGRect(x: 6, y: 0, width: 34, height: 46)
        addSubview(view)
        addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
