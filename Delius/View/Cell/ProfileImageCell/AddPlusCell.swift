//
//  AddPlusCell.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 04/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class AddPlusCell:UICollectionViewCell {
    
    var isAnimate : Bool = true
    
    var plusBtn:CircleButtonWithBackground!
    var profileImage:UIImageView={
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    var removeBtn:CircleButtonWithBackground!
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.MainBlackAlpha()
        self.clipsToBounds = true
        let subRect = CGRect(x:0,y:0,width:30,height:30)
        plusBtn = CircleButtonWithBackground(imgName: "Camera", tintColor: .MainBlackColor2(), backColor: .clear, frame: subRect)
        removeBtn = CircleButtonWithBackground(imgName: "c", tintColor: .white, backColor: UIColor.gradientColor()[4], frame: subRect)
        removeBtn.alpha = 0
        setupLayout()
    }
    
    private func setupLayout(){
        self.addSubview(plusBtn)
        plusBtn.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        plusBtn.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        plusBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        plusBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.addSubview(profileImage)
        profileImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        profileImage.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        profileImage.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        profileImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        self.addSubview(removeBtn)
        removeBtn.topAnchor.constraint(equalTo: topAnchor).isActive = true
        removeBtn.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        removeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        removeBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        profileImage.image = nil
    }
    func startAnimate() {
        let shakeAnimation = CABasicAnimation(keyPath: "transform.rotation")
        shakeAnimation.duration = 0.05
        shakeAnimation.repeatCount = 4
        shakeAnimation.autoreverses = true
        shakeAnimation.duration = 0.2
        shakeAnimation.repeatCount = 99999
        
        let startAngle: Float = (-2) * 3.14159/180
        let stopAngle = -startAngle
        
        shakeAnimation.fromValue = NSNumber(value: startAngle as Float)
        shakeAnimation.toValue = NSNumber(value: 3 * stopAngle as Float)
        shakeAnimation.autoreverses = true
        shakeAnimation.timeOffset = 290 * drand48()
        
        let layer: CALayer = self.profileImage.layer
        UIView.animate(withDuration: 0.2, animations: {
            self.profileImage.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.removeBtn.alpha = 1
            self.layoutIfNeeded()
        })
        layer.add(shakeAnimation, forKey:"animate")
        removeBtn.isHidden = false
        isAnimate = true
    }
    func stopAnimate() {
        let layer: CALayer = self.profileImage.layer
        UIView.animate(withDuration: 0.2, animations: {
            self.profileImage.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.removeBtn.alpha = 0
            self.layoutIfNeeded()
        })
        layer.removeAnimation(forKey: "animate")
        self.removeBtn.isHidden = true
        isAnimate = false
    }
}
