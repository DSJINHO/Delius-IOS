//
//  LoginView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 03/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class LoginView: UIView{
    
    var cancelBtn:UIButton={
        let b = UIButton()
        b.DeliusTeyp2(img: UIImage(named: "c")!, tint: .black)
        return b
    }()
    let titleImageView:UIView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var EmailEdt:LoginTextField!
    var PasswordEdt:LoginTextField!
    
    var loginBtn:LoginButton!
    var signupBtn:UIButton={
        let b = UIButton()
        b.DeliusType3(txt: "LoginView101".localize(), color: .MainGrayColor(), backColor: .clear)
        b.titleLabel!.font = UIFont.DeliusBoldType2()
        return b
    }()
    var findAccountBtn:UIButton={
        let b = UIButton()
        b.DeliusType3(txt: "LoginView102".localize(), color: .MainGrayColor(), backColor: .clear)
        b.titleLabel!.font = UIFont.DeliusBoldType2()
        return b
    }()
    let imgL:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "alphabetL")
        v.contentMode = .scaleAspectFit
        v.alpha = 0
        return v
    }()
    let imgO:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "alphabetO")
        v.contentMode = .scaleAspectFit
        v.alpha = 0
        return v
    }()
    let imgG:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "alphabetG")
        v.contentMode = .scaleAspectFit
        v.alpha = 0
        return v
    }()
    let imgI:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "alphabetI")
        v.contentMode = .scaleAspectFit
        v.alpha = 0
        return v
    }()
    let imgN:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.image = UIImage(named: "alphabetN")
        v.contentMode = .scaleAspectFit
        v.alpha = 0
        return v
    }()
    var line:UILabel={
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = UIColor.MainGrayColor()
        l.alpha = 1
        return l
    }()
    
    private var nsL,nsO,nsG,nsI,nsN : NSLayoutConstraint!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        EmailEdt = LoginTextField(placeHolder: "Email Address".localize(), frame: CGRect(x:0,y:0,width:frame.width-60,height:50))
        PasswordEdt = LoginTextField(placeHolder: "Password".localize(), frame: CGRect(x:0,y:0,width:frame.width-60,height:50))
        loginBtn = LoginButton(frame: CGRect(x:0,y:0,width: frame.width-60,height:60))
        
        EmailEdt.textField.keyboardType = .emailAddress
        PasswordEdt.textField.isSecureTextEntry = true
        setup(frame: frame)
    }
    func setup(frame:CGRect){
        let width = frame.width
        
        self.addSubview(cancelBtn)
        cancelBtn.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        cancelBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        cancelBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cancelBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        self.addSubview(titleImageView)
        titleImageView.topAnchor.constraint(equalTo: cancelBtn.bottomAnchor, constant: 40).isActive = true
        titleImageView.widthAnchor.constraint(equalToConstant: width/2).isActive = true
        titleImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        titleImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        self.addSubview(EmailEdt)
        EmailEdt.topAnchor.constraint(equalTo: titleImageView.bottomAnchor,constant: 30).isActive = true
        EmailEdt.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        EmailEdt.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        EmailEdt.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.addSubview(PasswordEdt)
        PasswordEdt.topAnchor.constraint(equalTo: EmailEdt.bottomAnchor, constant: 10).isActive = true
        PasswordEdt.leftAnchor.constraint(equalTo: EmailEdt.leftAnchor).isActive = true
        PasswordEdt.rightAnchor.constraint(equalTo: EmailEdt.rightAnchor).isActive = true
        PasswordEdt.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.addSubview(loginBtn)
        loginBtn.leftAnchor.constraint(equalTo: PasswordEdt.leftAnchor).isActive = true
        loginBtn.rightAnchor.constraint(equalTo: PasswordEdt.rightAnchor).isActive = true
        loginBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        loginBtn.topAnchor.constraint(equalTo: PasswordEdt.bottomAnchor, constant: 20).isActive = true
        self.addSubview(signupBtn)
        signupBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        signupBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        signupBtn.centerXAnchor.constraint(equalTo: centerXAnchor,constant: -width/4).isActive = true
        signupBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        self.addSubview(findAccountBtn)
        findAccountBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        findAccountBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        findAccountBtn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: width/4).isActive = true
        findAccountBtn.bottomAnchor.constraint(equalTo: signupBtn.bottomAnchor).isActive = true
        self.addSubview(line)
        line.centerYAnchor.constraint(equalTo: signupBtn.centerYAnchor).isActive = true
        line.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 20).isActive = true
        line.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        let imgHeight:CGFloat = frame.width/7
        let imgWidth1:CGFloat = imgHeight/2 + 5
        let imgWidth2:CGFloat = imgHeight/15 + 5
        titleImageView.addSubview(imgL)
        imgL.centerYAnchor.constraint(equalTo: titleImageView.centerYAnchor).isActive = true
        imgL.widthAnchor.constraint(equalToConstant: imgWidth2).isActive = true
        imgL.heightAnchor.constraint(equalToConstant: imgHeight).isActive = true
        
        titleImageView.addSubview(imgO)
        imgO.centerYAnchor.constraint(equalTo: titleImageView.centerYAnchor).isActive = true
        imgO.widthAnchor.constraint(equalToConstant: imgWidth1).isActive = true
        imgO.heightAnchor.constraint(equalToConstant: imgHeight).isActive = true
        
        titleImageView.addSubview(imgG)
        imgG.centerYAnchor.constraint(equalTo: titleImageView.centerYAnchor).isActive = true
        imgG.widthAnchor.constraint(equalToConstant: imgWidth1).isActive = true
        imgG.heightAnchor.constraint(equalToConstant: imgHeight).isActive = true
        
        titleImageView.addSubview(imgI)
        imgI.centerYAnchor.constraint(equalTo: titleImageView.centerYAnchor).isActive = true
        imgI.widthAnchor.constraint(equalToConstant: imgWidth2).isActive = true
        imgI.heightAnchor.constraint(equalToConstant: imgHeight).isActive = true
        
        titleImageView.addSubview(imgN)
        imgN.centerYAnchor.constraint(equalTo: titleImageView.centerYAnchor).isActive = true
        imgN.widthAnchor.constraint(equalToConstant: imgWidth1).isActive = true
        imgN.heightAnchor.constraint(equalToConstant: imgHeight).isActive = true
        
        let willSpacing1 = imgWidth1/2*3 + imgWidth2/2
        let willSpacing2 = imgWidth1
        let willSpacing3 = imgWidth2/2 + imgWidth1/2
        let willSpacing4 = imgWidth2 + imgWidth1
        let movingSpacing:CGFloat = 30
        nsL = imgL.centerXAnchor.constraint(equalTo: titleImageView.centerXAnchor,constant: -willSpacing1 + movingSpacing)
        nsL.isActive = true// -imgWidth1/2*3 + imgWidth2/2
        
        nsO = imgO.centerXAnchor.constraint(equalTo: titleImageView.centerXAnchor,constant: -willSpacing2 + movingSpacing)
        nsO.isActive = true// -imgWidth1
        
        nsG = imgG.centerXAnchor.constraint(equalTo: titleImageView.centerXAnchor, constant: movingSpacing)
        nsG.isActive = true// 0
        
        nsI = imgI.centerXAnchor.constraint(equalTo: titleImageView.centerXAnchor, constant: willSpacing3 + movingSpacing)
        nsI.isActive = true// imgwidth1
        
        nsN = imgN.centerXAnchor.constraint(equalTo: titleImageView.centerXAnchor, constant: willSpacing4 + movingSpacing)
        nsN.isActive = true// imgWidth2/2*3 + imgWidth1/2
        
    }
    
    func openAimation(){
        let imgHeight:CGFloat = frame.width/7
        let imgWidth1:CGFloat = imgHeight/2 + 5
        let imgWidth2:CGFloat = imgHeight/15 + 5
        let willSpacing1 = imgWidth1/2*3 + imgWidth2/2
        let willSpacing2 = imgWidth1
        let willSpacing3 = imgWidth2/2 + imgWidth1/2
        let willSpacing4 = imgWidth2 + imgWidth1
        let imgs = [imgL,imgO,imgG,imgI,imgN]
        let nsConstraints = [nsL,nsO,nsG,nsI,nsN]
        let cgFloatValues:[CGFloat] = [-willSpacing1,-willSpacing2,0,willSpacing3,willSpacing4]
        var order = 0
        let delayTerm = 0.1
        for i in imgs{
            UIView.animate(withDuration: 0.2, delay: delayTerm * Double(order), options: .curveEaseOut, animations: {
                i.alpha = 1
                nsConstraints[order]?.constant = cgFloatValues[order]
                order += 1
                self.layoutIfNeeded()
            })
        }
    }
    
}
