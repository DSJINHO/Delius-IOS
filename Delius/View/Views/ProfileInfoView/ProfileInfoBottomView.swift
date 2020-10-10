//
//  ProfileInfoBottomView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 08/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class ProfileInfoBottomView:UIView{
    
    let strings1:[String] = String.SoloInfo1Array()
    let strings2:[String] = String.SoloInfo2Array()
    let strings3:[String] = String.SoloInfo3Array()
    let strings4:[String] = String.SoloInfo4Array()
    
    var strings=[String]()
    let titleLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "ProfileAuthView104".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType1(), txtColor: UIColor.MainBlackColor1())
        return l
    }()
    lazy var collectionViewTag: UICollectionView = {
        let layout = ProfileInfoFlowLayout()
        layout.delegate = self
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 12.0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.white
        cv.showsVerticalScrollIndicator = false
        cv.isUserInteractionEnabled = true
        return cv
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    init(type:Int,frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        switch type{
        case 0:
            titleLabel.text = "ProfileAuthView107".localize()
            self.strings = strings1
        case 1:
            titleLabel.text = "ProfileAuthView108".localize()
            self.strings = strings2
        case 2:
            titleLabel.text = "ProfileAuthView109".localize()
            self.strings = strings3
        case 3:
            titleLabel.text = "ProfileAuthView110".localize()
            self.strings = strings4
        default:()
        }
        setup()
    }
    private func setup(){
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.addSubview(collectionViewTag)
        collectionViewTag.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        collectionViewTag.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        collectionViewTag.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        collectionViewTag.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
    }
}
extension ProfileInfoBottomView:ProfileInfoProtocolDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, itemSizeAt indexPath: NSIndexPath) -> CGSize {
        let title = strings[indexPath.row]
        let kItemPadding:CGFloat = 20
        var size = title.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        size.width = CGFloat(ceilf(Float(size.width + CGFloat(kItemPadding * 2) + 2)))
        size.height = 30
        if size.width > collectionView.frame.size.width {
            size.width = collectionView.frame.size.width
        }
        let contentHeight = collectionView.contentSize.height
        let frameHeight = collectionView.frame.height
        if contentHeight < frameHeight{
            collectionView.contentOffset.y =  -(frameHeight - contentHeight)/2
        }
        return size
    }
}
