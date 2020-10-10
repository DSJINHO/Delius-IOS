//
//  Tab0GroupCell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 16/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Tab0GroupCell2:UICollectionViewCell{
    var opened=false
    var type:Int = 1
    
    var imgView1:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    
    var circleView1:UIView={
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
    
    
    var imgView2:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    
    var circleView2:UIView={
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
    
    
    
    var nameLabel1:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.font = UIFont.DeliusBoldType2()
        l.textAlignment = .center
        l.alpha = 0
        return l
    }()
    var nameLabel2:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.white
        l.font = UIFont.DeliusBoldType2()
        l.textAlignment = .center
        l.alpha = 0
        return l
    }()
    
    
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
    var scrollView:UIScrollView={
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var innerView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let whiteView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        return v
    }()
    var expandBtn:IconButton1!
    
    var extraLabel:UILabel={
        let l = UILabel()
        l.Tab0SubLabelProperty()
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.alpha = 0
        return l
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
    
    
    lazy var imgCollectionView:UICollectionView={
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.isPagingEnabled = true
        cv.delegate = self
        cv.isScrollEnabled = false
        cv.clipsToBounds = true
        cv.dataSource = self
        cv.alpha = 0
        return cv
    }()
    lazy var tagCollectionView:UICollectionView={
        let layout = MainTagCellLayout()
        layout.delegate = self
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    let container:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var tagArray=[String]()
    var imgArray=[UIImage]()
    var imgUrls = [URL]()
    
    
    
    var actionIndex:Int?
    
    
    var actionAnimator:ActionAnimatorView!
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        scrollView.delegate = self
        tagCollectionView.register(MainTagCell.self, forCellWithReuseIdentifier: "MainSoloTagCellid")
        imgCollectionView.register(Tab0GroupImageCell.self, forCellWithReuseIdentifier: "Tab0GroupImageCell2id")
        expandBtn = IconButton1(imgName: "Expand", color: .MainBlackColor1(), frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        
        actionAnimator = ActionAnimatorView(frame: CGRect(x:0,y:0,width:300,height:300))
        actionAnimator.translatesAutoresizingMaskIntoConstraints = false
        actionAnimator.backgroundColor = UIColor.clear
        setup(width: frame.width)
    }
    
    
    var nsWhite:NSLayoutConstraint!
    var nsImgCV:NSLayoutConstraint!
    var nsName:NSLayoutConstraint!
    var nsCollection:NSLayoutConstraint!
    var nsStatus:NSLayoutConstraint!
    var nsScroll:NSLayoutConstraint!
    var nsInner:NSLayoutConstraint!
    
    
    var nsCX1,nsCY1,nsW1,nsH1:NSLayoutConstraint!
    var nsCX2,nsCY2,nsW2,nsH2:NSLayoutConstraint!
    
    private func setup(width:CGFloat){
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
        
        imgCollectionView.addSubview(container)
        container.topAnchor.constraint(equalTo: imgCollectionView.topAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: imgCollectionView.bottomAnchor).isActive = true
        container.leftAnchor.constraint(equalTo: imgCollectionView.leftAnchor).isActive = true
        container.rightAnchor.constraint(equalTo: imgCollectionView.rightAnchor).isActive = true
        container.backgroundColor = UIColor.black
        
        scrollView.addSubview(whiteView)
        nsWhite = whiteView.topAnchor.constraint(equalTo: imgCollectionView.bottomAnchor, constant: -20)
        nsWhite.isActive = true
        whiteView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        whiteView.widthAnchor.constraint(equalToConstant: width).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: 1200).isActive = true
        
        scrollView.addSubview(actionAnimator)
        actionAnimator.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor,constant: 135).isActive = true
        actionAnimator.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        actionAnimator.widthAnchor.constraint(equalToConstant: 300).isActive = true
        actionAnimator.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        
        
        
        
        
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
        
        
        let term:CGFloat = 30
        let param = ( width - 60 ) / 19
        self.addSubview(circleView1)
        nsCX1 = circleView1.centerXAnchor.constraint(equalTo: imgCollectionView.leftAnchor, constant: term + param * 5)
        nsCX1.isActive = true
        nsCY1 = circleView1.centerYAnchor.constraint(equalTo: imgCollectionView.topAnchor, constant: term + param*5)
        nsCY1.isActive = true
        nsW1 = circleView1.rightAnchor.constraint(equalTo: circleView1.leftAnchor, constant: param*10)
        nsW1.isActive = true
        nsH1 = circleView1.bottomAnchor.constraint(equalTo: circleView1.topAnchor, constant: param*10)
        nsH1.isActive = true
        
        self.addSubview(circleView2)
        nsCX2 = circleView2.centerXAnchor.constraint(equalTo: imgCollectionView.leftAnchor, constant: width - term - param*5)
        nsCX2.isActive = true
        nsCY2 = circleView2.centerYAnchor.constraint(equalTo: imgCollectionView.topAnchor, constant: width - term - param*5)
        nsCY2.isActive = true
        nsW2 = circleView2.rightAnchor.constraint(equalTo: circleView2.leftAnchor, constant: param*10)
        nsW2.isActive = true
        nsH2 = circleView2.bottomAnchor.constraint(equalTo: circleView2.topAnchor, constant: param*10)
        nsH2.isActive = true
        
        circleView1.layer.cornerRadius = param*5
        circleView2.layer.cornerRadius = param*5
        
        circleView1.addSubview(imgView1)
        imgView1.topAnchor.constraint(equalTo: circleView1.topAnchor, constant: 5).isActive = true
        imgView1.leftAnchor.constraint(equalTo: circleView1.leftAnchor, constant: 5).isActive = true
        imgView1.rightAnchor.constraint(equalTo: circleView1.rightAnchor, constant: -5).isActive = true
        imgView1.bottomAnchor.constraint(equalTo: circleView1.bottomAnchor, constant: -5).isActive = true
        
        circleView2.addSubview(imgView2)
        imgView2.topAnchor.constraint(equalTo: circleView2.topAnchor, constant: 5).isActive = true
        imgView2.leftAnchor.constraint(equalTo: circleView2.leftAnchor, constant: 5).isActive = true
        imgView2.rightAnchor.constraint(equalTo: circleView2.rightAnchor, constant: -5).isActive = true
        imgView2.bottomAnchor.constraint(equalTo: circleView2.bottomAnchor, constant: -5).isActive = true
        
        imgView1.layer.cornerRadius = param*5 - 5
        imgView2.layer.cornerRadius = param*5 - 5
        
        
        
        self.addSubview(nameLabel1)
        nameLabel1.topAnchor.constraint(equalTo: circleView1.bottomAnchor, constant: 3).isActive = true
        nameLabel1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nameLabel1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLabel1.centerXAnchor.constraint(equalTo: circleView1.centerXAnchor).isActive = true
        
        self.addSubview(nameLabel2)
        nameLabel2.topAnchor.constraint(equalTo: circleView2.bottomAnchor,constant: 3).isActive = true
        nameLabel2.centerXAnchor.constraint(equalTo: circleView2.centerXAnchor).isActive = true
        nameLabel2.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nameLabel2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        
        scrollView.sendSubviewToBack(whiteView)
        scrollView.contentSize = CGSize(width: 0, height: 1000)
        
        imgCollectionView.reloadData()
        tagCollectionView.reloadData()
        
    }
    func updateCollectionVIew(tagList:[String],imgList:[UIImage]){
        tagArray = tagList
        imgArray = imgList
        imgCollectionView.reloadData()
        tagCollectionView.reloadData()
    }
    override func prepareForReuse() {
        imgUrls = []
        tagArray = []
        imgCollectionView.reloadData()
        tagCollectionView.reloadData()
    }
    
    func setLike(){
        actionAnimator.showLike()
    }
    func setDeli(){
        actionAnimator.showDeli()
    }
    func setPass(){
        actionAnimator.showPass()
    }
    func setDefault(){
        actionAnimator.showDefault()
    }
    func setMatch(){
        actionAnimator.showMatch()
    }
    func setReport(){
        actionAnimator.showReport()
    }
    func openAnimation(){
        let d = ( self.frame.width - 60 ) / 19
        let term:CGFloat = 30
        let Animator = UIViewPropertyAnimator(duration: 0.1, curve: .easeIn, animations: {
            self.nsCX1.constant = d * 8 + term
            self.nsCX2.constant = d * 15 + term
            self.nsCY1.constant = d * 10 + term
            self.nsCY2.constant = d * 10 + term
            self.nsW1.constant = d * 12
            self.nsW2.constant = d * 4
            self.nsH1.constant = d * 12
            self.nsH2.constant = d * 4
            self.circleView1.layer.cornerRadius = d * 6
            self.circleView2.layer.cornerRadius = d * 2
            self.imgView1.layer.cornerRadius = d*6 - 5
            self.imgView2.layer.cornerRadius = d*2 - 5
            self.nameLabel1.alpha = 1
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                
            }
        }
    }
    func closeAnimation(){
        let d = ( self.frame.width - 60 ) / 19
        let term:CGFloat = 30
        let Animator = UIViewPropertyAnimator(duration: 0.1, curve: .easeIn, animations: {
            self.nsCX1.constant = d * 5 + term
            self.nsCX2.constant = self.frame.width - d*5 - term
            self.nsCY1.constant = d*5 + term
            self.nsCY2.constant = self.frame.width - d*5 - term
            self.nsW1.constant = d * 10
            self.nsW2.constant = d * 10
            self.nsH1.constant = d * 10
            self.nsH2.constant = d * 10
            self.circleView1.layer.cornerRadius = d * 5
            self.circleView2.layer.cornerRadius = d * 5
            self.imgView1.layer.cornerRadius = d*5 - 5
            self.imgView2.layer.cornerRadius = d*5 - 5
            self.nameLabel1.alpha = 0
            self.nameLabel2.alpha = 0
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                
            }
        }
    }

}
extension Tab0GroupCell2:UICollectionViewDelegate{

}
extension Tab0GroupCell2:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,MainTagCellProtocolDelegate,UIScrollViewDelegate{
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

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tagCollectionView{
            return tagArray.count
            
        }else{
            return imgUrls.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tagCollectionView{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainSoloTagCellid", for: indexPath) as! MainTagCell
            switch indexPath.row{
            case 0:cell.imgView.image = UIImage(named: "LocationTag")
            default:cell.imgView.image = UIImage(named: "HashTag")
            }
            cell.titleLabel.text = tagArray[indexPath.row]
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Tab0GroupImageCell2id", for: indexPath) as! Tab0GroupImageCell
            let url = imgUrls[indexPath.row]
            cell.imgView.sd_setImage(with: url)
            
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == imgCollectionView{
            return CGSize(width: frame.width, height: frame.width)
        }else{
            return CGSize.zero
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        imgCollectionView.reloadData()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == imgCollectionView{
            imgAnimation(offset: scrollView.contentOffset.x)
            return
        }
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
    private func imgAnimation(offset:CGFloat){
        let width = self.frame.width
        let d = (width - 60) / 19
        let term:CGFloat = 30
        let ratio = offset/width
        
        print(offset,"offset")
        
        

        self.nsCX1.constant = d * 8 + term - ratio * ( d * 4 )
        self.nsCX2.constant = d * 15 + term - ratio * ( d * 4 )
        self.nsCY1.constant = d * 10 + term
        self.nsCY2.constant = d * 10 + term
        self.nsW1.constant = d * 12 - ratio * (d * 8 )
        self.nsW2.constant = d * 4 + ratio * (d * 8 )
        self.nsH1.constant = d * 12 - ratio * (d * 8 )
        self.nsH2.constant = d * 4 + ratio * (d * 8 )
        self.circleView1.layer.cornerRadius = d * 6 - ratio * (d * 4 )
        self.circleView2.layer.cornerRadius = d * 2 + ratio * (d * 4 )
        self.imgView1.layer.cornerRadius = d*6 - 5 - ratio * (d * 4 )
        self.imgView2.layer.cornerRadius = d*2 - 5 + ratio * (d * 4 )
        self.nameLabel1.alpha = 1 - ratio
        self.nameLabel2.alpha = ratio
        
    }


}


