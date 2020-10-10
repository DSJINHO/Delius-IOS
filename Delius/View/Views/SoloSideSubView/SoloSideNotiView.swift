//
//  SoloSideNotiView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/03.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SoloSideNotiView:UIView{
    lazy var notiCollectionView:UICollectionView={
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.headerReferenceSize = CGSize(width: 0, height: 10)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    var soloFeedEmptyView:SoloFeedEmptyView!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    private func setup(){
        self.addSubview(notiCollectionView)
        notiCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        notiCollectionView.leftAnchor.constraint(equalTo: leftAnchor,constant:30).isActive = true
        notiCollectionView.rightAnchor.constraint(equalTo: rightAnchor,constant:-30).isActive = true
        notiCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    func showEmptyView(){
        soloFeedEmptyView = SoloFeedEmptyView(frame: CGRect.zero)
        self.addSubview(soloFeedEmptyView)
        soloFeedEmptyView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        soloFeedEmptyView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        soloFeedEmptyView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        soloFeedEmptyView.heightAnchor.constraint(equalToConstant: self.frame.width).isActive = true
    }
    func removeEmptyView(){
        soloFeedEmptyView.removeFromSuperview()
        soloFeedEmptyView = nil
    }
}
