//
//  SoloFilterView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/05/31.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class SoloFilterView:UIView{
    let scrollView:UIScrollView={
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let boolLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SoloFilterView001".localize(), txtAlignment: .left, ft: UIFont.DeliusSystemType2(), txtColor: UIColor.MainBlackColor1())
        return l
    }()
    let sexLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SoloFilterView002".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType6(), txtColor: UIColor.MainGrayColor())
        return l
    }()
    let ageLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SoloFilterView003".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType6(), txtColor: UIColor.MainGrayColor())
        return l
    }()
    let distanceLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SoloFilterView004".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType6(), txtColor: UIColor.MainGrayColor())
        return l
    }()
    let infoLabel1:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SoloFilterView005".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType6(), txtColor: UIColor.MainGrayColor())
        return l
    }()
    let infoLabel2:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SoloFilterView006".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType6(), txtColor: UIColor.MainGrayColor())
        return l
    }()
    let infoLabel3:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SoloFilterView007".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType6(), txtColor: UIColor.MainGrayColor())
        return l
    }()
    let infoLabel4:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SoloFilterView008".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType6(), txtColor: UIColor.MainGrayColor())
        return l
    }()
    let locationLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SoloFilterView009".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType6(), txtColor: UIColor.MainGrayColor())
        return l
    }()
    var boolBtn:IconButton1!
    
    
    var manBtn:FilterCheckButton!
    var womanBtn:FilterCheckButton!
    var bothBtn:FilterCheckButton!
    
    var ageSlider:RangeSlider!
    var distanceSlider:SingleSlider!
    
    var ageSettingLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusSystemType2()
        l.textColor = UIColor.MainBlackColor2()
        l.textAlignment = .right
        return l
    }()
    var distanceSettingLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.DeliusSystemType2()
        l.textColor = UIColor.MainBlackColor2()
        l.textAlignment = .right
        return l
    }()
    
    lazy var info1CollectionView:UICollectionView={
        let layout = MainTagCellLayout()
        layout.delegate = self
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    lazy var info2CollectionView:UICollectionView={
        let layout = MainTagCellLayout()
        layout.delegate = self
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    lazy var info3CollectionView:UICollectionView={
        let layout = MainTagCellLayout()
        layout.delegate = self
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    lazy var info4CollectionView:UICollectionView={
        let layout = MainTagCellLayout()
        layout.delegate = self
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    var currentLocationBtn:FilterCheckButton!
    var otherLocationBtn:FilterCheckButton!
    
    
    required init?(coder:NSCoder){
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        
        let sexBtnFrame = CGRect(x:0,y:0,width:(frame.width - 100)/3,height:40)
        let locationBtnFrame = CGRect(x:0,y:0,width:(frame.width-80)/2,height:40)
        
        boolBtn = IconButton1(imgName: "Check", color: UIColor.MainBlackColor1(), frame: CGRect(x:0,y:0,width:30,height:30))
        ageSlider = RangeSlider(frame: CGRect(x:0,y:0,width:frame.width - 60,height:30))
        distanceSlider = SingleSlider(frame: CGRect(x:0,y:0,width:frame.width - 60,height:30))
        manBtn = FilterCheckButton(txt: "SoloFilterView101".localize(), frame: sexBtnFrame)
        womanBtn = FilterCheckButton(txt:"SoloFilterView102".localize(),frame:sexBtnFrame)
        bothBtn = FilterCheckButton(txt:"SoloFilterView103".localize(),frame:sexBtnFrame)
        currentLocationBtn = FilterCheckButton(txt:"SoloFilterView201".localize(),frame:locationBtnFrame)
        otherLocationBtn = FilterCheckButton(txt:"SoloFilterView202".localize(),frame:locationBtnFrame)
        
        
        
        
        scrollView.contentSize = CGSize(width: 0, height: 1300)
        setup(width: frame.width, titleHeight: 30, margin: 30, term: 10, t2: 30)
        
        
        
        
    }
    private func setup(width:CGFloat,titleHeight h:CGFloat,margin m:CGFloat,term t1:CGFloat,t2:CGFloat){
        let contentWidth = width - 2*m
        
        self.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        scrollView.addSubview(sexLabel)
        sexLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: t1).isActive = true
        sexLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor,constant: m).isActive = true
        sexLabel.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        sexLabel.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        let sexBtnWd = (contentWidth - 40) / 3
        scrollView.addSubview(manBtn)
        manBtn.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: m).isActive = true
        manBtn.widthAnchor.constraint(equalToConstant: sexBtnWd).isActive = true
        manBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        manBtn.topAnchor.constraint(equalTo: sexLabel.bottomAnchor, constant: t1).isActive = true
        
        scrollView.addSubview(womanBtn)
        womanBtn.leftAnchor.constraint(equalTo: manBtn.rightAnchor, constant: 20).isActive = true
        womanBtn.widthAnchor.constraint(equalToConstant: sexBtnWd).isActive = true
        womanBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        womanBtn.topAnchor.constraint(equalTo: manBtn.topAnchor).isActive = true
        
        scrollView.addSubview(bothBtn)
        bothBtn.leftAnchor.constraint(equalTo: womanBtn.rightAnchor, constant: 20).isActive = true
        bothBtn.widthAnchor.constraint(equalToConstant: sexBtnWd).isActive = true
        bothBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        bothBtn.topAnchor.constraint(equalTo: manBtn.topAnchor).isActive = true
        
        scrollView.addSubview(ageLabel)
        ageLabel.topAnchor.constraint(equalTo: manBtn.bottomAnchor, constant: t2).isActive = true
        ageLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: m).isActive = true
        ageLabel.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        ageLabel.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        ageSlider.translatesAutoresizingMaskIntoConstraints = false
        ageSlider.addTarget(self, action: #selector(ageSliderFunc(_:)), for: .valueChanged)
        scrollView.addSubview(ageSlider)
        ageSlider.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: m).isActive = true
        ageSlider.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        ageSlider.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ageSlider.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: t1).isActive = true
        
        scrollView.addSubview(ageSettingLabel)
        ageSettingLabel.topAnchor.constraint(equalTo: ageSlider.bottomAnchor, constant: t1).isActive = true
        ageSettingLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: m).isActive = true
        ageSettingLabel.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        ageSettingLabel.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        scrollView.addSubview(distanceLabel)
        distanceLabel.topAnchor.constraint(equalTo: ageSettingLabel.bottomAnchor, constant: t2).isActive = true
        distanceLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: m).isActive = true
        distanceLabel.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        distanceLabel.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        distanceSlider.addTarget(self, action: #selector(distanceSliderFunc(_:)), for: .valueChanged)
        distanceSlider.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(distanceSlider)
        distanceSlider.topAnchor.constraint(equalTo: distanceLabel.bottomAnchor, constant: t1/2).isActive = true
        distanceSlider.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: m).isActive = true
        distanceSlider.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        distanceSlider.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        scrollView.addSubview(distanceSettingLabel)
        distanceSettingLabel.topAnchor.constraint(equalTo: distanceSlider.bottomAnchor, constant: t1).isActive = true
        distanceSettingLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: m).isActive = true
        distanceSettingLabel.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        distanceSettingLabel.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        scrollView.addSubview(infoLabel1)
        infoLabel1.topAnchor.constraint(equalTo: distanceSlider.bottomAnchor, constant: t2).isActive = true
        infoLabel1.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: m).isActive = true
        infoLabel1.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        infoLabel1.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        scrollView.addSubview(info1CollectionView)
        info1CollectionView.topAnchor.constraint(equalTo: infoLabel1.bottomAnchor, constant: t1).isActive = true
        info1CollectionView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: m).isActive = true
        info1CollectionView.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        info1CollectionView.bottomAnchor.constraint(equalTo: info1CollectionView.topAnchor, constant: 0).isActive = false
        
        scrollView.addSubview(infoLabel2)
        infoLabel2.topAnchor.constraint(equalTo: info1CollectionView.bottomAnchor, constant: t2).isActive = true
        infoLabel2.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: m).isActive = true
        infoLabel2.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        infoLabel2.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        scrollView.addSubview(info2CollectionView)
        info2CollectionView.topAnchor.constraint(equalTo: infoLabel2.bottomAnchor, constant: t1).isActive = true
        info2CollectionView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: m).isActive = true
        info2CollectionView.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        info2CollectionView.bottomAnchor.constraint(equalTo: info2CollectionView.topAnchor, constant: 0).isActive = false
        
        scrollView.addSubview(infoLabel3)
        infoLabel3.topAnchor.constraint(equalTo: info2CollectionView.bottomAnchor, constant: t2).isActive = true
        infoLabel3.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: m).isActive = true
        infoLabel3.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        infoLabel3.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        scrollView.addSubview(info3CollectionView)
        info3CollectionView.topAnchor.constraint(equalTo: infoLabel3.bottomAnchor, constant: t1).isActive = true
        info3CollectionView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: m).isActive = true
        info3CollectionView.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        info3CollectionView.bottomAnchor.constraint(equalTo: info3CollectionView.topAnchor, constant: 0).isActive = false
        
        scrollView.addSubview(infoLabel4)
        infoLabel4.topAnchor.constraint(equalTo: info3CollectionView.bottomAnchor, constant: t2).isActive = true
        infoLabel4.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: m).isActive = true
        infoLabel4.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        infoLabel4.heightAnchor.constraint(equalToConstant: h).isActive = true
        
        scrollView.addSubview(info4CollectionView)
        info4CollectionView.topAnchor.constraint(equalTo: infoLabel4.bottomAnchor, constant: t1).isActive = true
        info4CollectionView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 30).isActive = true
        info4CollectionView.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        info4CollectionView.bottomAnchor.constraint(equalTo: info4CollectionView.topAnchor, constant: 0).isActive = false
        
        scrollView.addSubview(locationLabel)
        locationLabel.topAnchor.constraint(equalTo: info4CollectionView.bottomAnchor, constant: t2).isActive = true
        locationLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: m).isActive = true
        locationLabel.heightAnchor.constraint(equalToConstant: h).isActive = true
        locationLabel.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        
        let locationBtnWd = (contentWidth - 20)/2
        scrollView.addSubview(currentLocationBtn)
        currentLocationBtn.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: t1).isActive = true
        currentLocationBtn.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: m).isActive = true
        currentLocationBtn.widthAnchor.constraint(equalToConstant: locationBtnWd).isActive = true
        currentLocationBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        scrollView.addSubview(otherLocationBtn)
        otherLocationBtn.topAnchor.constraint(equalTo: currentLocationBtn.topAnchor).isActive = true
        otherLocationBtn.leftAnchor.constraint(equalTo: currentLocationBtn.rightAnchor, constant: 20).isActive = true
        otherLocationBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        otherLocationBtn.widthAnchor.constraint(equalToConstant: locationBtnWd).isActive = true
    }
    
    @objc func ageSliderFunc(_ sender:UIControl){
        let convertedLowerValue = floor(18 + ageSlider.lowerValue*22)
        let convertedUpperValue = floor(18 + ageSlider.upperValue*22)
        
        let lowerStr = String(Int(convertedLowerValue))
        var upperStr = String(Int(convertedUpperValue))
        
        if upperStr == "40"{
            upperStr = "40+"
        }
        ageSettingLabel.text = lowerStr + " ~ " + upperStr
    }
    @objc func distanceSliderFunc(_ sender:UIControl){
        let convertedValue = floor(1 + distanceSlider.upperValue*27)
        var str = String(Int(convertedValue))
        if str == "30"{
            str = "30km+"
        }else{
            str = str + "km"
        }
        distanceSettingLabel.text = str
    }
    @objc func boolBtnFunc(_ sender:UIButton){
        
    }
    func setDefault(defaultSet:UserSetStruct){
        if defaultSet.SetSoloSex!{
            manBtn.backgroundColor = .MainColor()
        }else{
            womanBtn.backgroundColor = .MainColor()
        }
        
        
    }
}
extension SoloFilterView:MainTagCellProtocolDelegate{
    func collectionView(_ collectionView: UICollectionView, itemSizeAt indexPath: NSIndexPath) -> CGSize {
        switch collectionView{
        case info1CollectionView:
            let title = String.SoloInfo1Array()[indexPath.row]//tagArray[indexPath.row]
            var size = title.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
            size.width = CGFloat(ceilf(Float(size.width + CGFloat(38))))
            size.height = 30
            if size.width > collectionView.frame.size.width {
                size.width = collectionView.frame.size.width
            }
            self.layoutIfNeeded()
            return size
        case info2CollectionView:
            let title = String.SoloInfo2Array()[indexPath.row]//tagArray[indexPath.row]
            var size = title.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
            size.width = CGFloat(ceilf(Float(size.width + CGFloat(38))))
            size.height = 30
            if size.width > collectionView.frame.size.width {
                size.width = collectionView.frame.size.width
            }
            self.layoutIfNeeded()
            return size
        case info3CollectionView:
            let title = String.SoloInfo3Array()[indexPath.row]//tagArray[indexPath.row]
            var size = title.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
            size.width = CGFloat(ceilf(Float(size.width + CGFloat(38))))
            size.height = 30
            if size.width > collectionView.frame.size.width {
                size.width = collectionView.frame.size.width
            }
            self.layoutIfNeeded()
            return size
        case info4CollectionView:
            let title = String.SoloInfo4Array()[indexPath.row]//tagArray[indexPath.row]
            var size = title.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
            size.width = CGFloat(ceilf(Float(size.width + CGFloat(38))))
            size.height = 30
            if size.width > collectionView.frame.size.width {
                size.width = collectionView.frame.size.width
            }
            self.layoutIfNeeded()
            return size
        default:
            return CGSize(width:0,height:0)
        }
    }
    
    
}

