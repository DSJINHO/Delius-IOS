//
//  ProfileAuthViewSub3.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 03/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
final class ProfileAuthViewSub3:UIView{
    
    var imgArray = [UIImage(named: "c")]
    lazy var collectionView: UICollectionView = {
        let layout = ProfileImageFlowLayout()
        layout.delegate = self
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.clear
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(AddPlusCell.self, forCellWithReuseIdentifier: "AuthProfileImageCell")
        
        setup(frame: frame)
    }
    private func setup(frame:CGRect){
        
        self.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: frame.width/2).isActive = true
        
    }
    
}

extension ProfileAuthViewSub3:ProfileImageProtocolDelegate{
    func collectionView(_ collectionView: UICollectionView, itemSizeAt indexPath: NSIndexPath) -> CGSize {
        if indexPath.row == 0{
            return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.width/2)
        }else{
            return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.width/4)
        }
    }
}
