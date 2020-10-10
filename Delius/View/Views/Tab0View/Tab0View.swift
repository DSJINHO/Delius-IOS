//
//  Tab0View.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 16/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
final class Tab0View:UIView{
    
    var backView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true
        cv.isScrollEnabled = false
        cv.clipsToBounds = false
        cv.alpha = 0
        return cv
    }()
    var descriptionLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.black
        l.font = UIFont.DeliusBoldType1()
        l.textAlignment = .center
        l.text = "로딩중"
        return l
    }()
    var btnView:MainGradientView!
    var leftBtn:IconButton2!
    var likeBtn:IconButton2!
    var deliBtn:IconButton2!
    var reportBtn:IconButton2!
    var rightBtn:IconButton2!
    
    var nsLeft:NSLayoutConstraint!
    var nsRight:NSLayoutConstraint!
    
    var nsTop:NSLayoutConstraint!
    var nsBack:NSLayoutConstraint!
    
    
    var findingView:LocationIndicatorTimerView!
    var blockView:Tab0BlockedView!
    var suspendingView:Tab0SuspendingView!
    var errorView:Tab0ErrorView!
    var noLogView:Tab0NoLogView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
//        self.translatesAutoresizingMaskIntoConstraints = false
        
        let btnWd = ( frame.width - 60 ) / 5
        let btnFrame = CGRect(x:0,y:0,width:btnWd,height:30)
