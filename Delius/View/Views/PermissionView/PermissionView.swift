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
        v.image = UIImage(named: "DeliusIcon")
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        return v
    }()
    
    let titleLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "PermissionView001".localize(), txtAlignment: .center, ft: UIFont.DeliusBoldType4(), txtColor: .MainBlackColor1())
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
    
    let lineView1:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainLightGrayColor()
        return v
    }()
    let lineView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainLightGrayColor()
        return v
    }()
    let subLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "PermissionView002".localize(), txtAlignment: .left, ft: UIFont.DeliusSystemType2(), txtColor: .MainBlackColor1())
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
    var startBtn:UIButton={
        let b = UIButton()
        b.DeliusType1(txt: "PermissionView900".localize(), color: .white, backColor: UIColor.clear)
        b.titleLabel?.font = UIFont.DeliusBoldType1()
        return b
    }()
    
    var view1,view2,view3,view4:PermissionListView!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        view1 = PermissionListView(img: UIImage(named: "PermissionLocation")!, str1: "PermissionView100".localize(), str2: "PermissionView101".localize(), frame: CGRect(x: 0, y: 0, width: frame.width, height: 70))
        view2 = PermissionListView(img: UIImage(named: "PermissionContact")!, str1: "PermissionView200".localize(), str2: "PermissionView201".localize(), frame: CGRect(x: 0, y: 0, width: frame.width, height: 70))
        view3 = PermissionListView(img: UIImage(named: "PermissionPhoto")!, str1: "PermissionView300".localize(), str2: "PermissionView301".localize(), frame: CGRect(x: 0, y: 0, width: frame.width, height: 70))
        view4 = PermissionListView(img: UIImage(named: "PermissionPush")!, str1: "PermissionView400".localize(), str2: "PermissionView401".localize(), frame: CGRect(x: 0, y: 0, width: frame.width, height: 70))
        gradationView = MainGradientView(frame: CGRect(x:0,y:0,width: frame.width,height:60))
        setConstraints(frame:frame)
        
    }
    
    func setConstraints(frame:CGRect){
        let width = frame.width - 100
        let heightTerm = frame.height/25
        
        addSubview(topImgView)
        topImgView.topAnchor.constraint(equalTo: topAnchor, constant: heightTerm).isActive = true
        topImgView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        topImgView.widthAnchor.constraint(equalToConstant: frame.width/8).isActive = true
        topImgView.heightAnchor.constraint(equalToConstant: frame.width/8).isActive = true
        
        let str_titleLabel = "PermissionView001".localize()
        let str_subLabel = "PermissionView002".localize()
        
        let height_titleLabel = str_titleLabel.StringHeight(withConstrainedWidth: width, font: UIFont.DeliusBoldType4())
        
        let height_subLabel = str_subLabel.StringHeight(withConstrainedWidth: width, font: UIFont.DeliusSystemType2())
        
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topImgView.bottomAnchor, constant: heightTerm).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: height_titleLabel).isActive = true
        
        addSubview(lineView1)
        lineView1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        lineView1.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        lineView1.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        lineView1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.addSubview(bottomView)
        bottomView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bottomView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        bottomView.addSubview(gradationView)
        gradationView.leftAnchor.constraint(equalTo: bottomView.leftAnchor).isActive = true
        gradationView.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        gradationView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        gradationView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        addSubview(startBtn)
        startBtn.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        startBtn.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        startBtn.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        startBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: lineView1.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: startBtn.topAnchor,constant: -20).isActive = true
        let views = [view1,view2,view3,view4]
        var number = 1
        let height : CGFloat = frame.width/5
        for i in views{
            scrollView.addSubview(i!)
            i?.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
            i?.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
            i?.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: CGFloat(number) * height-frame.width/6).isActive = true
            i?.heightAnchor.constraint(equalToConstant: height).isActive = true
            number+=1
        }
        scrollView.contentSize = CGSize(width: 0, height: height*4 + height_subLabel)
        
        scrollView.addSubview(lineView2)
        lineView2.topAnchor.constraint(equalTo: view4.bottomAnchor,constant: height-frame.width/6).isActive = true
        lineView2.leftAnchor.constraint(equalTo: scrollView.leftAnchor,constant: 40).isActive = true
        lineView2.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        lineView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        scrollView.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: lineView2.bottomAnchor, constant: 10).isActive = true
        subLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        subLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: height_subLabel).isActive = true
    }
}
