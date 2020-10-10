//
//  Tab1View.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 17/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
final class Tab1View:UIView{
    let scrollView:UIScrollView={
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var profileView:Tab1SubView1!
    var deliView:Tab1SubView2!
    var likeView:Tab1SubView2!
    var boosterView:Tab1SubView2!
    let lineView1:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainAlphaView()
        return v
    }()
    let lineView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainAlphaView()
        return v
    }()
    
    var filterBtn:Tab1SubView3!
    var blockBtn:Tab1SubView3!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        let itemFrame = CGRect(x:0,y:0,width:frame.width,height:50)
        profileView = Tab1SubView1(frame: CGRect(x:0,y:0,width:frame.width,height:frame.width/2 + 120))
        deliView = Tab1SubView2(imgName: "Deli", labelText: "Deli".localize(), Color: UIColor.gradientColor()[1], frame: itemFrame)
        likeView = Tab1SubView2(imgName: "Like", labelText: "Like".localize(), Color: UIColor.gradientColor()[2], frame: itemFrame)
        boosterView = Tab1SubView2(imgName: "Report", labelText: "Booster".localize(), Color: UIColor.gradientColor()[3], frame: itemFrame)
        let filterWidth = "UserFilter".localize().StringWidth(withConstrainedHeight: 30, font: UIFont.DeliusSystemType2()) + 50
        let blockWidth = "UserPhoneBlock".localize().StringWidth(withConstrainedHeight: 30, font: UIFont.DeliusSystemType2()) + 50
        filterBtn = Tab1SubView3(txt: "UserFilter".localize(), imgName: "Filter", frame: CGRect(x:0,y:0,width:filterWidth,height:50))
        blockBtn = Tab1SubView3(txt:"UserPhoneBlock".localize(),imgName: "Block",frame:CGRect(x:0,y:0,width:blockWidth,height:50))
        
        setup(width: frame.width,filterWidth: filterWidth,blockWidth: blockWidth)
        
    }
    private func setup(width:CGFloat,filterWidth fw:CGFloat,blockWidth bw:CGFloat){
        self.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        scrollView.addSubview(profileView)
        profileView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100).isActive = true
        profileView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        profileView.widthAnchor.constraint(equalToConstant: width).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: width/2 + 120).isActive = true
        
        scrollView.addSubview(lineView1)
        lineView1.topAnchor.constraint(equalTo: profileView.bottomAnchor).isActive = true
        lineView1.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20).isActive = true
        lineView1.widthAnchor.constraint(equalToConstant: width-40).isActive = true
        lineView1.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        scrollView.addSubview(deliView)
        deliView.topAnchor.constraint(equalTo: lineView1.bottomAnchor, constant: 30).isActive = true
        deliView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        deliView.widthAnchor.constraint(equalToConstant: width).isActive = true
        deliView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(likeView)
        likeView.topAnchor.constraint(equalTo: deliView.bottomAnchor).isActive = true
        likeView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        likeView.widthAnchor.constraint(equalToConstant: width).isActive = true
        likeView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(boosterView)
        boosterView.topAnchor.constraint(equalTo: likeView.bottomAnchor).isActive = true
        boosterView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        boosterView.widthAnchor.constraint(equalToConstant: width).isActive = true
        boosterView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(lineView2)
        lineView2.topAnchor.constraint(equalTo: boosterView.bottomAnchor, constant: 30).isActive = true
        lineView2.leftAnchor.constraint(equalTo: lineView1.leftAnchor).isActive = true
        lineView2.rightAnchor.constraint(equalTo: lineView1.rightAnchor).isActive = true
        lineView2.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        scrollView.addSubview(filterBtn)
        filterBtn.topAnchor.constraint(equalTo: lineView2.bottomAnchor, constant: 30).isActive = true
        filterBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        filterBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        filterBtn.widthAnchor.constraint(equalToConstant: fw).isActive = true
        
        scrollView.addSubview(blockBtn)
        blockBtn.topAnchor.constraint(equalTo: filterBtn.bottomAnchor).isActive = true
        blockBtn.rightAnchor.constraint(equalTo: filterBtn.rightAnchor).isActive = true
        blockBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        blockBtn.widthAnchor.constraint(equalToConstant: bw).isActive = true
        
        
        scrollView.contentSize = CGSize(width: 0, height: 1000)
        
    }
}
