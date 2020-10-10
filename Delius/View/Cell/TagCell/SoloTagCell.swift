//
//  SoloTagCell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 13/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SoloTagCell:UICollectionViewCell{
    
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected{
                titleLabel.textColor = UIColor.white
                self.backgroundColor = UIColor.gradientColor()[3]
                self.layer.borderColor = UIColor.gradientColor()[3].cgColor
            }else{
                titleLabel.textColor = UIColor.MainBlackColor3()
                self.backgroundColor = .white
                self.layer.borderColor = UIColor.MainBlackColor3().cgColor
            }
        }
    }
    
    
    var titleLabel:UILabel={
        let l = UILabel()
        l.TagCellLabel(alignment: .center, ft: UIFont.DeliusSystemType2())
        l.textColor = UIColor.MainBlackColor3()
        return l
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.layer.cornerRadius = frame.height/2
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.MainBlackColor3().cgColor
        self.backgroundColor = UIColor.white
        self.clipsToBounds = true
        
        setup()
    }
    override func prepareForReuse() {
        
    }
    private func setup(){
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
