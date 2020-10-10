//
//  AniTestView4.swift
//  aniTest
//
//  Created by user on 2020/09/16.
//  Copyright © 2020 user. All rights reserved.
//
import UIKit

class ActionAnimatorView:UIView {
    private var timer:Timer!
    
    private var varOpac:CGFloat = 1
    private var x_trans:CGFloat = 0
    private var y_trans:CGFloat = 300
    private var rec_w:CGFloat = 1
    private var text_transX:CGFloat = 0
    private var text_transY:CGFloat = 300
    private var triAlpha:CGFloat = 0
    private var starX:CGFloat = 0
    private var starY:CGFloat = 0
    private var star2X:CGFloat = 0
    private var star2Y:CGFloat = 0
    private var starAngle:CGFloat = 0
    
    private var deli_varOpac:CGFloat = 1
    private var deli_x_trans:CGFloat = 0
    private var deli_y_trans:CGFloat = 300
    private var deli_rec_w:CGFloat = 1
    private var deli_text_transX:CGFloat = 0
    private var deli_text_transY:CGFloat = 300
    private var deli_triAlpha:CGFloat = 0
    private var deli_starX:CGFloat = 0
    private var deli_starY:CGFloat = 0
    private var deli_star2X:CGFloat = 0
    private var deli_star2Y:CGFloat = 0
    private var deli_starAngle:CGFloat = 0
    
    private var pass_varOpac:CGFloat = 1
    private var pass_x_trans:CGFloat = 0
    private var pass_y_trans:CGFloat = 300
    private var pass_rec_w:CGFloat = 1
    private var pass_text_transX:CGFloat = 0
    private var pass_text_transY:CGFloat = 300
    private var pass_triAlpha:CGFloat = 0
    private var pass_starX:CGFloat = 0
    private var pass_starY:CGFloat = 0
    private var pass_star2X:CGFloat = 0
    private var pass_star2Y:CGFloat = 0
    private var pass_starAngle:CGFloat = 0
    
    private var match_varOpac:CGFloat = 1
    private var match_x_trans:CGFloat = 0
    private var match_y_trans:CGFloat = 300
    private var match_rec_w:CGFloat = 1
    private var match_text_transX:CGFloat = 0
    private var match_text_transY:CGFloat = 300
    private var match_triAlpha:CGFloat = 0
    private var match_starX:CGFloat = 0
    private var match_starY:CGFloat = 0
    private var match_star2X:CGFloat = 0
    private var match_star2Y:CGFloat = 0
    private var match_starAngle:CGFloat = 0
    
