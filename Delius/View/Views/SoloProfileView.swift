//
//  SoloProfileView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 19/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SoloProfileView:UIView{
    
    
    
    
    
    
    
    
    
    var backBtn:IconButton1!
    var editBtn:IconButton1!
    var tagArray = [String]()
    var imgArray = [UIImage]()
    
    
    let scrollView:UIScrollView={
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var nameLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusBoldType0()
        l.textAlignment = .center
        l.textColor = UIColor.MainBlackColor1()
        return l
    }()
    lazy var profileCollectionView:UICollectionView={
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.delegate = self
        cv.dataSource = self
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
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    let lineView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainBlackColor2()
        return v
    }()
    var statusLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor2()
        l.font = UIFont.DeliusBoldType2()
        l.textAlignment = .center
        return l
    }()
    var extraLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor3()
        l.font = UIFont.DeliusBoldType3()
        l.textAlignment = .left
        return l
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(imgArr:[UIImage],tagArr:[String],name:String,status:String,extra:String,frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        tagArray = tagArr
        imgArray = imgArr
        backBtn = IconButton1(imgName: "LeftArrow", color: UIColor.MainBlackColor1(), frame: CGRect(x:0,y:0,width:30,height:30))
        editBtn = IconButton1(imgName: "ProfileEdit", color: UIColor.MainBlackColor1(), frame: CGRect(x:0,y:0,width:30,height:30))
        
        profileCollectionView.register(MainTagCell.self, forCellWithReuseIdentifier: "SoloProfileImageCellid")
        tagCollectionView.register(MainTagCell.self, forCellWithReuseIdentifier: "SoloProfileTagCellid")
        setup(width: frame.width, name: name, status: status, extra: extra)
        profileCollectionView.reloadData()
        tagCollectionView.reloadData()
    }
    var nsCollection:NSLayoutConstraint!
    private func setup(width:CGFloat,name:String,status:String,extra:String){
        
        nameLabel.text = name
        statusLabel.text = status
        extraLabel.text = extra
        
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        self.addSubview(backBtn)
        backBtn.topAnchor.constraint(equalTo: topAnchor,constant: topPadding + 30).isActive = true
        backBtn.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(editBtn)
        editBtn.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor).isActive = true
        editBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        editBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        editBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: backBtn.bottomAnchor,constant: 10).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        let nameWidth = name.StringWidth(withConstrainedHeight: 30, font: UIFont.DeliusBoldType0())
        scrollView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 20).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 30).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: nameWidth).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        scrollView.addSubview(lineView)
        lineView.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 10).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        lineView.widthAnchor.constraint(equalToConstant: width - 40 - nameWidth).isActive = true
        
        scrollView.addSubview(profileCollectionView)
        profileCollectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30).isActive = true
        profileCollectionView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        profileCollectionView.widthAnchor.constraint(equalToConstant: width).isActive = true
        profileCollectionView.heightAnchor.constraint(equalToConstant: width/2).isActive = true
        
        let statusHeight = status.StringHeight(withConstrainedWidth: width-60, font: UIFont.DeliusBoldType1())
        scrollView.addSubview(statusLabel)
        statusLabel.topAnchor.constraint(equalTo: profileCollectionView.bottomAnchor, constant: 15).isActive = true
        statusLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor ,constant: 30).isActive = true
        statusLabel.widthAnchor.constraint(equalToConstant: width - 60).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: statusHeight).isActive = true
        
        scrollView.addSubview(tagCollectionView)
        tagCollectionView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 15).isActive = true
        tagCollectionView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20).isActive = true
        tagCollectionView.widthAnchor.constraint(equalToConstant: width - 40).isActive = true
        nsCollection = tagCollectionView.bottomAnchor.constraint(equalTo: tagCollectionView.topAnchor, constant: 0)
        nsCollection.isActive = false
        
        let extraHeight = extra.StringHeight(withConstrainedWidth: width-40, font: UIFont.DeliusSystemType2())
        scrollView.addSubview(extraLabel)
        extraLabel.topAnchor.constraint(equalTo: tagCollectionView.bottomAnchor, constant: 30).isActive = true
        extraLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor,constant: 20).isActive = true
        extraLabel.widthAnchor.constraint(equalToConstant: width-40).isActive = true
        extraLabel.heightAnchor.constraint(equalToConstant: extraHeight).isActive = true
        
        
        
    }
    
}
extension SoloProfileView:UICollectionViewDelegate{
    
}
extension SoloProfileView:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,MainTagCellProtocolDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == profileCollectionView{
            return imgArray.count
        }else{
            return tagArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == profileCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SoloProfileImageCellid", for: indexPath)
            let imageView:UIImageView={
                let v = UIImageView()
                v.image = imgArray[indexPath.row]
                v.clipsToBounds = true
                v.contentMode = .scaleAspectFill
                return v
            }()
            cell.addSubview(imageView)
            imageView.frame = cell.bounds
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SoloProfileTagCellid", for: indexPath) as! MainTagCell
            
            switch indexPath.row{
            case 0:cell.imgView.image = UIImage(named:"JobTag")
            default:cell.imgView.image = UIImage(named: "HashTag")
            }
            cell.titleLabel.text = tagArray[indexPath.row]
            return cell
        }
    }
    
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.height,height:collectionView.frame.height)
    }
    
    
}
