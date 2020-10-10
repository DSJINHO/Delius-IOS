//
//  RoundButton.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 03/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

class RoundButton:UIButton{
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(txt:String,color:UIColor,frame: CGRect) {
        super.init(frame:frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = 2
        layer.borderColor = color.cgColor
        layer.cornerRadius = frame.height/2
        setTitle(txt, for: .normal)
        setTitleColor(color, for: .normal)
        
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        backgroundColor = UIColor(cgColor: layer.borderColor!)
        setTitleColor(.white, for: .normal)
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        backgroundColor = .clear
        setTitleColor(UIColor(cgColor: layer.borderColor!), for: .normal)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        backgroundColor = .clear
        setTitleColor(UIColor(cgColor: layer.borderColor!), for: .normal)
        sendActions(for: .touchUpInside)
    }
}
