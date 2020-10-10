//
//  MainTagCell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 16/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class MainTagCell:UICollectionViewCell{
    var titleLabel:UILabel={
        let l = UILabel()
        l.TagCellLabel(alignment: .center, ft: UIFont.DeliusSystemType2())
        l.textColor = UIColor.MainBlackColor()
        return l
    }()
    var imgView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.tintColor = UIColor.MainBlackColor()
        return v
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        setup()
    }
    override func prepareForReuse() {
        
    }
    private func setup(){
        self.addSubview(imgView)
        imgView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        imgView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: imgView.rightAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