    private var report_varOpac:CGFloat = 1
    private var report_x_trans:CGFloat = 0
    private var report_y_trans:CGFloat = 300
    private var report_rec_w:CGFloat = 1
    private var report_text_transX:CGFloat = 0
    private var report_text_transY:CGFloat = 300
    private var report_triAlpha:CGFloat = 0
    private var report_starX:CGFloat = 0
    private var report_starY:CGFloat = 0
    private var report_star2X:CGFloat = 0
    private var report_star2Y:CGFloat = 0
    private var report_starAngle:CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        ActionStyleKit.drawCanvas(frame: CGRect.zero, resizing: .aspectFit, varOpac: varOpac, x_trans: x_trans, y_trans: y_trans, rec_w: rec_w, text_transX:text_transX, text_transY:text_transY, triAlpha: triAlpha, starX:starX,starY: starY, star2X:star2X,star2Y: star2Y,starAngle:starAngle,deli_varOpac: deli_varOpac, deli_x_trans: deli_x_trans, deli_y_trans: deli_y_trans, deli_rec_w: deli_rec_w, deli_text_transX:deli_text_transX, deli_text_transY:deli_text_transY, deli_triAlpha: deli_triAlpha, deli_starX:deli_starX,deli_starY: deli_starY, deli_star2X:deli_star2X,deli_star2Y: deli_star2Y,deli_starAngle:deli_starAngle, pass_varOpac: pass_varOpac, pass_x_trans: pass_x_trans, pass_y_trans: pass_y_trans, pass_rec_w: pass_rec_w, pass_text_transX:pass_text_transX, pass_text_transY:pass_text_transY, pass_triAlpha: pass_triAlpha, pass_starX:pass_starX,pass_starY: pass_starY, pass_star2X:pass_star2X,pass_star2Y: pass_star2Y,pass_starAngle:pass_starAngle, match_varOpac: match_varOpac, match_x_trans: match_x_trans, match_y_trans: match_y_trans, match_rec_w: match_rec_w, match_text_transX:match_text_transX, match_text_transY:match_text_transY, match_triAlpha: match_triAlpha, match_starX:match_starX,match_starY: match_starY, match_star2X:match_star2X,match_star2Y: match_star2Y,match_starAngle:match_starAngle, report_varOpac: report_varOpac, report_x_trans: report_x_trans, report_y_trans: report_y_trans, report_rec_w: report_rec_w, report_text_transX:report_text_transX, report_text_transY:report_text_transY, report_triAlpha: report_triAlpha, report_starX:report_starX,report_starY: report_starY, report_star2X:report_star2X,report_star2Y: report_star2Y,report_starAngle:report_starAngle)
    }
    func showDefault(){
        self.triAlpha = 0
        self.varOpac = 0
        self.pass_triAlpha = 0
        self.pass_varOpac = 0
        self.deli_varOpac = 0
        self.match_varOpac = 0
        self.match_triAlpha = 0
        self.report_varOpac = 0
        self.report_triAlpha = 0
        self.setNeedsDisplay()
        self.setNeedsLayout()
    }
    func LikeStep(completion:@escaping()->Void){
        var i:CGFloat = 0
        timer = Timer.scheduledTimer(withTimeInterval:0.02, repeats: true, block: { (Timer) in
            if i >= 0 && i < 15 {
                let v = i / 15
                self.step1(value: v)
            }
            else if i >= 15 && i < 40 {
                let v = (i - 15) / 25
                self.step2(value:v)
            }
            else if i == 40{
                self.timer.invalidate()
                completion()
            }
            i += 1
            self.setNeedsDisplay()
            self.setNeedsLayout()
        })
        
    }
    private func step1(value:CGFloat){
        self.varOpac = 1
        self.triAlpha = 0
        self.deli_triAlpha = 0
        self.deli_varOpac = 0
        self.pass_triAlpha = 0
        self.pass_varOpac = 0
        self.match_varOpac = 0
        self.match_triAlpha = 0
        self.report_varOpac = 0
        self.report_triAlpha = 0
        self.x_trans = 89 + value * 30
        self.y_trans = 225 - value * 30
        self.text_transX = 47 + value * 35
        self.text_transY = 258 - value * 35
        self.rec_w =  0 + value * value  * 60

    }
    
    
    private func step2(value:CGFloat){
        self.triAlpha = 1 - value * 2
        self.starX = 65 + value * value * 10
        self.starY = 195 - value * 30
        self.starAngle = 0 - 360 * value
        self.star2X = 65 + value * 30
        self.star2Y = 195 - value * value * 10
        self.starAngle = 0 - 700 * value

    }
    func showLike(){
        
        self.triAlpha = -1
        self.starX = 75
        self.starY = 165
        self.starAngle = -360
        self.star2X = 95
        self.star2Y = 185
        self.starAngle = -700
        self.setNeedsDisplay()
        self.setNeedsLayout()
    }
    
    func DeliStep(completion:@escaping()->Void){
        var i:CGFloat = 0
        timer = Timer.scheduledTimer(withTimeInterval:0.02, repeats: true, block: { (Timer) in
            if i >= 0 && i < 15 {
                let v = i / 15
                self.deliStep1(value: v)
            }
            else if i >= 15 && i < 40 {
                let v = (i - 15) / 25
                self.deliStep2(value:v)
            }
            else if i == 40{
                self.timer.invalidate()
                completion()
            }
            i += 1
            self.setNeedsDisplay()
            self.setNeedsLayout()
        })
    }
    private func deliStep1(value:CGFloat){
        self.triAlpha = 0
        self.varOpac = 0
        self.pass_triAlpha = 0
        self.pass_varOpac = 0
        self.deli_varOpac = 1
        self.match_varOpac = 0
        self.match_triAlpha = 0
        self.report_varOpac = 0
        self.report_triAlpha = 0
        self.deli_x_trans = 89 + value * 30
        self.deli_y_trans = 225 - value * 30
        self.deli_text_transX = 47 + value * 35
        self.deli_text_transY = 258 - value * 35
        self.deli_rec_w =  0 + value * value  * 60

    }
    
    private func deliStep2(value:CGFloat){
        self.deli_triAlpha = 1 - value * 2
        self.deli_starX = 65 + value * value * 10
        self.deli_starY = 195 - value * 30
        self.deli_starAngle = 0 - 360 * value
        self.deli_star2X = 65 + value * 30
        self.deli_star2Y = 195 - value * value * 10
        self.deli_starAngle = 0 - 700 * value

    }
    func showDeli(){
        self.deli_triAlpha = -1
        self.deli_starX = 75
        self.deli_starY = 165
        self.deli_starAngle = -360
        self.deli_star2X = 95
        self.deli_star2Y = 185
        self.deli_starAngle = -700
        self.setNeedsDisplay()
        self.setNeedsLayout()
    }
    func PassStep(completion:@escaping()->Void){
        var i:CGFloat = 0
        timer = Timer.scheduledTimer(withTimeInterval:0.02, repeats: true, block: { (Timer) in
            if i >= 0 && i < 15 {
                let v = i / 15
                self.passStep1(value: v)
            }
            else if i >= 15 && i < 40 {
                let v = (i - 15) / 25
                self.passStep2(value:v)
            }
            else if i == 40{
                self.timer.invalidate()
                completion()
            }
            i += 1
            self.setNeedsDisplay()
            self.setNeedsLayout()
        })
    }
    private func passStep1(value:CGFloat){
        self.pass_varOpac = 1
        self.pass_triAlpha = 0
        self.deli_triAlpha = 0
        self.deli_varOpac = 0
        self.triAlpha = 0
        self.varOpac = 0
        self.match_varOpac = 0
        self.match_triAlpha = 0
        self.report_varOpac = 0
        self.report_triAlpha = 0
        self.pass_x_trans = 89 + value * 30
        self.pass_y_trans = 225 - value * 30
        self.pass_text_transX = 48 + value * 35
        self.pass_text_transY = 256 - value * 35
        self.pass_rec_w =  0 + value * value  * 60

    }
    
    private func passStep2(value:CGFloat){
        self.pass_triAlpha = 1 - value * 2
        self.pass_starX = 65 + value * value * 10
        self.pass_starY = 195 - value * 30
        self.pass_starAngle = 0 - 360 * value
        self.pass_star2X = 65 + value * 30
        self.pass_star2Y = 195 - value * value * 10
        self.pass_starAngle = 0 - 700 * value

    }
    func showPass(){
        self.pass_triAlpha = -1
        self.pass_starX = 75
        self.pass_starY = 165
        self.pass_starAngle = -360
        self.pass_star2X = 95
        self.pass_star2Y = 185
        self.pass_starAngle = -700
        self.setNeedsDisplay()
        self.setNeedsLayout()
    }
    
    func matchStep(completion:@escaping()->Void){
        var i:CGFloat = 0
        timer = Timer.scheduledTimer(withTimeInterval:0.02, repeats: true, block: { (Timer) in
            if i >= 0 && i < 15 {
                let v = i / 15
                self.matchStep1(value: v)
            }
            else if i >= 15 && i < 40 {
                let v = (i - 15) / 25
                self.matchStep2(value:v)
            }
            else if i == 40{
                self.timer.invalidate()
                completion()
            }
            i += 1
            self.setNeedsDisplay()
            self.setNeedsLayout()
        })
    }
    private func matchStep1(value:CGFloat){
        self.match_varOpac = 1
        self.match_triAlpha = 0
        self.varOpac = 0
        self.triAlpha = 0
        self.deli_triAlpha = 0
        self.deli_varOpac = 0
        self.pass_triAlpha = 0
        self.pass_varOpac = 0
        self.report_varOpac = 0
        self.report_triAlpha = 0
        self.match_x_trans = 89 + value * 30
        self.match_y_trans = 225 - value * 30
        self.match_text_transX = 50 + value * 35
        self.match_text_transY = 256 - value * 35
        self.match_rec_w =  0 + value * value  * 60

    }
    
    private func matchStep2(value:CGFloat){
        self.match_triAlpha = 1 - value * 2
        self.match_starX = 65 + value * value * 10
        self.match_starY = 195 - value * 30
        self.match_starAngle = 0 - 360 * value
        self.match_star2X = 65 + value * 30
        self.match_star2Y = 195 - value * value * 10
        self.match_starAngle = 0 - 700 * value

    }
    func showMatch(){
        self.match_triAlpha = -1
        self.match_starX = 75
        self.match_starY = 165
        self.match_starAngle = -360
        self.match_star2X = 95
        self.match_star2Y = 185
        self.match_starAngle = -700
        self.setNeedsDisplay()
        self.setNeedsLayout()
    }
    
    func reportStep(completion:@escaping()->Void){
        var i:CGFloat = 0
        timer = Timer.scheduledTimer(withTimeInterval:0.02, repeats: true, block: { (Timer) in
            if i >= 0 && i < 15 {
                let v = i / 15
                self.reportStep1(value: v)
            }
            else if i >= 15 && i < 40 {
                let v = (i - 15) / 25
                self.reportStep2(value: v)
            }
            else if i == 40{
                self.timer.invalidate()
                completion()
            }
            i += 1
            self.setNeedsDisplay()
            self.setNeedsLayout()
        })
    }
    private func reportStep1(value:CGFloat){
        self.report_varOpac = 1
        self.report_triAlpha = 0
        self.varOpac = 0
        self.triAlpha = 0
        self.deli_triAlpha = 0
        self.deli_varOpac = 0
        self.pass_triAlpha = 0
        self.pass_varOpac = 0
        self.match_varOpac = 0
        self.match_triAlpha = 0
        self.report_x_trans = 89 + value * 30
        self.report_y_trans = 225 - value * 30
        self.report_text_transX = 57.5 + value * 35
        self.report_text_transY = 252 - value * 35
        self.report_rec_w =  0 + value * value  * 70

    }
    
    private func reportStep2(value:CGFloat){
        self.report_triAlpha = 1 - value * 2
        self.report_starX = 70 + value * value * 10
        self.report_starY = 193 - value * 30
        self.report_starAngle = 0 - 360 * value
        self.report_star2X = 70 + value * 30
        self.report_star2Y = 193 - value * value * 10
        self.report_starAngle = 0 - 700 * value

    }
    func showReport(){
        self.report_triAlpha = -1
        self.report_starX = 80
        self.report_starY = 163
        self.report_starAngle = -360
        self.report_star2X = 100
        self.report_star2Y = 183
        self.report_starAngle = -700
        self.setNeedsDisplay()
        self.setNeedsLayout()
        
    }


}

