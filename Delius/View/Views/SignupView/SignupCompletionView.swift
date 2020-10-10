//
//  SignupCompletionView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 14/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
final class SignupCompletionView:UIView{
    
    let titleLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SignupCompletionView001".localize(), txtAlignment: .center, ft: UIFont.DeliusBoldType1(), txtColor: .MainBlackColor1())
        return l
    }()
    let subLabel:UILabel={
        let l = UILabel()
        l.DeliusLabel(txt: "SignupCompletionView002".localize(), txtAlignment: .center, ft: UIFont.DeliusSystemType1(), txtColor: .MainBlackColor2())
        return l
    }()
    var indicatorView:MainIndicatorView!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        indicatorView = MainIndicatorView(frame: CGRect(x:0,y:0,width:100,height:100))
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.backgroundColor = .clear
        setup(width: frame.width)
    }
    private func setup(width:CGFloat){
        self.addSubview(indicatorView)
        indicatorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        indicatorView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        indicatorView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        indicatorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        let subLabelHeight = "SignupCompletiongView002".localize().StringHeight(withConstrainedWidth: width, font: UIFont.DeliusSystemType1())
        self.addSubview(subLabel)
        subLabel.bottomAnchor.constraint(equalTo: indicatorView.topAnchor,constant: -20).isActive = true
        subLabel.leftAnchor.constraint(equalTo: leftAnchor,constant: 30).isActive = true
        subLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: subLabelHeight).isActive = true
        
        let titleLabelHeight = "SignpuCompletiongView001".localize().StringHeight(withConstrainedWidth: width, font: UIFont.DeliusBoldType1())
        self.addSubview(titleLabel)
        titleLabel.bottomAnchor.constraint(equalTo: subLabel.topAnchor, constant: -10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: titleLabelHeight).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
    }
}
