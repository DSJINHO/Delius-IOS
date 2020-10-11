//
//  PermissionVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 02/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import Foundation
import UIKit

final class PermissionView: UIView{
    
    let topImgView:UIImageView={
        let v = UIImageView()
        v.image = UIImage(named: "DeliusTitle")
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        return v
    }()
    
    let titleLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "PermissionView001".toLocal(), txtAlignment: .left, ft: UIFont.DeliusBoldType5(), txtColor: .MainBlackColor())
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        return l
    }()
    let titleLabel2:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "PermissionView002".toLocal(), txtAlignment: .left, ft: UIFont.DeliusBoldType5(), txtColor: .MainBlackColor())
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        return l
    }()
    
    let scrollView:UIScrollView={
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.showsVerticalScrollIndicator = false
        return v
    }()
    
    let subLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "PermissionView003".toLocal(), txtAlignment: .center, ft: UIFont.DeliusSystemType2(), txtColor: .MainBlackColor1())
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        return l
    }()
    let bottomView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    var gradationView:MainGradientView!
    var nsGradient:NSLayoutConstraint!
    var startBtn:UIButton = {
        let b = UIButton()
        b.BtnBlackType(txt: "PermissionView900".toLocal())
        return b
    }()
    
    var view1,view2,view3,view4:PermissionListView!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        view1 = PermissionListView(img: UIImage(named: "PermissionLocation")!, str1: "PermissionView100".toLocal(), str2: "PermissionView101".toLocal(), str3:"PermissionView102".toLocal(), frame: CGRect(x: 0, y: 0, width: frame.width, height: 70))
        view2 = PermissionListView(img: UIImage(named: "PermissionContact")!, str1: "PermissionView200".toLocal(), str2: "PermissionView201".toLocal(),str3:"PermissionView202".toLocal(),  frame: CGRect(x: 0, y: 0, width: frame.width, height: 70))
        view3 = PermissionListView(img: UIImage(named: "PermissionPhoto")!, str1: "PermissionView300".toLocal(), str2: "PermissionView301".toLocal(),str3:"PermissionView302".toLocal(),  frame: CGRect(x: 0, y: 0, width: frame.width, height: 70))
        gradationView = MainGradientView(frame: CGRect(x:0,y:0,width: frame.width,height:60))
        setConstraints(frame:frame)
        
    }
    
    func setConstraints(frame:CGRect){
        let width = frame.width - 100
        let heightTerm = frame.height/25
        
        addSubview(topImgView)
        topImgView.topAnchor.constraint(equalTo: topAnchor, constant: heightTerm + 20).isActive = true
        topImgView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        topImgView.widthAnchor.constraint(equalToConstant:120).isActive = true
        topImgView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        let str_titleLabel = "PermissionView001".toLocal()
        let str_subLabel = "PermissionView002".toLocal()
        
        let height_titleLabel = str_titleLabel.StringHeight(withConstrainedWidth: width, font: UIFont.DeliusBoldType4())
        
        let height_subLabel = str_subLabel.StringHeight(withConstrainedWidth: width, font: UIFont.DeliusSystemType2())
        
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topImgView.bottomAnchor, constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: height_titleLabel).isActive = true
        
        addSubview(titleLabel2)
        titleLabel2.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        titleLabel2.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        titleLabel2.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        titleLabel2.heightAnchor.constraint(equalToConstant: height_titleLabel).isActive = true
        
        
        self.addSubview(bottomView)
        bottomView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bottomView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 60).isActive = true
      
        addSubview(startBtn)
        startBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -frame.height/10).isActive = true
        startBtn.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        startBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        startBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: titleLabel2.bottomAnchor, constant: 90).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: startBtn.topAnchor,constant: -20).isActive = true
        let views = [view1,view2,view3]
        var number = 1
        let height : CGFloat = frame.width/4
        for i in views{
            scrollView.addSubview(i!)
            i?.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
            i?.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
            i?.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: CGFloat(number) * height-frame.width/6).isActive = true
            i?.heightAnchor.constraint(equalToConstant: height).isActive = true
            number+=1
        }
        scrollView.contentSize = CGSize(width: 0, height: height*4 + height_subLabel)
        
        addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: startBtn.bottomAnchor, constant: 30).isActive = true
        subLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        subLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
