//
//  GroupSideNotiView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/05.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class GroupSideNotiView:UIView{
    
    var feedBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(UIColor.MainLightGrayColor(), for: .normal)
        b.setTitle("GroupSideNotiView001".localize(), for: .normal)
        b.titleLabel!.font = UIFont.DeliusBoldType2()
        b.titleLabel!.textAlignment = .center
        b.titleLabel!.numberOfLines = 0
        b.titleLabel!.lineBreakMode = .byWordWrapping
        return b
    }()
    var waitBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(UIColor.MainLightGrayColor(), for: .normal)
        b.setTitle("GroupSideNotiView002".localize(), for: .normal)
        b.titleLabel!.font = UIFont.DeliusBoldType2()
        b.titleLabel!.textAlignment = .center
        b.titleLabel!.numberOfLines = 0
        b.titleLabel!.lineBreakMode = .byWordWrapping
        return b
    }()
    
    lazy var feedCollectionView:UICollectionView={
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    lazy var waitCollectionView:UICollectionView={
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.isHidden = true
        return cv
    }()
    var feedEmptyView:GroupFeedEmptyView!
    var voteEmptyView:GroupVoteEmptyView!
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup(leftWidth: 80)
    }
    private func setup(leftWidth w:CGFloat){
        self.addSubview(feedBtn)
        feedBtn.topAnchor.constraint(equalTo: topAnchor,constant: 20).isActive = true
        feedBtn.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        feedBtn.widthAnchor.constraint(equalToConstant: w - 20).isActive = true
        feedBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.addSubview(waitBtn)
        waitBtn.topAnchor.constraint(equalTo: feedBtn.bottomAnchor, constant: 20).isActive = true
        waitBtn.leftAnchor.constraint(equalTo: feedBtn.leftAnchor).isActive = true
        waitBtn.rightAnchor.constraint(equalTo: feedBtn.rightAnchor).isActive = true
        waitBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.addSubview(feedCollectionView)
        feedCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        feedCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: w).isActive = true
        feedCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        feedCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(waitCollectionView)
        waitCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        waitCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: w).isActive = true
        waitCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        waitCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    func showFeedEmptyView(){
        if let emptyView = voteEmptyView{
            
            if !voteEmptyView.isHidden{
                voteEmptyView.isHidden = true
            }
            removeVoteEmptyView()
        }
        feedEmptyView = GroupFeedEmptyView(frame: CGRect.zero)
        self.addSubview(feedEmptyView)
        feedEmptyView.leftAnchor.constraint(equalTo: feedCollectionView.leftAnchor).isActive = true
        feedEmptyView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        feedEmptyView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        feedEmptyView.heightAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        feedEmptyView.isHidden = false
    }
    func showVoteEmptyView(){
        if let emptyView = feedEmptyView{
            if !feedEmptyView.isHidden{
                feedEmptyView.isHidden = true
            }
            removeFeedEmptyView()
            
        }
        voteEmptyView = GroupVoteEmptyView(frame: CGRect.zero)
        self.addSubview(voteEmptyView)
        voteEmptyView.leftAnchor.constraint(equalTo: waitCollectionView.leftAnchor).isActive = true
        voteEmptyView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        voteEmptyView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        voteEmptyView.heightAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        voteEmptyView.isHidden = false
    }
    func removeFeedEmptyView(){
        feedEmptyView.removeFromSuperview()
        feedEmptyView = nil
    }
    func removeVoteEmptyView(){
        voteEmptyView.removeFromSuperview()
        voteEmptyView = nil
    }
}
