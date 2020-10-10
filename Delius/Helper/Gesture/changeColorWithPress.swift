//
//  changeColorWithPress.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 02/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

class changeColorWithTapGesture:UITapGestureRecognizer{
    override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
        
    }
    let alphaView:UIView={
        let v = UIView()
        v.backgroundColor = UIColor.gray
        v.alpha = 0.5
        return v
    }()
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        alphaView.frame = view!.bounds
        view!.addSubview(alphaView)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        alphaView.removeFromSuperview()
        print("canceld")
        super.touchesCancelled(touches, with: event)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
       
        alphaView.removeFromSuperview()
        print("ended")
        super.touchesEnded(touches, with: event)
    }
}

