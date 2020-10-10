
//
//  MainIndicaotrView.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 14/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit

class MainIndicatorView: UIView {
    
    var size1:CGSize = CGSize(width: 15, height: 15)
    var color1:UIColor = UIColor.init(displayP3Red: 255/255.0, green: 176/255.0, blue: 161/255.0, alpha: 0)
    var point1:CGPoint = CGPoint(x: 50, y: 50)
    
    var size2:CGSize = CGSize(width: 15, height: 15)
    var color2:UIColor = UIColor.init(displayP3Red: 255/255.0, green: 176/255.0, blue: 161/255.0, alpha: 0)
    var point2:CGPoint = CGPoint(x: 50, y: 50)
    
    var size3:CGSize = CGSize(width: 15, height: 15)
    var color3:UIColor = UIColor.init(displayP3Red: 255/255.0, green: 176/255.0, blue: 161/255.0, alpha: 0)
    var point3:CGPoint = CGPoint(x: 50, y: 50)
    
    var size4:CGSize = CGSize(width: 15, height: 15)
    var color4:UIColor = UIColor.init(displayP3Red: 255/255.0, green: 176/255.0, blue: 161/255.0, alpha: 0)
    var point4:CGPoint = CGPoint(x: 50, y: 50)
    
    var size5:CGSize = CGSize(width: 15, height: 15)
    var color5:UIColor = UIColor.init(displayP3Red: 255/255.0, green: 176/255.0, blue: 161/255.0, alpha: 0)
    var point5:CGPoint = CGPoint(x: 50, y: 50)
    
    var size6:CGSize = CGSize(width: 15, height: 15)
    var color6:UIColor = UIColor.init(displayP3Red: 255/255.0, green: 176/255.0, blue: 161/255.0, alpha: 0)
    var point6:CGPoint = CGPoint(x: 50, y: 50)
    
    override func draw(_ rect: CGRect) {
        self.backgroundColor = .clear
        MainIndicatorStyleKit.drawCanvas1(frame: .zero, resizing: .aspectFit, point1: point1, point2: point2, point3: point3, point4: point4, point5: point5, point6: point6, size1: size1, size2: size2, size3: size3, size4: size4, size5: size5, size6: size6, color1: color1, color2: color2, color3: color3, color4: color4, color5: color5, color6: color6)
        
    }
    
