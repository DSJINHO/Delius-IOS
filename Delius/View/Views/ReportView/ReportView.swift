//
//  ReportView.swift
//  Delius
//
//  Created by 박진호 on 2020/06/15.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class ReportView:UIView{
    
    
    var shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainBlackColor()
        v.alpha = 0
        return v
    }()
    
    let whiteView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 15
        v.clipsToBounds = true
        v.alpha = 0
        return v
    }()
    let titleLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.MainBlackColor()
        l.font = UIFont.boldSystemFont(ofSize: 20)
        l.textAlignment = .center
        l.text = "신고하기"
        return l
    }()
    let lineView1:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.lightGray
        return v
    }()
    let lineView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.lightGray
        return v
    }()
    let subLabel:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.lightGray
        l.font = UIFont.systemFont(ofSize: 12)
        l.textAlignment = .center
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.text = "상황에 맞는 신고를 해주세요\n딜리어스는 쾌적한 서비스를 제공하기 위해 이를 적극 반영하고 있습니다"
        return l
    }()
    var btn1:ReportSubBtn!
    var btn2:ReportSubBtn!
    var btn3:ReportSubBtn!
    var btn4:ReportSubBtn!
    
    let verticalLineView1:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.lightGray
        return v
    }()
    let verticalLineView2:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.lightGray
        return v
    }()
    let verticalLineView3:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.lightGray
        return v
    }()
    var reportBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = UIColor.lightGray
        b.setTitle("신고하기", for: .normal)
        return b
    }()
    
    var closeBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("닫기", for: .normal)
        b.setTitleColor(UIColor.MainBlackColor(), for: .normal)
        return b
    }()
    
    
    
    
    
    
    var nsCenter:NSLayoutConstraint!
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        let d = (frame.width - 80)/4
        btn1 = ReportSubBtn(imgName: "Report1", txt: "부적절한사진", frame: CGRect(x:0,y:0,width:d,height:d))
        btn2 = ReportSubBtn(imgName: "Report2", txt: "부적절한내용", frame: CGRect(x:0,y:0,width:d,height:d))
        btn3 = ReportSubBtn(imgName: "Report3", txt: "스팸", frame: CGRect(x:0,y:0,width:d,height:d))
        btn4 = ReportSubBtn(imgName: "Report4", txt: "기타", frame: CGRect(x:0,y:0,width:d,height:d))
        
        setup(d:d)
        
    }
    private func setup(d:CGFloat){
        self.addSubview(shadowView)
        shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shadowView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        shadowView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(whiteView)
        nsCenter = whiteView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 200)
        nsCenter.isActive = true
        whiteView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        whiteView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        
        whiteView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 30).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        whiteView.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        subLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 30).isActive = true
        subLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -30).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        whiteView.addSubview(lineView1)
        lineView1.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 20).isActive = true
        lineView1.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        lineView1.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        lineView1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        whiteView.addSubview(btn1)
        btn1.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        btn1.widthAnchor.constraint(equalToConstant: d).isActive = true
        btn1.topAnchor.constraint(equalTo: lineView1.bottomAnchor,constant: 20).isActive = true
        btn1.heightAnchor.constraint(equalToConstant: d).isActive = true
        
        whiteView.addSubview(btn2)
        btn2.topAnchor.constraint(equalTo: btn1.topAnchor).isActive = true
        btn2.bottomAnchor.constraint(equalTo: btn1.bottomAnchor).isActive = true
        btn2.widthAnchor.constraint(equalToConstant: d).isActive = true
        btn2.rightAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        
        whiteView.addSubview(btn3)
        btn3.topAnchor.constraint(equalTo: btn1.topAnchor).isActive = true
        btn3.leftAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        btn3.widthAnchor.constraint(equalToConstant: d).isActive = true
        btn3.heightAnchor.constraint(equalToConstant: d).isActive = true
        
        whiteView.addSubview(btn4)
        btn4.topAnchor.constraint(equalTo: btn1.topAnchor).isActive = true
        btn4.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        btn4.heightAnchor.constraint(equalToConstant: d).isActive = true
        btn4.widthAnchor.constraint(equalToConstant: d).isActive = true
        
        whiteView.addSubview(reportBtn)
        reportBtn.topAnchor.constraint(equalTo: btn4.bottomAnchor, constant: 20).isActive = true
        reportBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 30).isActive = true
        reportBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -30).isActive = true
        reportBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        whiteView.addSubview(lineView2)
        lineView2.topAnchor.constraint(equalTo: btn4.bottomAnchor,constant: 10).isActive = true
        lineView2.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        lineView2.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        lineView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        whiteView.addSubview(closeBtn)
        closeBtn.topAnchor.constraint(equalTo: lineView2.bottomAnchor, constant:10).isActive = true
        closeBtn.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        closeBtn.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        whiteView.bottomAnchor.constraint(equalTo: closeBtn.bottomAnchor,constant: 10).isActive = true
        
        
        
        
        
    }
    
    func openAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.nsCenter.constant = 0
            self.whiteView.alpha = 5
            self.shadowView.alpha = 0.3
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
    }
    func closeAnimation(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.nsCenter.constant = 200
            self.whiteView.alpha = -1
            self.shadowView.alpha = -1
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                completion()
            }
        }
    }
    
}
