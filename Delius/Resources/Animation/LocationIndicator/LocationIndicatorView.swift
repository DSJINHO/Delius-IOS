//
//  LocationIndicatorView.swift
//  Delius
//
//  Created by user on 2020/08/21.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
class LocationIndicatorView:UIView{
    
    
    var scale1:CGFloat = 0.2
    
    var alpha1:CGFloat = 1
    
    let defaultScale:CGFloat = 0.2
    
    var color1:UIColor = UIColor.MainColor()
    override init(frame:CGRect){
        super.init(frame:frame)
        self.backgroundColor = UIColor.clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        LocationIndicator.drawCanvas1(frame: CGRect.zero, resizing: .aspectFit, scale1: scale1, alpha1: alpha1)
    }
    private func circleAnimation(input:CGFloat){
        self.alpha1 = 1 - input*input
        self.scale1 = defaultScale + input*1.2
        self.setNeedsDisplay()
        self.setNeedsLayout()
    }
    private var timer:Timer!
    func timeAnimation(completion:@escaping()->Void){
        var value:CGFloat = 0
        let stepCount:CGFloat = 40
        var input:CGFloat = 0
//        input = input
        timer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true, block: { (Timer) in
            if (value == stepCount){
                self.timer.invalidate()
                completion()
                return
            }
            input = value / stepCount
            self.circleAnimation(input: input)
            value += 1
        })
    }
    
}
