//
//  ProfileAuthView1.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 03/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
private enum btmViewState{
    case none
    case sex
    case info1
    case info2
    case info3
    case info4
    case birth
}
final class ProfileAuthView:UIView{
    var scrollView:UIScrollView={
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let titleLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "ProfileAuthView001".localize(), txtAlignment: .left, ft: UIFont.DeliusBoldType4(), txtColor: .MainGrayColor())
        return l
    }()
    let subLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "ProfileAuthView002".localize(), txtAlignment: .left, ft: UIFont.DeliusSystemType2(), txtColor: .MainGrayColor())
        return l
    }()
    
    var imageView:ProfileAuthViewSub3!
    var nameView:ProfileAuthViewSub1!
    var jobView:ProfileAuthViewSub1!
    var sexView:ProfileAuthViewSub2!
    var ageView:ProfileAuthViewSub2!
    var statusView:ProfileAuthViewSub1!
    var info1View:ProfileAuthViewSub2!
    var info2View:ProfileAuthViewSub2!
    var info3View:ProfileAuthViewSub2!
    var info4View:ProfileAuthViewSub2!
    
    let shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .MainAlphaView()
        v.alpha = 0
        return v
    }()
    
    var sexBtmView:SelectionSexView!
    var nsSexBtm:NSLayoutConstraint!
    
    var birthBtmView:BirthPickerView!
    var nsBirthBtm:NSLayoutConstraint!
    
    var info1BtmView:ProfileInfoBottomView!
    var nsInfo1Btm:NSLayoutConstraint!
    
    var info2BtmView:ProfileInfoBottomView!
    var nsInfo2Btm:NSLayoutConstraint!
    
    var info3BtmView:ProfileInfoBottomView!
    var nsInfo3Btm:NSLayoutConstraint!
    
    var info4BtmView:ProfileInfoBottomView!
    var nsInfo4Btm:NSLayoutConstraint!
    
    
    private var currentBtm:btmViewState = .none
    private var tapGesture:UITapGestureRecognizer!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        imageView = ProfileAuthViewSub3(frame: CGRect(x:0,y:0,width:frame.width,height:frame.width/2+30))
        let subFrame = CGRect(x:0,y:0,width:frame.width-100,height:60)
        let btmFrame = CGRect(x:0,y:0,width:frame.width,height:250)
        nameView = ProfileAuthViewSub1(txt: "ProfileAuthView102".localize(), ph_txt: "ProfileAuthView102sub".localize(), frame: subFrame)
        jobView = ProfileAuthViewSub1(txt: "ProfileAuthView103".localize(), ph_txt: "ProfileAuthView103sub".localize(), frame: subFrame)
        sexView = ProfileAuthViewSub2(txt: "ProfileAuthView104".localize(), ph_txt: "ProfileAuthView104sub".localize(), frame: subFrame)
        ageView = ProfileAuthViewSub2(txt: "ProfileAuthView105".localize(), ph_txt: "ProfileAuthView105sub".localize(), frame: subFrame)
        statusView = ProfileAuthViewSub1(txt: "ProfileAuthView106".localize(), ph_txt: "ProfileAuthView106sub".localize(), frame: subFrame)
        info1View = ProfileAuthViewSub2(txt: "ProfileAuthView107".localize(), ph_txt: "ProfileAuthView107sub".localize(), frame: subFrame)
        info2View = ProfileAuthViewSub2(txt: "ProfileAuthView108".localize(), ph_txt: "ProfileAuthView108sub".localize(), frame: subFrame)
        info3View = ProfileAuthViewSub2(txt: "ProfileAuthView109".localize(), ph_txt: "ProfileAuthView109".localize(), frame: subFrame)
        info4View = ProfileAuthViewSub2(txt: "ProfileAuthView110".localize(), ph_txt: "ProfileAuthView110".localize(), frame: subFrame)
        
        
        sexView.InputView.addTarget(self, action: #selector(btnFunc(_:)), for: .touchUpInside)
        sexBtmView = SelectionSexView(frame: btmFrame)
        
        ageView.InputView.addTarget(self, action: #selector(btnFunc(_:)), for: .touchUpInside)
        birthBtmView = BirthPickerView(frame: btmFrame)
        
        info1View.InputView.addTarget(self, action: #selector(btnFunc(_:)), for: .touchUpInside)
        info1BtmView = ProfileInfoBottomView(type: 0, frame: btmFrame)
        
        info2View.InputView.addTarget(self, action: #selector(btnFunc(_:)), for: .touchUpInside)
        info2BtmView = ProfileInfoBottomView(type: 1, frame: btmFrame)
        
        info3View.InputView.addTarget(self, action: #selector(btnFunc(_:)), for: .touchUpInside)
        info3BtmView = ProfileInfoBottomView(type: 2, frame: btmFrame)
        
        info4View.InputView.addTarget(self, action: #selector(btnFunc(_:)), for: .touchUpInside)
        info4BtmView = ProfileInfoBottomView(type: 3, frame: btmFrame)
        
        setup(frame:frame)
        
    }
    private func setup(frame:CGRect){
        let title_str = "ProfileAuthView001".localize()
        let title_height = title_str.StringHeight(withConstrainedWidth: frame.width - 60, font: UIFont.DeliusBoldType4())
        let sub_str = "ProfileAuthView002".localize()
        let sub_height = sub_str.StringHeight(withConstrainedWidth: frame.width - 60, font: UIFont.DeliusSystemType2())
        
        self.addSubview(titleLabel)
        
        self.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        scrollView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 30).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: frame.width - 60).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: title_height).isActive = true
        scrollView.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: sub_height).isActive = true
        
        scrollView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: subLabel.bottomAnchor,constant: 30).isActive = true
        imageView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: frame.width/2 + 30).isActive = true
        
        let height:CGFloat = 90
        scrollView.addSubview(nameView)
        nameView.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        nameView.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        nameView.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
        nameView.heightAnchor.constraint(equalToConstant: height).isActive = true
        scrollView.addSubview(jobView)
        jobView.topAnchor.constraint(equalTo: nameView.bottomAnchor).isActive = true
        jobView.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        jobView.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
        jobView.heightAnchor.constraint(equalToConstant: height).isActive = true
        scrollView.addSubview(sexView)
        sexView.topAnchor.constraint(equalTo: jobView.bottomAnchor).isActive = true
        sexView.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        sexView.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
        sexView.heightAnchor.constraint(equalToConstant: height).isActive = true
        scrollView.addSubview(ageView)
        ageView.topAnchor.constraint(equalTo: sexView.bottomAnchor).isActive = true
        ageView.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        ageView.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
        ageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        scrollView.addSubview(statusView)
        statusView.topAnchor.constraint(equalTo: ageView.bottomAnchor).isActive = true
        statusView.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        statusView.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
        statusView.heightAnchor.constraint(equalToConstant: height).isActive = true
        scrollView.addSubview(info1View)
        info1View.topAnchor.constraint(equalTo: statusView.bottomAnchor).isActive = true
        info1View.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        info1View.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
        info1View.heightAnchor.constraint(equalToConstant: height).isActive = true
        scrollView.addSubview(info2View)
        info2View.topAnchor.constraint(equalTo: info1View.bottomAnchor).isActive = true
        info2View.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        info2View.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
        info2View.heightAnchor.constraint(equalToConstant: height).isActive = true
        scrollView.addSubview(info3View)
        info3View.topAnchor.constraint(equalTo: info2View.bottomAnchor).isActive = true
        info3View.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        info3View.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
        info3View.heightAnchor.constraint(equalToConstant: height).isActive = true
        scrollView.addSubview(info4View)
        info4View.topAnchor.constraint(equalTo: info3View.bottomAnchor).isActive = true
        info4View.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        info4View.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
        info4View.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        
        scrollView.contentSize = CGSize(width: 0, height: height*9 + 100 + frame.width/2)
        
        
        self.addSubview(shadowView)
        shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shadowView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        shadowView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(sexBtmView)
        nsSexBtm = sexBtmView.topAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        nsSexBtm.isActive = true
        sexBtmView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        sexBtmView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        sexBtmView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        self.addSubview(birthBtmView)
        nsBirthBtm = birthBtmView.topAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        nsBirthBtm.isActive = true
        birthBtmView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        birthBtmView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        birthBtmView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        self.addSubview(info1BtmView)
        nsInfo1Btm = info1BtmView.topAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        nsInfo1Btm.isActive = true
        info1BtmView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        info1BtmView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        info1BtmView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        self.addSubview(info2BtmView)
        nsInfo2Btm = info2BtmView.topAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        nsInfo2Btm.isActive = true
        info2BtmView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        info2BtmView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        info2BtmView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        self.addSubview(info3BtmView)
        nsInfo3Btm = info3BtmView.topAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        nsInfo3Btm.isActive = true
        info3BtmView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        info3BtmView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        info3BtmView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        self.addSubview(info4BtmView)
        nsInfo4Btm = info4BtmView.topAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        nsInfo4Btm.isActive = true
        info4BtmView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        info4BtmView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        info4BtmView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapFunc(_:)))
        shadowView.addGestureRecognizer(tapGesture)
        
        
    }
    @objc func btnFunc(_ sender:UIButton){
        switch sender{
        case sexView.InputView:sexViewAnimation(reverse: false,completion: {})
        case ageView.InputView:birthViewAnimation(reverse: false,completion: {})
        case info1View.InputView:info1ViewAnimation(reverse: false,completion:{})
        case info2View.InputView:info2ViewAnimation(reverse: false,completion:{})
        case info3View.InputView:info3ViewAnimation(reverse: false,completion:{})
        case info4View.InputView:info4ViewAnimation(reverse: false,completion:{})
        default:()
        }
    }
    @objc private func tapFunc(_ sender:UITapGestureRecognizer){
        switch currentBtm{
        case .none:()
        case .sex:
            self.sexViewAnimation(reverse: true, completion: {})
        case .birth:
            self.birthViewAnimation(reverse: true, completion: {})
        case .info1:
            self.info1ViewAnimation(reverse: true, completion: {})
        case .info2:
            self.info2ViewAnimation(reverse: true, completion: {})
        case .info3:
            self.info3ViewAnimation(reverse: true, completion: {})
        case .info4:
            self.info4ViewAnimation(reverse: true, completion: {})
        }
    }
    func sexViewAnimation(reverse:Bool,completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            if reverse{
                self.shadowView.alpha = 0
                self.nsSexBtm.constant = 0
            }else{
                self.shadowView.alpha = 1
                self.nsSexBtm.constant = -250
            }
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                if reverse{
                    self.currentBtm = .none
                }else{
                    self.currentBtm = .sex
                }
                completion()
            }
        }
    }
    func birthViewAnimation(reverse:Bool,completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            if reverse{
                self.shadowView.alpha = 0
                self.nsBirthBtm.constant = 0
            }else{
                self.shadowView.alpha = 1
                self.nsBirthBtm.constant = -250
            }
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                if reverse{
                    self.currentBtm = .none
                }else{
                    self.currentBtm = .birth
                }
                completion()
            }
        }
        
    }
    func info1ViewAnimation(reverse:Bool,completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            if reverse{
                self.shadowView.alpha = 0
                self.nsInfo1Btm.constant = 0
            }else{
                self.shadowView.alpha = 1
                self.nsInfo1Btm.constant = -250
            }
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                if reverse{
                    self.currentBtm = .none
                }else{
                    self.currentBtm = .info1
                }
                completion()
            }
        }
        
    }
    func info2ViewAnimation(reverse:Bool,completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            if reverse{
                self.shadowView.alpha = 0
                self.nsInfo2Btm.constant = 0
            }else{
                self.shadowView.alpha = 1
                self.nsInfo2Btm.constant = -250
            }
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                if reverse{
                    self.currentBtm = .none
                }else{
                    self.currentBtm = .info2
                }
                completion()
            }
        }
        
    }
    func info3ViewAnimation(reverse:Bool,completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            if reverse{
                self.shadowView.alpha = 0
                self.nsInfo3Btm.constant = 0
            }else{
                self.shadowView.alpha = 1
                self.nsInfo3Btm.constant = -250
            }
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                if reverse{
                    self.currentBtm = .none
                }else{
                    self.currentBtm = .info3
                }
                completion()
            }
        }
        
    }
    func info4ViewAnimation(reverse:Bool,completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            if reverse{
                self.shadowView.alpha = 0
                self.nsInfo4Btm.constant = 0
            }else{
                self.shadowView.alpha = 1
                self.nsInfo4Btm.constant = -250
            }
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                if reverse{
                    self.currentBtm = .none
                }else{
                    self.currentBtm = .info4
                }
                completion()
            }
        }
        
    }
}
