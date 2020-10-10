//
//  WelcomeView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 02/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

final class WelcomeView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.clear
        cv.showsHorizontalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        return cv
    }()
    let bottomView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    
    var phoneLoginBtn:UIButton={
        let b = UIButton()
        b.DeliusType1(txt: "WelcomeView101".localize(), color: .white, backColor: .clear)
        return b
    }()
    var emailLoginBtn:UIButton={
        let b = UIButton()
        b.DeliusType1(txt: "WelcomeView102".localize(), color: .gray, backColor: .clear)
        return b
    }()
    let imgArray = [UIImage(named: "plate1"),UIImage(named: "plate2"),UIImage(named: "plate3")]
    let stringArray = ["WelcomeCell001".localize(),"WelcomeCell002".localize(),"WelcomeCell003".localize()]
    let subStringArray = ["WelcomeCell004".localize(),"WelcomeCell102".localize(),"WelcomeCell103".localize()]
    
    private var descriptionLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "WelcomeView001".localize(), txtAlignment: .center, ft: UIFont.DeliusSystemType3(), txtColor: .MainBlackColor2())
        return l
    }()
    var gradationView:WelcomeGradientView!
    var nsGradient:NSLayoutConstraint!
    var nsLeft:NSLayoutConstraint!
    var timer:Timer!
    
    let pageControl : UIPageControl = {
        let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.numberOfPages = 3
        pc.currentPage = 0
        pc.pageIndicatorTintColor = UIColor.MainLightGrayColor()
        pc.currentPageIndicatorTintColor = UIColor.MainGrayColor()
        pc.contentHorizontalAlignment = .center
        return pc
    }()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        gradationView = WelcomeGradientView(frame: CGRect(x:0,y:0,width: frame.width,height:60))
        collectionView.register(WelcomeCell.self, forCellWithReuseIdentifier: "welcomeCell")
        setup(width:frame.width)
        setTimer(wd:frame.width)
    }
    private func setup(width:CGFloat){
        self.addSubview(bottomView)
        bottomView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bottomView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        bottomView.addSubview(gradationView)
        nsGradient = gradationView.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 0)
        nsGradient.isActive = true
        gradationView.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        gradationView.widthAnchor.constraint(equalToConstant: width*6).isActive = true
        gradationView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        bottomView.addSubview(phoneLoginBtn)
        phoneLoginBtn.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        phoneLoginBtn.leftAnchor.constraint(equalTo: bottomView.leftAnchor).isActive = true
        phoneLoginBtn.rightAnchor.constraint(equalTo: bottomView.rightAnchor).isActive = true
        phoneLoginBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        bottomView.addSubview(emailLoginBtn)
        emailLoginBtn.topAnchor.constraint(equalTo: phoneLoginBtn.bottomAnchor).isActive = true
        emailLoginBtn.leftAnchor.constraint(equalTo: bottomView.leftAnchor).isActive = true
        emailLoginBtn.rightAnchor.constraint(equalTo: bottomView.rightAnchor).isActive = true
        emailLoginBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        bottomView.addSubview(descriptionLabel)
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: bottomView.rightAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: bottomView.leftAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        descriptionLabel.baselineAdjustment = .alignBaselines
        
        
        
        self.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomView.topAnchor,constant: -30).isActive = true
        
        self.addSubview(pageControl)
        pageControl.bottomAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        pageControl.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pageControl.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    private func setTimer(wd:CGFloat){
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true){(Timer) in
            let page = Int(self.collectionView.contentOffset.x/wd)
            var willMoveOffset = CGFloat(page+1) * wd
            if page == 2{
                willMoveOffset = 0
            }
            self.setContentOffset(currentPage:page,wd: willMoveOffset)
        }
    }
    private func setContentOffset(currentPage page:Int,wd:CGFloat){
        self.collectionView.setContentOffset(CGPoint(x: wd, y: 0), animated: true)
        
    }
}


extension WelcomeView:UICollectionViewDelegate{
    
}
extension WelcomeView:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "welcomeCell", for: indexPath) as! WelcomeCell
        cell.titleLabel.text = stringArray[indexPath.row]
        if indexPath.row == 0{
            cell.subLabel.text = subStringArray[indexPath.row]
        }else{
            cell.subLabel.text = subStringArray[indexPath.row]
        }
        cell.imgView.image = imgArray[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.size.height)
    }
    
}
extension WelcomeView:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let vw = frame.width
        let offset = scrollView.contentOffset.x
        let page = Int(offset/vw)
        nsGradient.constant =  -scrollView.contentOffset.x
        pageControl.currentPage = page
        switch page{
        case 0:
            pageControl.currentPageIndicatorTintColor = UIColor.MainGrayColor()
        case 1:
            pageControl.currentPageIndicatorTintColor = UIColor.MainGrayColor()
        case 2:
            pageControl.currentPageIndicatorTintColor = UIColor.MainGrayColor()
        default:()
        }
    }
}
