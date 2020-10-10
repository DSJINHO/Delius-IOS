//
//  FindAccountVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 26/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//
private enum pageState{
    case main,email,pw
}
import UIKit

class FindAccountVC: UIViewController {
    
    var contentView:FindAccountView!
    var emailView:FindEmailAccountView!
    
    private var currentPage:pageState = .main
    private var nsEmail:NSLayoutConstraint!
    private var nsPW:NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()

    }
    private func setup(){
        contentView = FindAccountView(frame: view.bounds)
        contentView.frame = view.bounds
        view.addSubview(contentView)
        
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let contentHeight = view.frame.height - topPadding - 60
        emailView = FindEmailAccountView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: contentHeight))
        view.addSubview(emailView)
        emailView.topAnchor.constraint(equalTo: view.topAnchor,constant: topPadding + 60).isActive = true
        emailView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        emailView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        nsEmail = emailView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.frame.width)
        nsEmail.isActive = true
        
        contentView.cancelBtn.addTarget(self, action: #selector(cancelFunc(_:)), for: .touchUpInside)
        contentView.backBtn.addTarget(self, action: #selector(backFunc(_:)), for: .touchUpInside)
        contentView.findEmailView.addTarget(self, action: #selector(listBtnFunc(_:)), for: .touchUpInside)
        contentView.findPWView.addTarget(self, action: #selector(listBtnFunc(_:)), for: .touchUpInside)
        emailView.sendBtn.addTarget(self, action: #selector(sendBtnFunc(_:)), for: .touchUpInside)
        emailView.verifyBtn.addTarget(self, action: #selector(verifyBtnFunc(_:)), for: .touchUpInside)
    }
    @objc func cancelFunc(_ sender:UIButton){
        dismiss(animated: true, completion: {})
    }
    @objc func backFunc(_ sender:UIButton){
        if currentPage == .email{
            MoveToEmailView(reverse: true)
        }else{
            
        }
    }
    @objc func listBtnFunc(_ sender:UIButton){
        if sender == contentView.findEmailView{
            MoveToEmailView(reverse: false)
        }else{
            
        }
    }
    private func MoveToEmailView(reverse:Bool){
        let Animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn, animations: {
            if reverse{
                self.nsEmail.constant = self.view.frame.width
                self.contentView.backBtn.alpha = 0
                self.contentView.nsTitle.constant = 0
                self.contentView.nsEmail.constant = 120
                self.contentView.titleLabel.alpha = 1
                self.contentView.emailLabel.alpha = 0
            }else{
                self.nsEmail.constant = 0
                self.contentView.backBtn.alpha = 1
                self.contentView.nsTitle.constant = -120
                self.contentView.nsEmail.constant = 0
                self.contentView.titleLabel.alpha = 0
                self.contentView.emailLabel.alpha = 1
                
            }
            self.view.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                if reverse{
                    self.currentPage = .main
                }else{
                    self.currentPage = .email
                }
            }
        }
    }
    private func MoveToPWView(){
    }
    @objc func sendBtnFunc(_ sender:UIButton){
        emailView.verifyBtn.alpha = 1
        emailView.verifyNumField.alpha = 1
    }
    @objc private func verifyBtnFunc(_ sender:UIButton){
        emailView.answerView.isHidden = false
        
    }


}
