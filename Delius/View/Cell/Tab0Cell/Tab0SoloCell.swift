//
//  Tab0SoloCell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 16/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class Tab0SoloCell:UICollectionViewCell{
    
    var opened:Bool = false
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
        cv.isScrollEnabled = false
        cv.clipsToBounds = true
        cv.delegate = self
        cv.dataSource = self
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
        cv.delegate = self
        cv.dataSource = self
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
    var actionIndex:Int?
    
    
    var actionAnimator:ActionAnimatorView!
    
    
    
    var nsWhite:NSLayoutConstraint!
    var nsImgCV:NSLayoutConstraint!
    
    var nsWidth:NSLayoutConstraint!
    var nsHeight:NSLayoutConstraint!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = false
        reportView = ReportViewInCell()
        tagCollectionView.register(MainTagCell.self, forCellWithReuseIdentifier: "MainSoloTagCellid")
        imgCollectionView.register(Tab0SoloImageCell.self, forCellWithReuseIdentifier: "Tab0SoloImageCellid")

        actionAnimator = ActionAnimatorView(frame: CGRect(x:0,y:0,width:300,height: 300))
        actionAnimator.backgroundColor = UIColor.clear
        actionAnimator.translatesAutoresizingMaskIntoConstraints = false
       
        
        scrollView.delegate = self
        setup(width: frame.width)
    }
    
    
    var nsName:NSLayoutConstraint!
    var nsScroll:NSLayoutConstraint!
    private func setup(width:CGFloat){
        
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
        
        
        scrollView.addSubview(actionAnimator)
        actionAnimator.bottomAnchor.constraint(equalTo: whiteView.topAnchor,constant: 135).isActive = true
        actionAnimator.widthAnchor.constraint(equalToConstant: 300).isActive = true
        actionAnimator.heightAnchor.constraint(equalToConstant: 300).isActive = true
        actionAnimator.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        
        
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
        
        reportView.alpha = 0
        reportView.backgroundColor = .MainLightGrayColor2()
        scrollView.addSubview(reportView)
        reportView.topAnchor.constraint(equalTo: extraLabel.bottomAnchor, constant: 50).isActive = true
        reportView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        reportView.widthAnchor.constraint(equalToConstant: width).isActive = true
        reportView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        scrollView.sendSubviewToBack(whiteView)
        
        imgCollectionView.reloadData()
        tagCollectionView.reloadData()
        
//        scrollView.sendSubviewToBack(actionAnimator)
        
        
        
        
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
    func setReport(){
        actionAnimator.showReport()
    }
    func setMatch(){
        actionAnimator.showMatch()
    }
    func reloadImgCollection(im:[UIImage]){
        self.imgArray = im
        self.imgCollectionView.reloadData()
    }
    func updateImgCollectionView(uid:String,im:[[String:Any]]){
        CreateThumbUrl.createImageArray(uid: uid, imArr: im, completion: { (imgArray) in
            self.imgArray = imgArray
            self.imgCollectionView.reloadData()
        })
    }
    func updateCollectionVIew(tagList:[String]){
        tagArray = tagList
        tagCollectionView.reloadData()
    }
    override func prepareForReuse() {
        imgUrls = []
        tagArray = []
        opened = false
        actionIndex = nil
        imgCollectionView.reloadData()
        tagCollectionView.reloadData()
    }
    
}
extension Tab0SoloCell:UICollectionViewDelegate{

}
extension Tab0SoloCell:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,MainTagCellProtocolDelegate{
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
            case 1:cell.imgView.image = UIImage(named:"JobTag")
            default:cell.imgView.image = UIImage(named: "HashTag")
            }
            cell.titleLabel.text = tagArray[indexPath.row]
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Tab0SoloImageCellid", for: indexPath) as! Tab0SoloImageCell
            
            let url = imgUrls[indexPath.row]
//            cell.imgView.sd_setImage(with: url)
            if opened == false{
                cell.setupCircle(term: 30, spacing: 5,url:url)
            }else{
                cell.setupSquare(term: 30, spacing: 5,url:url)
            }
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == imgCollectionView{
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.width)
        }else{
            return CGSize.zero
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }

}





extension Tab0SoloCell:UIScrollViewDelegate{
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
