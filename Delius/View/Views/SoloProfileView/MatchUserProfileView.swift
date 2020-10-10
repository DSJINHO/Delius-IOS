//
//  FeedUserProfileView.swift
//  Delius
//
//  Created by 박진호 on 2020/07/07.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class MatchUserProfileView:UIView{
    var nameLabel:UILabel={
        let l = UILabel()
        l.Tab0TitleLabelProperty()
        return l
    }()
    var statusLabel:UILabel={
        let l = UILabel()
        l.Tab0SubLabelProperty()
        return l
    }()
    var extraLabel:UILabel={
        let l = UILabel()
        l.Tab0SubLabelProperty()
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.alpha = 0
        return l
    }()
    var scrollView:UIScrollView={
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = false
        v.isScrollEnabled = false
        return v
    }()
    var whiteView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    var circleView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOffset = CGSize(width: 10, height: 10)
        v.layer.shadowRadius = 10
        v.layer.shadowOpacity = 0.3
        v.layer.masksToBounds = false
        return v
    }()
    
    var reportView:ReportViewInCell!
    lazy var imgCollectionView:UICollectionView={
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.isPagingEnabled = true
        cv.clipsToBounds = true
        return cv
    }()
    lazy var tagCollectionView:UICollectionView={
        let layout = MainTagCellLayout()
        layout.delegate = self
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = -10
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    var lineView1:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainLightGrayColor()
        return v
    }()
    var lineView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainLightGrayColor()
        v.alpha = 0
        return v
    }()
    
    var tagArray=[String]()
    var imgArray=[UIImage]()
    var imgUrls=[URL]()
    
    
    
    var nsWhite:NSLayoutConstraint!
    var nsImgCV:NSLayoutConstraint!
    
    var nsWidth:NSLayoutConstraint!
    var nsHeight:NSLayoutConstraint!
    
    
    var btnView:MainGradientView!
    var likeBtn:MainActionButton!
    var deliBtn:MainActionButton!
    var rejectBtn:MainActionButton!
    var closeBtn:MainActionButton!
    
    
    
    var nsImgCollection:NSLayoutConstraint!
    var nsContent:NSLayoutConstraint!
    var nsName:NSLayoutConstraint!
    var nsScroll:NSLayoutConstraint!
    required init?(coder:NSCoder){
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        self.alpha = 0
        
        let d = ( frame.width - 60 ) / 5
        let btnFrame = CGRect(x:0,y:0,width:d,height:d)
        
        
        scrollView.delegate = self
        setup(width: frame.width,d:d)
        
    }
    private func setup(width:CGFloat,d:CGFloat){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let btmPadding = window.safeAreaInsets.bottom
        
        scrollView.contentSize = CGSize(width: 0, height: 1000)
        self.addSubview(scrollView)
        nsScroll = scrollView.topAnchor.constraint(equalTo: topAnchor,constant: 80)
        nsScroll.isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        scrollView.addSubview(imgCollectionView)
        nsImgCV = imgCollectionView.topAnchor.constraint(equalTo: scrollView.topAnchor)
        nsImgCV.isActive = true
        imgCollectionView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        imgCollectionView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imgCollectionView.heightAnchor.constraint(equalToConstant: width).isActive = true
        
        
        scrollView.sendSubviewToBack(circleView)
        
        scrollView.addSubview(whiteView)
        nsWhite = whiteView.topAnchor.constraint(equalTo: imgCollectionView.bottomAnchor, constant: -20)
        nsWhite.isActive = true
        whiteView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        whiteView.widthAnchor.constraint(equalToConstant: width).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: 1200).isActive = true
        
        scrollView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 50).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 50).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: width-100).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        scrollView.addSubview(statusLabel)
        statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        statusLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        statusLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        scrollView.addSubview(lineView1)
        lineView1.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10).isActive = true
        lineView1.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        lineView1.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        lineView1.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        scrollView.addSubview(tagCollectionView)
        tagCollectionView.topAnchor.constraint(equalTo: lineView1.bottomAnchor, constant: 8).isActive = true
        tagCollectionView.leftAnchor.constraint(equalTo: lineView1.leftAnchor, constant: -5).isActive = true
        tagCollectionView.widthAnchor.constraint(equalToConstant: width-90).isActive = true
        tagCollectionView.bottomAnchor.constraint(equalTo: tagCollectionView.topAnchor, constant: 30).isActive = false
        
        scrollView.addSubview(lineView2)
        lineView2.topAnchor.constraint(equalTo: tagCollectionView.bottomAnchor, constant: 15).isActive = true
        lineView2.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        lineView2.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        lineView2.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        scrollView.addSubview(extraLabel)
        extraLabel.topAnchor.constraint(equalTo:lineView2.bottomAnchor,constant:2).isActive = true
        extraLabel.leftAnchor.constraint(equalTo:nameLabel.leftAnchor).isActive = true
        extraLabel.rightAnchor.constraint(equalTo:nameLabel.rightAnchor).isActive = true
        extraLabel.heightAnchor.constraint(equalToConstant:60).isActive = true
        
        
        scrollView.sendSubviewToBack(whiteView)
        
        imgCollectionView.reloadData()
        tagCollectionView.reloadData()
        
        
        let d = ( frame.width - 60 ) / 5
        let btnFrame = CGRect(x:0,y:0,width:d,height:d)
        
        btnView = MainGradientView(frame: CGRect(x:0,y:0,width:60,height:60))
        btnView.layer.cornerRadius = 28
        btnView.clipsToBounds = true
        
        self.addSubview(btnView)
        btnView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -btmPadding - 40).isActive = true
        btnView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        btnView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        btnView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        closeBtn = MainActionButton(imgName: "MainReport", color: .white, frame: btnFrame)
        btnView.addSubview(closeBtn)
        closeBtn.centerXAnchor.constraint(equalTo: btnView.centerXAnchor).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: d).isActive = true
        closeBtn.widthAnchor.constraint(equalToConstant: d).isActive = true
        closeBtn.centerYAnchor.constraint(equalTo: btnView.centerYAnchor).isActive = true
        
    }
    func OpenAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.15, curve: .easeOut, animations: {
            self.imgCollectionView.alpha = 1
            self.nsScroll.constant = 0
            self.alpha = 1
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                self.scrollView.isScrollEnabled = true
            }
        }
        
    }
    func closeAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.15, curve: .easeIn, animations: {
            self.imgCollectionView.alpha = 0
            self.nsScroll.constant = 80
            self.alpha = 0
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{ position in
            if position == .end{
                completion()
            }
        }
    }
}
extension MatchUserProfileView:MainTagCellProtocolDelegate{
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


extension MatchUserProfileView:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        if offset <= 0{
            let convertedValue = -offset/self.frame.width
            imgCollectionView.transform = CGAffineTransform(scaleX: 1 + convertedValue, y: 1 + convertedValue)
            self.nsImgCV.constant = offset
            self.nsWhite.constant = -20 - offset
        }else{
            imgCollectionView.transform = CGAffineTransform(scaleX: 1, y: 1)
            whiteView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.nsImgCV.constant = 0
            self.nsWhite.constant = -20
        }
    }
}

