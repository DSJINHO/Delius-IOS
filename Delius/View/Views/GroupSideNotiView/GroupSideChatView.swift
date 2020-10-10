//
//  GroupSideChatView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/05.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class GroupSideChatView:UIView{
    
    lazy var chatCollectionView:UICollectionView={
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    var emptyView:GroupChatEmptyView!
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    private func setup(){
        self.addSubview(chatCollectionView)
        chatCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        chatCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        chatCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        chatCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    func showEmptyView(){
        emptyView = GroupChatEmptyView(frame: CGRect.zero)
        self.addSubview(emptyView)
        emptyView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        emptyView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        emptyView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        emptyView.heightAnchor.constraint(equalToConstant: self.frame.width).isActive = true
    }
    func removeEmptyView(){
        emptyView.removeFromSuperview()
        emptyView = nil
    }
}
