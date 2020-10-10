//
//  GroupProfileDetailView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/09.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class GroupProfileDetailView:UIView{
    
    var tagArray:[String]!
    
    let scrollView:UIScrollView={
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.isScrollEnabled = false
        return v
    }()
    let gradationView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.gradientColor()[2]
        v.alpha = -1
        return v
    }()
    let contentView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.alpha = 0
        return v
    }()
    lazy var imgCollectionView:UICollectionView={
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.isPagingEnabled = true
        return cv
    }()
    var nameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType1()
        l.textColor = UIColor.MainBlackColor1()
        l.textAlignment = .center
        return l
    }()
    var statusLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType2()
        l.textColor = UIColor.MainBlackColor3()
        l.textAlignment = .center
        return l
    }()
    lazy var tagCollectionView:UICollectionView={
        let layout = MainTagCellLayout()
        layout.delegate = self
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    var extraLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor3()
        l.font = UIFont.DeliusBoldType3()
        l.textAlignment = .left
        return l
    }()
    
    
    var nsImgCollection:NSLayoutConstraint!
    var nsContent:NSLayoutConstraint!
    required init?(coder:NSCoder){
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup(width:frame.width)
        
    }
    private func setup(width:CGFloat){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        self.addSubview(gradationView)
        gradationView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        gradationView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        gradationView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        gradationView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        scrollView.contentSize = CGSize(width: 0, height: 1000)
        self.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: topAnchor,constant: topPadding).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        scrollView.addSubview(imgCollectionView)
        imgCollectionView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 60).isActive = true
        nsImgCollection = imgCollectionView.leftAnchor.constraint(equalTo: scrollView.leftAnchor,constant: 100)
        nsImgCollection.isActive = true
        imgCollectionView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imgCollectionView.heightAnchor.constraint(equalToConstant: width).isActive = true
        
        scrollView.addSubview(contentView)
        nsContent = contentView.topAnchor.constraint(equalTo: imgCollectionView.bottomAnchor,constant: 300)
        nsContent.isActive = true
        contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: width).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        
        contentView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 60).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        contentView.addSubview(statusLabel)
        statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        statusLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        statusLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(tagCollectionView)
        tagCollectionView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor,constant: 20).isActive = true
        tagCollectionView.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        tagCollectionView.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        tagCollectionView.bottomAnchor.constraint(equalTo: tagCollectionView.topAnchor,constant: 0).isActive = false
        
        
        contentView.addSubview(extraLabel)
        extraLabel.topAnchor.constraint(equalTo: tagCollectionView.bottomAnchor, constant: 10).isActive = true
        extraLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        extraLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        extraLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.bringSubviewToFront(imgCollectionView)
    }
    func OpenAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.15, curve: .easeOut, animations: {
            self.nsImgCollection.constant = 0
            self.nsContent.constant = -60
            self.gradationView.alpha = 1
            self.contentView.alpha = 1
            self.imgCollectionView.alpha = 1
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                self.scrollView.isScrollEnabled = true
            }
        }
        
    }
}
extension GroupProfileDetailView:MainTagCellProtocolDelegate{
    func collectionView(_ collectionView: UICollectionView, itemSizeAt indexPath: NSIndexPath) -> CGSize {
        let title = tagArray[indexPath.row]
        var size = title.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
        size.width = CGFloat(ceilf(Float(size.width + CGFloat(38))))
        size.height = 30
        if size.width > collectionView.frame.size.width {
            size.width = collectionView.frame.size.width
        }
        self.layoutIfNeeded()
        return size
    }
}
