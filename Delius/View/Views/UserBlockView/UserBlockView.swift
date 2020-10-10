//
//  UserBlockView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 30/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//
import UIKit
class UserBlockView:UIView{
    var opened = false
    var titleViewBack:MainGradientView!
    let titleView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var titleLabel1:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "UserBlockView001".localize(), txtAlignment: .center, ft: .DeliusBoldType1(), txtColor: .white)
        return l
    }()
    var titleLabel2:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "UserBlockView002".localize(), txtAlignment: .center, ft: .DeliusBoldType1(), txtColor: .white)
        l.alpha = 0
        return l
    }()
    var backBtn:IconButton1!
    var listBtn:IconButton1!
    var AddToListBtn:UIButton={
        let b = UIButton()
        b.DeliusType1(txt: "UserBlockView003".localize(), color: .white, backColor: .clear)
        return b
    }()
    
    
    let contentView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let boxView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 15
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.MainLightGrayColor().cgColor
        return v
    }()
    
    var pickerBtn:UIButton={
        let b = UIButton()
        b.DeliusType3(txt: "+82", color: .MainGrayColor(), backColor: .clear)
        b.titleLabel!.font = UIFont.DeliusSystemType1()
        b.titleLabel!.textAlignment = .left
        return b
    }()
    
    var phoneEdt:UITextField={
        let f = UITextField()
        f.translatesAutoresizingMaskIntoConstraints = false
        f.placeholder = "UserBlockView101".localize()
        f.textColor = UIColor.MainBlackColor()
        return f
    }()
    var contactBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("UserBlockView102".localize(), for: .normal)
        b.setTitleColor(UIColor.MainGrayColor(), for: .normal)
        b.titleLabel?.font = UIFont.DeliusSystemType1()
        return b
    }()
    
    let listContentView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    var localPickerView:LocalPhoneNumPickerView!
    var sendCompleteBtn:UIButton={
        let b = UIButton()
        b.DeliusType3(txt: "UserBlockView103".localize(), color: .white, backColor: UIColor.MainLightGrayColor())
        b.layer.cornerRadius = 15
        b.clipsToBounds = true
        return b
    }()
    
    var localImgView:UIImageView={
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.image = UIImage(named: "picker")
        i.clipsToBounds = true
        i.tintColor = UIColor.MainGrayColor()
        return i
    }()
    
    lazy var listCollectionView:UICollectionView={
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    var nsTitle1:NSLayoutConstraint!
    var nsTitle2:NSLayoutConstraint!
    var nsLeftContent:NSLayoutConstraint!
    var nsLeftList:NSLayoutConstraint!
    required init?(coder:NSCoder){
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.backgroundColor = .white
        backBtn = IconButton1(imgName: "LeftArrow", color: .white, frame: CGRect(x:0,y:0,width:30,height:30))
        listBtn = IconButton1(imgName: "List", color: .white, frame: CGRect(x:0,y:0,width:30,height:30))
        localPickerView = LocalPhoneNumPickerView(frame: CGRect(x:0,y:0,width: frame.width,height:250))
        setup(width: frame.width)
    }
    private func setup(width:CGFloat){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let btmPadding = window.safeAreaInsets.bottom
        
        titleViewBack = MainGradientView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 60 + topPadding))
        
        self.addSubview(titleView)
        titleView.topAnchor.constraint(equalTo: topAnchor, constant: topPadding).isActive = true
        titleView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        titleView.addSubview(titleViewBack)
        titleViewBack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleViewBack.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleViewBack.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleViewBack.heightAnchor.constraint(equalToConstant: 60 + topPadding).isActive = true
        
        titleView.addSubview(titleLabel1)
        titleLabel1.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        nsTitle1 = titleLabel1.centerXAnchor.constraint(equalTo: titleView.centerXAnchor,constant: 0)
        nsTitle1.isActive = true
        titleLabel1.widthAnchor.constraint(equalToConstant: 120).isActive = true
        titleLabel1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        titleView.addSubview(titleLabel2)
        titleLabel2.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        titleLabel2.widthAnchor.constraint(equalToConstant: 120).isActive = true
        titleLabel2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nsTitle2 = titleLabel2.centerXAnchor.constraint(equalTo: titleView.centerXAnchor, constant: 120)
        nsTitle2.isActive = true
        
        titleView.addSubview(backBtn)
        backBtn.centerYAnchor.constraint(equalTo: titleLabel1.centerYAnchor).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backBtn.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        
        titleView.addSubview(listBtn)
        listBtn.centerYAnchor.constraint(equalTo: titleLabel1.centerYAnchor).isActive = true
        listBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        listBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        listBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        nsLeftContent = contentView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0)
        nsLeftContent.isActive = true
        contentView.widthAnchor.constraint(equalToConstant: width).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        contentView.addSubview(pickerBtn)
        pickerBtn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40).isActive = true
        pickerBtn.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 18).isActive = true
        pickerBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pickerBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        contentView.addSubview(sendCompleteBtn)
        sendCompleteBtn.centerYAnchor.constraint(equalTo: pickerBtn.centerYAnchor).isActive = true
        sendCompleteBtn.widthAnchor.constraint(equalToConstant: 60).isActive = true
        sendCompleteBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        sendCompleteBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        
        contentView.addSubview(localImgView)
        localImgView.leftAnchor.constraint(equalTo: pickerBtn.rightAnchor).isActive = true
        localImgView.centerYAnchor.constraint(equalTo: pickerBtn.centerYAnchor).isActive = true
        localImgView.widthAnchor.constraint(equalToConstant: 5).isActive = true
        localImgView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        
        contentView.addSubview(boxView)
        boxView.centerYAnchor.constraint(equalTo: pickerBtn.centerYAnchor).isActive = true
        boxView.leftAnchor.constraint(equalTo: pickerBtn.rightAnchor, constant: 15).isActive = true
        boxView.rightAnchor.constraint(equalTo: sendCompleteBtn.leftAnchor, constant: -10).isActive = true
        boxView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        boxView.addSubview(phoneEdt)
        phoneEdt.centerYAnchor.constraint(equalTo: pickerBtn.centerYAnchor).isActive = true
        phoneEdt.leftAnchor.constraint(equalTo: pickerBtn.rightAnchor, constant: 30).isActive = true
        phoneEdt.rightAnchor.constraint(equalTo: sendCompleteBtn.leftAnchor, constant: -10).isActive = true
        phoneEdt.bottomAnchor.constraint(equalTo: pickerBtn.bottomAnchor).isActive = true
        
        contentView.addSubview(contactBtn)
        contactBtn.topAnchor.constraint(equalTo: boxView.bottomAnchor, constant: 40).isActive = true
        contactBtn.widthAnchor.constraint(equalToConstant: 200).isActive = true
        contactBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        contactBtn.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        contentView.addSubview(AddToListBtn)
        AddToListBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -btmPadding - 50).isActive = true
        AddToListBtn.widthAnchor.constraint(equalToConstant: 200).isActive = true
        AddToListBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        AddToListBtn.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        self.addSubview(listContentView)
        listContentView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 40).isActive = true
        nsLeftList = listContentView.leftAnchor.constraint(equalTo: leftAnchor, constant: width)
        nsLeftList.isActive = true
        listContentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        listContentView.widthAnchor.constraint(equalToConstant: width).isActive = true
        
        listContentView.addSubview(listCollectionView)
        listCollectionView.topAnchor.constraint(equalTo: listContentView.topAnchor).isActive = true
        listCollectionView.leftAnchor.constraint(equalTo: listContentView.leftAnchor).isActive = true
        listCollectionView.rightAnchor.constraint(equalTo: listContentView.rightAnchor).isActive = true
        listCollectionView.bottomAnchor.constraint(equalTo: listContentView.bottomAnchor).isActive = true
        
    }
    func Animation(listOpen open:Bool){
        let Animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn, animations: {
            if open{
                self.nsTitle1.constant = -120
                self.nsTitle2.constant = 0
                self.nsLeftContent.constant = -150
                self.nsLeftList.constant = 0
                self.titleLabel1.alpha = 0
                self.titleLabel2.alpha = 1
                self.listBtn.alpha = 0
            }else{
                self.nsTitle1.constant = 0
                self.nsTitle2.constant = 120
                self.nsLeftContent.constant = 0
                self.nsLeftList.constant = self.frame.width
                self.listBtn.alpha = 1
                self.titleLabel1.alpha = 1
                self.titleLabel2.alpha = 0
            }
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if open{
                self.opened = true
            }else{
                self.opened = false
            }
        }
    }
}