//        BtnBackView = UIView(frame: CGRect(x:0,y:0,width:frame.width,height:frame.width*2))
        //backView = CrossGradationView(frame: CGRect(x:1,y:0,width:frame.width,height:frame.width*2))
        
        
        
        
        btnView = MainGradientView(frame: CGRect(x:0,y:0,width:frame.width-60,height:60))
        leftBtn = IconButton2(imgName: "MainLeft", color: .white, frame: btnFrame)
        likeBtn = IconButton2(imgName: "MainLike", color: .white, frame: btnFrame)
        deliBtn = IconButton2(imgName: "MainDeli", color: .white, frame: btnFrame)
        reportBtn = IconButton2(imgName: "MainReport", color: .white, frame: btnFrame)
        rightBtn = IconButton2(imgName: "MainRight", color: .white, frame: btnFrame)
        
        
        
        btnView.alpha = 0
        
        
        setup(btnWd:btnWd,wd:frame.width)
    }
    func showFindingView(url:URL){
        findingView = LocationIndicatorTimerView(frame: self.frame, imgUrl: url)
        findingView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(findingView)
        findingView.topAnchor.constraint(equalTo: topAnchor, constant: 200).isActive = true
        findingView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        findingView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        findingView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    func removeIndicatorView(){
        findingView.removeFromSuperview()
        findingView = nil
    }
    func showBlockView(){
        let blockView = Tab0BlockedView(frame: self.frame)
        self.addSubview(blockView)
        blockView.topAnchor.constraint(equalTo: topAnchor,constant: 200).isActive = true
        blockView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        blockView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        blockView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    func removeBlockView(){
        blockView.removeFromSuperview()
        blockView = nil
    }
    func showSuspendingView(){
        let suspendingView = Tab0SuspendingView(frame: self.frame)
        self.addSubview(suspendingView)
        suspendingView.topAnchor.constraint(equalTo: topAnchor,constant: 200).isActive = true
        suspendingView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        suspendingView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        suspendingView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    func removeSuspendingView(){
        suspendingView.removeFromSuperview()
        suspendingView = nil
    }
    func showErrorView(){
        let errorView = Tab0ErrorView(frame: self.frame)
        self.addSubview(errorView)
        errorView.topAnchor.constraint(equalTo: topAnchor,constant: 200).isActive = true
        errorView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        errorView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        errorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    func removeErrorView(){
        errorView.removeFromSuperview()
        errorView = nil
    }
    func showNoLogView(completion:@escaping(UILabel)->Void){
        let noLogView = Tab0NoLogView(frame: self.frame)
        self.addSubview(noLogView)
        noLogView.topAnchor.constraint(equalTo: topAnchor,constant: 100).isActive = true
        noLogView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        noLogView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        noLogView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        completion(noLogView.timeLabel)
    }
    func removeNoLogVIew(){
        
    }
    private func setup(btnWd:CGFloat,wd:CGFloat){
        
        backView.alpha = 0
        self.addSubview(backView)
        nsBack = backView.bottomAnchor.constraint(equalTo: topAnchor, constant: 0)
        nsBack.isActive = true
        backView.heightAnchor.constraint(equalToConstant: wd*2).isActive = true
        backView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        
        
        
        self.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        
//        BtnBackView.layer.cornerRadius = 28
//        self.addSubview(BtnBackView)
//        BtnBackView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -20).isActive = true
//        nsLeft = BtnBackView.leftAnchor.constraint(equalTo: leftAnchor,constant:30)
//        nsLeft.isActive = true
//        nsRight = BtnBackView.rightAnchor.constraint(equalTo: rightAnchor,constant: -30)
//        nsRight.isActive = true
//        BtnBackView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        
        btnView.layer.cornerRadius = 28
        btnView.clipsToBounds = true
        self.addSubview(btnView)
        btnView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -20).isActive = true
        nsLeft = btnView.leftAnchor.constraint(equalTo: leftAnchor,constant:30)
        nsLeft.isActive = true
        nsRight = btnView.rightAnchor.constraint(equalTo: rightAnchor,constant: -30)
        nsRight.isActive = true
        btnView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        let btnHeight:CGFloat = 50
        
        btnView.addSubview(deliBtn)
        deliBtn.centerYAnchor.constraint(equalTo: btnView.centerYAnchor).isActive = true
        deliBtn.centerXAnchor.constraint(equalTo: btnView.centerXAnchor).isActive = true
        deliBtn.heightAnchor.constraint(equalToConstant: btnHeight).isActive = true
        deliBtn.widthAnchor.constraint(equalToConstant: btnWd).isActive = true
        
        
        btnView.addSubview(likeBtn)
        likeBtn.centerYAnchor.constraint(equalTo: btnView.centerYAnchor).isActive = true
        likeBtn.rightAnchor.constraint(equalTo: deliBtn.leftAnchor).isActive = true
        likeBtn.heightAnchor.constraint(equalToConstant: btnHeight).isActive = true
        likeBtn.widthAnchor.constraint(equalToConstant: btnWd).isActive = true
        
        
        btnView.addSubview(reportBtn)
        reportBtn.centerYAnchor.constraint(equalTo: btnView.centerYAnchor).isActive = true
        reportBtn.leftAnchor.constraint(equalTo: deliBtn.rightAnchor).isActive = true
        reportBtn.widthAnchor.constraint(equalToConstant: btnWd).isActive = true
        reportBtn.heightAnchor.constraint(equalToConstant: btnHeight).isActive = true
        
        
        btnView.addSubview(leftBtn)
        leftBtn.centerYAnchor.constraint(equalTo: btnView.centerYAnchor).isActive = true
        leftBtn.widthAnchor.constraint(equalToConstant: btnWd).isActive = true
        leftBtn.heightAnchor.constraint(equalToConstant: btnHeight).isActive = true
        leftBtn.rightAnchor.constraint(equalTo: likeBtn.leftAnchor, constant: 5).isActive = true
        
        
        
        btnView.addSubview(rightBtn)
        rightBtn.centerYAnchor.constraint(equalTo: btnView.centerYAnchor).isActive = true
        rightBtn.leftAnchor.constraint(equalTo: reportBtn.rightAnchor, constant: -5).isActive = true
        rightBtn.widthAnchor.constraint(equalToConstant: btnWd).isActive = true
        rightBtn.heightAnchor.constraint(equalToConstant: btnHeight).isActive = true
        
        

        
    }
}
