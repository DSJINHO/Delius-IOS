//
//  MatchFilterView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 19/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
final class MatchFilterView:UIView{
    
    
    
    var slider:RangeSlider!
    
    var sSlider:SingleSlider!
    
   
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.black
        print(frame.width)
        setup(width:frame.width)
    }
    private func setup(width:CGFloat){
        slider = RangeSlider(frame: CGRect(x:0,y:0,width:width-40,height:30))
        slider.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(slider)
        slider.topAnchor.constraint(equalTo: topAnchor).isActive = true
        slider.leftAnchor.constraint(equalTo: leftAnchor,constant: 20).isActive = true
        slider.rightAnchor.constraint(equalTo: rightAnchor,constant: -20).isActive = true
        slider.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        slider.addTarget(self, action: #selector(aa(_:)), for: .valueChanged)
        
        
        sSlider = SingleSlider(frame: CGRect(x:0,y:0,width:width-40,height:30))
        sSlider.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(sSlider)
        sSlider.topAnchor.constraint(equalTo: centerYAnchor, constant: 100).isActive = true
        sSlider.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        sSlider.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        sSlider.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    private func setRangeSlider(){
        
    }
    @objc func aa(_ sender:UIControl){
        if sender == slider{
            print("minimumValue",slider.lowerValue)
            print("maximumValue",slider.upperValue)
        }
    }
    
    
}