    private func LargeAnimation(input:CGFloat){
        self.color1 = UIColor.init(displayP3Red: 255/255.0, green: 176/255.0 - input*(48/255.0), blue: 161/255.0 - input*(1/255.0), alpha: 1.0)
        self.point1 = CGPoint(x: 50 - input*15, y: 50 - input*26)

        self.setNeedsDisplay()
        self.setNeedsLayout()
        
    }
    private func SmallAnimation(input:CGFloat){
           
        self.color1 = UIColor(displayP3Red: 255/255.0, green: 128/255.0  + input*(48/255.0), blue: 160/255.0 + input*(1/255.0), alpha: 1.0)
        self.point1 = CGPoint(x: 35 + input*15, y: 24 + input*26)
            
        self.setNeedsDisplay()
        self.setNeedsLayout()
        
    }
    private func LargeAnimation2(input:CGFloat){
        self.color1 = UIColor.init(displayP3Red: 255/255.0, green: 176/255.0 - input*(48/255.0), blue: 161/255.0 - input*(1/255.0), alpha: 1.0)
        self.point1 = CGPoint(x: 50 - input*15, y: 50 - input*26)
       
        self.color4 = UIColor.init(displayP3Red: 255/255.0 - input*(3/255.0), green: 176/255.0 - input*(94/255.0), blue: 161/255.0 - input*(23/255.0), alpha: 1.0)
        self.point4 = CGPoint(x: 50 + input*15, y: 50 + input*26)
           
         
           
        self.setNeedsDisplay()
        self.setNeedsLayout()
        
    }
    private func SmallAnimation2(input:CGFloat){
           
        self.color1 = UIColor.init(displayP3Red: 255/255.0, green: 128/255.0  + input*(48/255.0), blue: 160/255.0 + input*(1/255.0), alpha: 1.0)
        self.point1 = CGPoint(x: 35 + input*15, y: 24 + input*26)

           
        self.color4 = UIColor.init(displayP3Red: 247/255.0 + input*(3/255.0), green: 82/255.0 + input*(94/255.0), blue: 138/255.0 + input*(23/255.0), alpha: 1.0)
        self.point4 = CGPoint(x: 65 - input*15, y: 76 - input*26)

           
        self.setNeedsDisplay()
        self.setNeedsLayout()
        
    }
    private func LargeAnimation3(input:CGFloat){
        self.color1 = UIColor.init(displayP3Red: 255/255.0, green: 176/255.0 - input*(48/255.0), blue: 161/255.0 - input*(1/255.0), alpha: 1.0)
        self.point1 = CGPoint(x: 50 - input*15, y: 50 - input*26)
           
        self.color2 = UIColor.init(displayP3Red: 255/255.0 - input*(8/255.0), green: 176/255.0 - input*(94/255.0), blue: 161/255.0 - input*(23/255.0), alpha: 1.0)
        self.point2 = CGPoint(x: 50 + input*15, y: 50 - input*26)
           

        self.color4 = UIColor.init(displayP3Red: 255/255.0 - input*(3/255.0), green: 176/255.0 - input*(94/255.0), blue: 161/255.0 - input*(23/255.0), alpha: 1.0)
        self.point4 = CGPoint(x: 50 + input*15, y: 50 + input*26)
           
        self.color5 = UIColor.init(displayP3Red: 255/255.0 - input*(146/255.0), green: 176/255.0 - input*(11/255.0), blue: 161/255.0 + input*(25/255.0), alpha: 1.0)
        self.point5 = CGPoint(x: 50 - input*15, y: 50 + input*26)
           
           
        self.setNeedsDisplay()
        self.setNeedsLayout()
        
    }
    private func SmallAnimation3(input:CGFloat){
              
        self.color1 = UIColor.init(displayP3Red: 255/255.0, green: 128/255.0  + input*(48/255.0), blue: 160/255.0 + input*(1/255.0), alpha: 1.0)
        self.point1 = CGPoint(x: 35 + input*15, y: 24 + input*26)
           
        self.color2 = UIColor.init(displayP3Red: 247/255.0 + input*(8/255.0), green: 82/255.0 + input*(94/255.0), blue: 138/255.0 + input*(23/255.0), alpha: 1.0)
        self.point2 = CGPoint(x: 65 - input*15, y: 24 + input*26)
            
           
        self.color4 = UIColor.init(displayP3Red: 247/255.0 + input*(3/255.0), green: 82/255.0 + input*(94/255.0), blue: 138/255.0 + input*(23/255.0), alpha: 1.0)
        self.point4 = CGPoint(x: 65 - input*15, y: 76 - input*26)
           
        self.color5 = UIColor.init(displayP3Red: 109/255.0 + input*(146/255.0), green: 165/255.0 + input*(11/255.0), blue: 186/255.0 - input*(25/255.0), alpha: 1.0)
        self.point5 = CGPoint(x: 35 + input*15, y: 76 - input*26)

          

           
        self.setNeedsDisplay()
        self.setNeedsLayout()
        
    }
    private func LargeAnimation4(input:CGFloat){
        self.color1 = UIColor.init(displayP3Red: 255/255.0, green: 176/255.0 - input*(48/255.0), blue: 161/255.0 - input*(1/255.0), alpha: 1.0)
        self.point1 = CGPoint(x: 50 - input*15, y: 50 - input*26)
           
        self.color2 = UIColor.init(displayP3Red: 255/255.0 - input*(8/255.0), green: 176/255.0 - input*(94/255.0), blue: 161/255.0 - input*(23/255.0), alpha: 1.0)
        self.point2 = CGPoint(x: 50 + input*15, y: 50 - input*26)
           
        self.color3 = UIColor(displayP3Red: 255/255.0, green: 176/255.0  - input*(88/255.0), blue: 161/255.0 - input*(19/255.0), alpha: 1.0)
        self.point3 = CGPoint(x: 50 + input*30, y: 50)

        self.color4 = UIColor.init(displayP3Red: 255/255.0 - input*(3/255.0), green: 176/255.0 - input*(94/255.0), blue: 161/255.0 - input*(23/255.0), alpha: 1.0)
        self.point4 = CGPoint(x: 50 + input*15, y: 50 + input*26)
           
        self.color5 = UIColor.init(displayP3Red: 255/255.0 - input*(146/255.0), green: 176/255.0 - input*(11/255.0), blue: 161/255.0 + input*(25/255.0), alpha: 1.0)
        self.point5 = CGPoint(x: 50 - input*15, y: 50 + input*26)
           
        self.color6 = UIColor(displayP3Red: 255/255.0 - input*(24/255.0), green: 176/255.0  + input*(7/255.0), blue: 110/255.0 + input*(18/255.0), alpha: 1.0)
        self.point6 = CGPoint(x: 50 - input*30, y: 50)
        
        self.setNeedsDisplay()
        self.setNeedsLayout()
        
    }
    private func SmallAnimation4(input:CGFloat){
              
        self.color1 = UIColor.init(displayP3Red: 255/255.0, green: 128/255.0  + input*(48/255.0), blue: 160/255.0 + input*(1/255.0), alpha: 1.0)
        self.point1 = CGPoint(x: 35 + input*30, y: 24)
           
        self.color2 = UIColor.init(displayP3Red: 247/255.0 + input*(8/255.0), green: 82/255.0 + input*(94/255.0), blue: 138/255.0 + input*(23/255.0), alpha: 1.0)
        self.point2 = CGPoint(x: 65 + input*15, y: 24 + input*26)
            
        self.color3 = UIColor(displayP3Red: 255/255.0, green: 88/255.0  - input*(88/255.0), blue: 142/255.0 + input*(19/255.0), alpha: 1.0)
        self.point3 = CGPoint(x: 80 - input*15, y: 50 + input*26)

        self.color4 = UIColor.init(displayP3Red: 247/255.0 + input*(3/255.0), green: 82/255.0 + input*(94/255.0), blue: 138/255.0 + input*(23/255.0), alpha: 1.0)
        self.point4 = CGPoint(x: 65 - input*30, y: 76)
       
        self.color5 = UIColor.init(displayP3Red: 109/255.0 + input*(146/255.0), green: 165/255.0 + input*(11/255.0), blue: 186/255.0 - input*(25/255.0), alpha: 1.0)
        self.point5 = CGPoint(x: 35 - input*15, y: 76 - input*26)

        self.color6 = UIColor(displayP3Red: 231/255.0 + input*(24/255.0), green: 183/255.0 - input*(7/255.0), blue: 179/255.0 - input*(18/255.0), alpha: 1.0)
        self.point6 = CGPoint(x: 20 + input*15, y: 50 - input*26)
           
        self.setNeedsDisplay()
        self.setNeedsLayout()
        
    }
    private func SmallAnimation5(input:CGFloat){
               
        self.color1 = UIColor.init(displayP3Red: 255/255.0, green: 128/255.0  + input*(48/255.0), blue: 160/255.0 + input*(1/255.0), alpha: 1.0)
        self.point1 = CGPoint(x: 65 - input*15, y: 24 + input*26)
            
        self.color2 = UIColor.init(displayP3Red: 247/255.0 + input*(8/255.0), green: 82/255.0 + input*(94/255.0), blue: 138/255.0 + input*(23/255.0), alpha: 1.0)
        self.point2 = CGPoint(x: 80 - input*30, y: 50)
            
        self.color3 = UIColor(displayP3Red: 255/255.0, green: 88/255.0  - input*(88/255.0), blue: 142/255.0 + input*(19/255.0), alpha: 1.0)
        self.point3 = CGPoint(x: 65 - input*15, y: 76 - input*26)

        self.color4 = UIColor.init(displayP3Red: 247/255.0 + input*(3/255.0), green: 82/255.0 + input*(94/255.0), blue: 138/255.0 + input*(23/255.0), alpha: 1.0)
        self.point4 = CGPoint(x: 35 + input*15, y: 76 - input*26)
        
        self.color5 = UIColor.init(displayP3Red: 109/255.0 + input*(146/255.0), green: 165/255.0 + input*(11/255.0), blue: 186/255.0 - input*(25/255.0), alpha: 1.0)
        self.point5 = CGPoint(x: 20 + input*30, y: 50)

        self.color6 = UIColor(displayP3Red: 231/255.0 + input*(24/255.0), green: 183/255.0 - input*(7/255.0), blue: 179/255.0 - input*(18/255.0), alpha: 1.0)
        self.point6 = CGPoint(x: 35 + input*15, y: 24 + input*26)
            
        self.setNeedsDisplay()
        self.setNeedsLayout()
        
    }

    
    private var timer:Timer!
    func TimeAnimation(){
        let n :CGFloat = 10
        var value = 0
        var value2 : CGFloat = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { (Timer) in
            var input = value2/n
            input = input*input*input*input
            switch value{
            case 0:
                 self.LargeAnimation(input: input)
                if value2 == n{value+=1;value2=0}
                value2+=1
            case 1:
                self.SmallAnimation(input: input)
                if value2 == n{value+=1;value2=0}
                value2+=1
            case 2:
                self.LargeAnimation2(input: input)
                if value2 == n{value+=1;value2=0}
                value2+=1
            case 3:
                self.SmallAnimation2(input: input)
                if value2 == n{value+=1;value2=0}
                value2+=1
            case 4:
                self.LargeAnimation3(input: input)
                if value2 == n{value+=1;value2=0}
                value2+=1
            case 5:
                self.SmallAnimation3(input: input)
                if value2 == n{value+=1;value2=0}
                value2+=1
            case 6:
                self.LargeAnimation4(input: input)
                if value2 == n{value+=1;value2=0}
                value2+=1
            case 7:
                self.SmallAnimation4(input: input)
                if value2 == n{value+=1;value2=0}
                value2+=1
            default:
                self.SmallAnimation5(input: input)
                if value2 == n{value=0;value2=0}
                value2+=1
            }
        }
        
    }
    func invalidateFunc(){
        if let f = timer{
            f.invalidate()
        }
    }

}
