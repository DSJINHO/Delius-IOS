//
//  RootView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 11/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
final class RootView:UIView{
    
    
    var delegate:RootViewProtocol? = nil
    
    enum pageState{
        case main
        case side
    }
    var rightBtn:IconButton1!
    var contentViewBack:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.MainLightGrayColor2()
        return v
    }()
    var topView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var mainContainerView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        return v
    }()
    var shadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.black
        v.alpha = 0
        return v
    }()
    var rightView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var rightContainerView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        return v
    }()
    var menuView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOffset = CGSize(width: 3, height: 0)
        v.layer.shadowOpacity = 0
        v.layer.shadowRadius = 5
        return v
    }()
    
    lazy var topCollectionView:UICollectionView={
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.clear
        return cv
    }()
    
    var GradientTab:MainGradientView!
    var notiBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("알림", for: .normal)
        b.setTitleColor(UIColor.white, for: .normal)
        b.titleLabel!.font = UIFont.DeliusBoldType2()
        return b
    }()
    var chatBtn:UIButton={
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("채팅", for: .normal)
        b.setTitleColor(UIColor.white, for: .normal)
        b.titleLabel!.font = UIFont.DeliusBoldType2()
        return b
    }()
    var containerView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    var chatView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOffset = CGSize(width: -3, height: 0)
        v.layer.shadowOpacity = 0
        v.layer.shadowRadius = 5
        return v
    }()
    var chatShadowView:UIView={
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.black
        v.alpha = 0
        return v
    }()
    
    
    var menuBtn:IconButton1!
    let logoImageView:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "StringLogo")
        v.tintColor = UIColor.MainBlackColor()
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    //var titleArray = ["나","성수동불방망이"]
    
    
    
    var panGesture : UIPanGestureRecognizer!
    var chatPan:UIPanGestureRecognizer!
    var menuPan:UIPanGestureRecognizer!
    
    var nsLeft:NSLayoutConstraint!
    var nsTop:NSLayoutConstraint!
    var nsMenu:NSLayoutConstraint!
    var currentRightPageState:pageState = .main
    var currentLeftPageState:pageState = .main
    var currentChatPageState:pageState = .main
    
    
    var nsTab0:NSLayoutConstraint!
    var nsChat:NSLayoutConstraint!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        GradientTab = MainGradientView(frame: CGRect(x:0,y:0,width:frame.width-40,height:30))
        rightBtn = IconButton1(imgName: "Notification", color: .black, frame: CGRect(x:0,y:0,width:30,height:30))
        rightBtn.alpha = 0
        setup(width: frame.width)
    }
    private func setup(width:CGFloat){
        
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let topCollectionHeight:CGFloat = 60
        
        
        
        let leftWidth:CGFloat = 100
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(PanGestureFunc(_:)))
        panGesture.maximumNumberOfTouches = 1
        panGesture.delaysTouchesBegan = true
        rightView.addGestureRecognizer(panGesture)
        panGesture.isEnabled = false
        
        chatPan = UIPanGestureRecognizer(target: self, action: #selector(chatPanGestureFunc(_:)))
        chatPan.maximumNumberOfTouches = 1
        chatPan.delaysTouchesBegan = true
        chatView.addGestureRecognizer(chatPan)
        
        menuPan = UIPanGestureRecognizer(target: self, action: #selector(menuPanGestureFunc(_:)))
        menuPan.maximumNumberOfTouches = 1
        menuPan.delaysTouchesBegan = true
        menuView.addGestureRecognizer(menuPan)
        
        
        
        self.addSubview(mainContainerView)
        mainContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nsTab0 = mainContainerView.leftAnchor.constraint(equalTo: leftAnchor)
        nsTab0.isActive = true
        mainContainerView.widthAnchor.constraint(equalToConstant: width).isActive = true
        mainContainerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(shadowView)
        shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shadowView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        shadowView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(rightView)
        rightView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nsLeft = rightView.leftAnchor.constraint(equalTo: leftAnchor, constant: width - 10)
        nsLeft.isActive = true
        rightView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        rightView.widthAnchor.constraint(equalToConstant: width + 10).isActive = true
        
        rightView.addSubview(rightContainerView)
        rightContainerView.topAnchor.constraint(equalTo: rightView.topAnchor).isActive = true
        rightContainerView.leftAnchor.constraint(equalTo: rightView.leftAnchor,constant:10).isActive = true
        rightContainerView.rightAnchor.constraint(equalTo: rightView.rightAnchor).isActive = true
        rightContainerView.bottomAnchor.constraint(equalTo: rightView.bottomAnchor).isActive = true
        
        
        GradientTab.layer.cornerRadius = 5
        GradientTab.clipsToBounds = true
        
        rightContainerView.addSubview(GradientTab)
        GradientTab.leftAnchor.constraint(equalTo: rightContainerView.leftAnchor, constant: 30).isActive = true
        GradientTab.rightAnchor.constraint(equalTo: rightContainerView.rightAnchor, constant: -30).isActive = true
        GradientTab.heightAnchor.constraint(equalToConstant: 30).isActive = true
        GradientTab.topAnchor.constraint(equalTo: topAnchor, constant: topCollectionHeight + topPadding + 40).isActive = true
        
        rightContainerView.addSubview(topCollectionView)
        topCollectionView.topAnchor.constraint(equalTo: rightContainerView.topAnchor,constant: topPadding + 40).isActive = true
        topCollectionView.leftAnchor.constraint(equalTo: rightContainerView.leftAnchor, constant: 30).isActive = true
        topCollectionView.rightAnchor.constraint(equalTo: rightContainerView.rightAnchor, constant: -30).isActive = true
        topCollectionView.heightAnchor.constraint(equalToConstant: topCollectionHeight).isActive = true
        
        
        
        
        
        
        
        GradientTab.addSubview(notiBtn)
        notiBtn.leftAnchor.constraint(equalTo: GradientTab.leftAnchor).isActive = true
        notiBtn.rightAnchor.constraint(equalTo: GradientTab.centerXAnchor).isActive = true
        notiBtn.topAnchor.constraint(equalTo: GradientTab.topAnchor).isActive = true
        notiBtn.bottomAnchor.constraint(equalTo: GradientTab.bottomAnchor).isActive = true
        
        GradientTab.addSubview(chatBtn)
        chatBtn.leftAnchor.constraint(equalTo: GradientTab.centerXAnchor).isActive = true
        chatBtn.rightAnchor.constraint(equalTo: GradientTab.rightAnchor).isActive = true
        chatBtn.topAnchor.constraint(equalTo: GradientTab.topAnchor).isActive = true
        chatBtn.bottomAnchor.constraint(equalTo: GradientTab.bottomAnchor).isActive = true
        
        rightContainerView.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: GradientTab.bottomAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: rightContainerView.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightContainerView.rightAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: rightContainerView.bottomAnchor).isActive = true
        
        self.addSubview(topView)
        topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nsTop = topView.leftAnchor.constraint(equalTo: leftAnchor)
        nsTop.isActive = true
        topView.widthAnchor.constraint(equalToConstant: width).isActive = true
        topView.heightAnchor.constraint(equalToConstant: topPadding + 60).isActive = true
        
        menuBtn = IconButton1(imgName: "List", color: UIColor.black, frame: CGRect(x:0,y:0,width:30,height:30))
        menuBtn.alpha = 0
        
        topView.addSubview(menuBtn)
        menuBtn.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 30).isActive = true
        menuBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        menuBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        menuBtn.centerYAnchor.constraint(equalTo: topView.bottomAnchor, constant: -30).isActive = true
        
        topView.addSubview(logoImageView)
        logoImageView.centerYAnchor.constraint(equalTo: menuBtn.centerYAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        
        topView.addSubview(rightBtn)
        rightBtn.centerYAnchor.constraint(equalTo: menuBtn.centerYAnchor).isActive = true
        rightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        rightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        rightBtn.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -30).isActive = true
        
        self.addSubview(menuView)
        menuView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        menuView.widthAnchor.constraint(equalToConstant: width).isActive = true
        menuView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nsMenu = menuView.leftAnchor.constraint(equalTo: leftAnchor, constant: -width)
        nsMenu.isActive = true
        
        self.addSubview(chatShadowView)
        chatShadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        chatShadowView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        chatShadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        chatShadowView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        self.addSubview(chatView)
        chatView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        chatView.widthAnchor.constraint(equalToConstant: width).isActive = true
        chatView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nsChat = chatView.leftAnchor.constraint(equalTo: rightAnchor)
        nsChat.isActive = true
        
    }
}
extension RootView:UIGestureRecognizerDelegate{
    @objc func PanGestureFunc(_ recognizer: UIPanGestureRecognizer) {
        let gestureIsDraggingFromLeftToRight = (recognizer.velocity(in: self).x > 0)
        let gestureIsDraggingFromRightToLeft = (recognizer.velocity(in: self).x < 0)
        switch recognizer.state {
        case .began:
            switch currentRightPageState{
            case .main:
                if gestureIsDraggingFromLeftToRight { return }
            case .side:
                if gestureIsDraggingFromRightToLeft { return }
            }
        case .changed:
            switch currentRightPageState{
            case .main:
                let offset = recognizer.translation(in: self).x
                controlOpenSize(translationOfx: offset)
            case .side:
                let offset = recognizer.translation(in: self).x
                controlCloseSize(translationOfx: offset)
            }
        case .ended:
            switch currentRightPageState{
            case .main:
                print(recognizer.velocity(in: self),"VELOCITY")
                print(recognizer.translation(in: self).x,"TRANSTITION")
                if recognizer.velocity(in: self).x < -60 {
                    if recognizer.translation(in: self).x < -80{
                        openAnimation()
                    }else{
                        closeAnimation()
                    }
                }else{
                    closeAnimation()
                }
            case .side:
                if recognizer.velocity(in: self).x > 60{
                    if recognizer.translation(in: self).x > 80{
                        closeAnimation()
                    }else{
                        openAnimation()
                    }
                }else{
                    openAnimation()
                }
            }
            self.panGesture.isEnabled = false
            print("end")
        default:
            break
        }
    }
    @objc func chatPanGestureFunc(_ recognizer:UIPanGestureRecognizer){
        let gestureIsDraggingFromLeftToRight = (recognizer.velocity(in: self).x > 0)
        let gestureIsDraggingFromRightToLeft = (recognizer.velocity(in: self).x < 0)
        switch recognizer.state {
        case .began:
            switch currentChatPageState{
            case .main:
                if gestureIsDraggingFromLeftToRight { return }
            case .side:
                if gestureIsDraggingFromRightToLeft { return }
            }
        case .changed:
            switch currentChatPageState{
            case .main:
                let offset = recognizer.translation(in: self).x
                self.controlChatOpenSize(translationOfx: offset)
            case .side:
                let offset = recognizer.translation(in: self).x
                self.controlChatCloseSize(translationOfx: offset)
            }
        case .ended:
            switch currentChatPageState{
            case .main:
                if recognizer.velocity(in: self).x < -60{
                    if recognizer.translation(in: self).x < -80{
                        showChatView()
                    }else{
                        hideChatView {
                            self.delegate?.dismissChatVC()
                        }
                    }
                }else{
                    hideChatView {
                        self.delegate?.dismissChatVC()
                    }
                }
            case .side:
                if recognizer.velocity(in: self).x > 60{
                    if recognizer.translation(in: self).x > 80{
                        hideChatView {
                            self.delegate?.dismissChatVC()
                        }
                    }else{
                        showChatView()
                    }
                }else{
                    showChatView()
                }
            }
            self.chatPan.isEnabled = false
            print("end")
        default:
            break
        }
    }
    @objc func menuPanGestureFunc(_ recognizer:UIPanGestureRecognizer){
        let gestureIsDraggingFromLeftToRight = (recognizer.velocity(in: self).x > 0)
        let gestureIsDraggingFromRightToLeft = (recognizer.velocity(in: self).x < 0)
        switch recognizer.state {
        case .began:
            switch currentLeftPageState{
            case .main:
                if gestureIsDraggingFromLeftToRight { return }
            case .side:
                if gestureIsDraggingFromRightToLeft { return }
            }
        case .changed:
            switch currentLeftPageState{
            case .main:
                let offset = recognizer.translation(in: self).x
                self.controlMenuOpenSize(translationOfx: offset)
            case .side:
                let offset = recognizer.translation(in: self).x
                self.controlMenuCloseSize(translationOfx: offset)
            }
        case .ended:
            switch currentLeftPageState{
            case .main:
                if recognizer.velocity(in: self).x > 60{
                    if recognizer.translation(in: self).x > 80{
                        menuOpenAnimation()
                    }else{
                        menuCloseAnimation()
                    }
                }else{
                    menuCloseAnimation()
                }
            case .side:
                if recognizer.velocity(in: self).x < -60{
                    if recognizer.translation(in: self).x < -80{
                        menuCloseAnimation()
                    }else{
                        menuOpenAnimation()
                    }
                }else{
                    menuOpenAnimation()
                }
            }
            self.menuPan.isEnabled = false
        default:
            break
        }
    }
    func menuOpenAnimation(completion:@escaping()->Void={}){
        let Animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut, animations: {
            self.shadowView.alpha = 1
            self.nsMenu.constant = 0
            self.nsTab0.constant = 300
            self.nsTop.constant = 300
            self.menuView.layer.shadowOpacity = 1
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            switch position{
            case .start:self.menuPan.isEnabled = false
            case .current:self.menuPan.isEnabled = false
            case .end:
                self.currentLeftPageState = .side
                self.menuPan.isEnabled = true
                completion()
            @unknown default:()
            }
        }
    }
    func menuCloseAnimation(completion:@escaping()->Void={}){
        let Animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut, animations: {
            self.shadowView.alpha = 0
            self.nsMenu.constant = -self.frame.width
            self.nsTab0.constant = 0
            self.nsTop.constant = 0
            self.menuView.layer.shadowOpacity = 0
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            switch position{
            case .start:self.menuPan.isEnabled = false
            case .current:self.menuPan.isEnabled = false
            case .end:
                self.menuPan.isEnabled = true
                self.currentLeftPageState = .main
                completion()
            @unknown default:()
            }
        }
    }
    private func controlOpenSize(translationOfx x:CGFloat){
        if x > 0{ return }
        let ratio =  -x/self.frame.width
        let alpha = 1 - 2*ratio
        var scale = 1 -  abs(ratio).squareRoot()*0.1
        if ratio < 0{ scale = 1}
        nsTop.constant = ( x/(self.frame.width)*(self.frame.width - 90))
        self.shadowView.alpha = ratio * 0.1
        nsLeft.constant =  self.frame.width - 10 + x
        nsTab0.constant = -ratio * self.frame.width
        
//        mainContainerView.alpha = alpha
//        mainContainerView.transform = CGAffineTransform(scaleX: scale, y: scale)
        
    }
    private func controlCloseSize(translationOfx x:CGFloat){
        if x < 0 { return }
        let ratio =  x/self.frame.width
        let alpha = -1 + 2*ratio
        var scale = 0.9 + abs(ratio).squareRoot()*0.1
        if ratio > 0{ scale = 0.9 }
        nsLeft.constant =   -10 + x
        self.shadowView.alpha = 0.1 - ratio * 0.1
        nsTop.constant = (-self.frame.width + 90 + x/(self.frame.width)*(self.frame.width - 90))
        nsTab0.constant = (ratio - 1) * self.frame.width
//        mainContainerView.alpha = alpha
//        mainContainerView.transform = CGAffineTransform(scaleX: scale, y: scale)
        
    }
    private func controlChatOpenSize(translationOfx x:CGFloat){
        if x > 0 { return }
        let ratio = -x/self.frame.width
        let width = self.chatView.frame.width
        nsChat.constant = ratio*width
        nsLeft.constant = -ratio*200
        self.chatShadowView.alpha = ratio * 0.5
        self.chatView.layer.shadowOpacity = Float(ratio)
    }
    private func controlChatCloseSize(translationOfx x:CGFloat){
        if x < 0 { return }
        let ratio = x/self.frame.width
        let width = self.chatView.frame.width
        nsChat.constant = -width + ratio*width
        nsLeft.constant = -200 + ratio*200
        self.chatShadowView.alpha = 0.5 - ratio*0.5
        self.chatView.layer.shadowOpacity = Float(1 - ratio*ratio)
    }
    private func controlMenuOpenSize(translationOfx x:CGFloat){
        if x < 0 { return }
        let ratio = x/self.frame.width
        let width = self.frame.width
        nsMenu.constant = ratio*width - width
        nsTab0.constant = ratio*300
        nsTop.constant = ratio*300
        self.shadowView.alpha = ratio
        self.menuView.layer.shadowOpacity = Float(ratio)
    }
    private func controlMenuCloseSize(translationOfx x:CGFloat){
        if x > 0 { return }
        let ratio = -x/self.frame.width
        let width = self.frame.width
        nsMenu.constant = -ratio*width
        nsTop.constant = 300 - ratio*300
        nsTab0.constant = 300 - ratio*300
        self.shadowView.alpha = 1 - ratio
        self.menuView.layer.shadowOpacity = Float(1 - ratio*ratio)
    }
    func openAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn, animations: {
//            self.mainContainerView.alpha = -1
            self.shadowView.alpha = 0.1
//            self.mainContainerView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.nsLeft.constant = -10
            self.nsTab0.constant = -self.frame.width
            self.nsTop.constant =  -(self.frame.width - 90)
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            switch position{
            case .start:self.panGesture.isEnabled = false
            case .current:self.panGesture.isEnabled = false
            case .end:
                self.currentRightPageState = .side
                self.panGesture.isEnabled = true
            @unknown default:()
            }
        }
    }
    func closeAnimation(){
        let Animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn, animations: {
//            self.mainContainerView.alpha = 1
            self.shadowView.alpha = 0
//            self.mainContainerView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.nsLeft.constant = self.frame.width - 10
            self.nsTab0.constant = 0
            self.nsTop.constant = 0
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            switch position{
            case .start:self.panGesture.isEnabled = false
            case .current:self.panGesture.isEnabled = false
            case .end:
                self.panGesture.isEnabled = true
                self.currentRightPageState = .main
            @unknown default:()
            }
        }
        
    }
    func showChatView(){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.nsChat.constant = -self.frame.width
            self.nsLeft.constant = -200
            self.chatShadowView.alpha = 0.5
            self.chatView.layer.shadowOpacity = 1
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            switch position{
            case .start:self.chatPan.isEnabled = false
            case .current:self.chatPan.isEnabled = false
            case .end:
                self.currentChatPageState = .side
                self.chatPan.isEnabled = true
            @unknown default:()
            }
        }
    }
    func hideChatView(completion:@escaping()->Void){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.nsChat.constant = 0
            self.nsLeft.constant = 0
            self.chatShadowView.alpha = 0
            self.chatView.layer.shadowOpacity = 0
            self.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            switch position{
            case .start:self.chatPan.isEnabled = false
            case .current:self.chatPan.isEnabled = false
            case .end:
                self.currentChatPageState = .main
                self.chatPan.isEnabled = true
                self.panGesture.isEnabled = true
                completion()
            @unknown default:()
            }
        }
    }
    
}

