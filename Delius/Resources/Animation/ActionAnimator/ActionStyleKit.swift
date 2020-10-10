//
//  AniTestCode4.swift
//  aniTest
//
//  Created by user on 2020/09/16.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

public class ActionStyleKit : NSObject {
    
    
    @objc dynamic public class func drawCanvas(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 300, height: 300), resizing: ResizingBehavior = .aspectFit, varOpac: CGFloat = 1, x_trans:CGFloat = 0 ,y_trans:CGFloat = 300, rec_w:CGFloat = 0 , text_transX:CGFloat = 0 ,text_transY:CGFloat = 0, triAlpha:CGFloat = 0, starX:CGFloat = 0,starY:CGFloat = 0, star2X:CGFloat = 0, star2Y:CGFloat = 0, starAngle:CGFloat = 0,deli_varOpac: CGFloat = 1, deli_x_trans:CGFloat = 0 ,deli_y_trans:CGFloat = 300, deli_rec_w:CGFloat = 0 , deli_text_transX:CGFloat = 0 ,deli_text_transY:CGFloat = 0, deli_triAlpha:CGFloat = 0, deli_starX:CGFloat = 0,deli_starY:CGFloat = 0, deli_star2X:CGFloat = 0, deli_star2Y:CGFloat = 0, deli_starAngle:CGFloat = 0,pass_varOpac: CGFloat = 1, pass_x_trans:CGFloat = 0 ,pass_y_trans:CGFloat = 300, pass_rec_w:CGFloat = 0 , pass_text_transX:CGFloat = 0 ,pass_text_transY:CGFloat = 0, pass_triAlpha:CGFloat = 0, pass_starX:CGFloat = 0,pass_starY:CGFloat = 0, pass_star2X:CGFloat = 0, pass_star2Y:CGFloat = 0, pass_starAngle:CGFloat = 0, match_varOpac: CGFloat = 1, match_x_trans:CGFloat = 0 ,match_y_trans:CGFloat = 300, match_rec_w:CGFloat = 0 , match_text_transX:CGFloat = 0 ,match_text_transY:CGFloat = 0, match_triAlpha:CGFloat = 0, match_starX:CGFloat = 0,match_starY:CGFloat = 0, match_star2X:CGFloat = 0, match_star2Y:CGFloat = 0, match_starAngle:CGFloat = 0, report_varOpac: CGFloat = 1, report_x_trans:CGFloat = 0 ,report_y_trans:CGFloat = 300, report_rec_w:CGFloat = 0 , report_text_transX:CGFloat = 0 ,report_text_transY:CGFloat = 0, report_triAlpha:CGFloat = 0, report_starX:CGFloat = 0,report_starY:CGFloat = 0, report_star2X:CGFloat = 0, report_star2Y:CGFloat = 0, report_starAngle:CGFloat = 0 ){
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 300, height: 300), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 300, y: resizedFrame.height / 300)
//     쉐도우에쓰임 let resizedShadowScale: CGFloat = min(resizedFrame.width / 300, resizedFrame.height / 300)
        
        
        let color1 = UIColor(red: 0.543, green: 0.357, blue: 0.857, alpha: 1.000)
        let color2 = UIColor(red: 0.535, green: 0.688, blue: 1.000, alpha: 1.000)
        let color3 = UIColor(red: 1.000, green: 0.492, blue: 0.729, alpha: 1.000)
       
        //star
        context.saveGState()
        
        context.translateBy(x: (starX), y: (starY))
        context.rotate(by: -starAngle * CGFloat.pi/180)

        context.saveGState()
        context.setAlpha(triAlpha)

        let starPath = UIBezierPath()
        starPath.move(to: CGPoint(x: 0, y: -4.75))
        starPath.addLine(to: CGPoint(x: 1.68, y: -2.31))
        starPath.addLine(to: CGPoint(x: 4.52, y: -1.47))
        starPath.addLine(to: CGPoint(x: 2.71, y: 0.88))
        starPath.addLine(to: CGPoint(x: 2.79, y: 3.84))
        starPath.addLine(to: CGPoint(x: 0, y: 2.85))
        starPath.addLine(to: CGPoint(x: -2.79, y: 3.84))
        starPath.addLine(to: CGPoint(x: -2.71, y: 0.88))
        starPath.addLine(to: CGPoint(x: -4.52, y: -1.47))
        starPath.addLine(to: CGPoint(x: -1.68, y: -2.31))
        starPath.close()
        color1.setFill()
        starPath.fill()

        context.restoreGState()

        context.restoreGState()
        //star2
        context.saveGState()
        context.translateBy(x: (star2X), y: (star2Y))
        context.rotate(by: -starAngle * CGFloat.pi/180)

        context.saveGState()
        context.setAlpha(triAlpha)

        let star2Path = UIBezierPath()
        star2Path.move(to: CGPoint(x: 0, y: -4.75))
        star2Path.addLine(to: CGPoint(x: 1.68, y: -2.31))
        star2Path.addLine(to: CGPoint(x: 4.52, y: -1.47))
        star2Path.addLine(to: CGPoint(x: 2.71, y: 0.88))
        star2Path.addLine(to: CGPoint(x: 2.79, y: 3.84))
        star2Path.addLine(to: CGPoint(x: 0, y: 2.85))
        star2Path.addLine(to: CGPoint(x: -2.79, y: 3.84))
        star2Path.addLine(to: CGPoint(x: -2.71, y: 0.88))
        star2Path.addLine(to: CGPoint(x: -4.52, y: -1.47))
        star2Path.addLine(to: CGPoint(x: -1.68, y: -2.31))
        star2Path.close()
        color1.setFill()
        star2Path.fill()

        context.restoreGState()

        context.restoreGState()
        
        //// Rectangle Drawing
        context.saveGState()
        context.translateBy(x: x_trans, y: y_trans)

        context.saveGState()
        context.rotate(by: -30*CGFloat.pi/180)
        context.setAlpha(varOpac)
        
        let rectanglePath = UIBezierPath(rect: CGRect(x: -100, y: -25, width: rec_w, height: 25))
        color1.setFill()
        rectanglePath.fill()
        context.restoreGState()

        context.restoreGState()
        
        context.saveGState()
        context.translateBy(x: text_transX , y: text_transY)
        context.scaleBy(x: 1, y: 1)
        context.rotate(by: -30*CGFloat.pi/180)
        context.saveGState()
        context.setAlpha(varOpac)

        let textRect = CGRect(x: -100, y: -38, width: 90, height: 40)
        let textTextContent = "LIKE"
        let textStyle = NSMutableParagraphStyle()
        textStyle.alignment = .right
        let textFontAttributes = [
            .font: UIFont(name: "ArialRoundedMTBold", size: 15)!,
            .foregroundColor: UIColor.white,
            .paragraphStyle: textStyle,
        ] as [NSAttributedString.Key: Any]

        let textTextHeight: CGFloat = textTextContent.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: textRect)
        textTextContent.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
        context.restoreGState()

        context.restoreGState()
        context.restoreGState()
        
        
        
        ///DeliAniMation
        context.saveGState()
        context.translateBy(x: (deli_starX), y: (deli_starY))
        context.rotate(by: -deli_starAngle * CGFloat.pi/180)

        context.saveGState()
        context.setAlpha(deli_triAlpha)

        let deli_starPath = UIBezierPath()
        deli_starPath.move(to: CGPoint(x: 0, y: -4.75))
        deli_starPath.addLine(to: CGPoint(x: 1.68, y: -2.31))
        deli_starPath.addLine(to: CGPoint(x: 4.52, y: -1.47))
        deli_starPath.addLine(to: CGPoint(x: 2.71, y: 0.88))
        deli_starPath.addLine(to: CGPoint(x: 2.79, y: 3.84))
        deli_starPath.addLine(to: CGPoint(x: 0, y: 2.85))
        deli_starPath.addLine(to: CGPoint(x: -2.79, y: 3.84))
        deli_starPath.addLine(to: CGPoint(x: -2.71, y: 0.88))
        deli_starPath.addLine(to: CGPoint(x: -4.52, y: -1.47))
        deli_starPath.addLine(to: CGPoint(x: -1.68, y: -2.31))
        deli_starPath.close()
        color2.setFill()
        deli_starPath.fill()

        context.restoreGState()

        context.restoreGState()
        //star2
        context.saveGState()
        context.translateBy(x: (deli_star2X), y: (deli_star2Y))
        context.rotate(by: -deli_starAngle * CGFloat.pi/180)

        context.saveGState()
        context.setAlpha(deli_triAlpha)

        let deli_star2Path = UIBezierPath()
        deli_star2Path.move(to: CGPoint(x: 0, y: -4.75))
        deli_star2Path.addLine(to: CGPoint(x: 1.68, y: -2.31))
        deli_star2Path.addLine(to: CGPoint(x: 4.52, y: -1.47))
        deli_star2Path.addLine(to: CGPoint(x: 2.71, y: 0.88))
        deli_star2Path.addLine(to: CGPoint(x: 2.79, y: 3.84))
        deli_star2Path.addLine(to: CGPoint(x: 0, y: 2.85))
        deli_star2Path.addLine(to: CGPoint(x: -2.79, y: 3.84))
        deli_star2Path.addLine(to: CGPoint(x: -2.71, y: 0.88))
        deli_star2Path.addLine(to: CGPoint(x: -4.52, y: -1.47))
        deli_star2Path.addLine(to: CGPoint(x: -1.68, y: -2.31))
        deli_star2Path.close()
        color2.setFill()
        deli_star2Path.fill()

        context.restoreGState()

        context.restoreGState()
        
        //// Rectangle Drawing
        context.saveGState()
        context.translateBy(x: deli_x_trans, y: deli_y_trans)

        context.saveGState()
        context.rotate(by: -30*CGFloat.pi/180)
        context.setAlpha(deli_varOpac)
        
        let deli_rectanglePath = UIBezierPath(rect: CGRect(x: -100, y: -25, width: deli_rec_w, height: 25))
        color2.setFill()
        deli_rectanglePath.fill()
        context.restoreGState()

        context.restoreGState()
        
        context.saveGState()
        context.translateBy(x: deli_text_transX , y: deli_text_transY)
        context.scaleBy(x: 1, y: 1)
        context.rotate(by: -30*CGFloat.pi/180)
        context.saveGState()
        context.setAlpha(deli_varOpac)

        let deli_textRect = CGRect(x: -100, y: -38, width: 90, height: 40)
        let deli_textTextContent = "DELI"
        let deli_textStyle = NSMutableParagraphStyle()
        deli_textStyle.alignment = .right
        let deli_textFontAttributes = [
            .font: UIFont(name: "ArialRoundedMTBold", size: 15)!,
            .foregroundColor: UIColor.white,
            .paragraphStyle: deli_textStyle,
        ] as [NSAttributedString.Key: Any]

        let deli_textTextHeight: CGFloat = deli_textTextContent.boundingRect(with: CGSize(width: deli_textRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: deli_textFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: deli_textRect)
        deli_textTextContent.draw(in: CGRect(x: deli_textRect.minX, y: deli_textRect.minY + (deli_textRect.height - deli_textTextHeight) / 2, width: deli_textRect.width, height: deli_textTextHeight), withAttributes: deli_textFontAttributes)
        context.restoreGState()

        context.restoreGState()
        context.restoreGState()
        
        ///Pass Animation
        context.saveGState()
        context.translateBy(x: (pass_starX), y: (pass_starY))
        context.rotate(by: -pass_starAngle * CGFloat.pi/180)

        context.saveGState()
        context.setAlpha(pass_triAlpha)

        let pass_starPath = UIBezierPath()
        pass_starPath.move(to: CGPoint(x: 0, y: -4.75))
        pass_starPath.addLine(to: CGPoint(x: 1.68, y: -2.31))
        pass_starPath.addLine(to: CGPoint(x: 4.52, y: -1.47))
        pass_starPath.addLine(to: CGPoint(x: 2.71, y: 0.88))
        pass_starPath.addLine(to: CGPoint(x: 2.79, y: 3.84))
        pass_starPath.addLine(to: CGPoint(x: 0, y: 2.85))
        pass_starPath.addLine(to: CGPoint(x: -2.79, y: 3.84))
        pass_starPath.addLine(to: CGPoint(x: -2.71, y: 0.88))
        pass_starPath.addLine(to: CGPoint(x: -4.52, y: -1.47))
        pass_starPath.addLine(to: CGPoint(x: -1.68, y: -2.31))
        pass_starPath.close()
        color3.setFill()
        pass_starPath.fill()

        context.restoreGState()

        context.restoreGState()
        //star2
        context.saveGState()
        context.translateBy(x: (pass_star2X), y: (pass_star2Y))
        context.rotate(by: -pass_starAngle * CGFloat.pi/180)

        context.saveGState()
        context.setAlpha(pass_triAlpha)

        let pass_star2Path = UIBezierPath()
        pass_star2Path.move(to: CGPoint(x: 0, y: -4.75))
        pass_star2Path.addLine(to: CGPoint(x: 1.68, y: -2.31))
        pass_star2Path.addLine(to: CGPoint(x: 4.52, y: -1.47))
        pass_star2Path.addLine(to: CGPoint(x: 2.71, y: 0.88))
        pass_star2Path.addLine(to: CGPoint(x: 2.79, y: 3.84))
        pass_star2Path.addLine(to: CGPoint(x: 0, y: 2.85))
        pass_star2Path.addLine(to: CGPoint(x: -2.79, y: 3.84))
        pass_star2Path.addLine(to: CGPoint(x: -2.71, y: 0.88))
        pass_star2Path.addLine(to: CGPoint(x: -4.52, y: -1.47))
        pass_star2Path.addLine(to: CGPoint(x: -1.68, y: -2.31))
        pass_star2Path.close()
        color3.setFill()
        pass_star2Path.fill()

        context.restoreGState()

        context.restoreGState()
        
        //// Rectangle Drawing
        context.saveGState()
        context.translateBy(x: pass_x_trans, y: pass_y_trans)

        context.saveGState()
        context.rotate(by: -30*CGFloat.pi/180)
        context.setAlpha(pass_varOpac)
        
        let pass_rectanglePath = UIBezierPath(rect: CGRect(x: -100, y: -25, width:  pass_rec_w, height: 25))
        color3.setFill()
        pass_rectanglePath.fill()
        context.restoreGState()

        context.restoreGState()
        
        context.saveGState()
        context.translateBy(x: pass_text_transX , y: pass_text_transY)
        context.scaleBy(x: 1, y: 1)
        context.rotate(by: -30*CGFloat.pi/180)
        context.saveGState()
        context.setAlpha(pass_varOpac)

        let pass_textRect = CGRect(x: -100, y: -38, width: 90, height: 40)
        let pass_textTextContent = "PASS"
        let pass_textStyle = NSMutableParagraphStyle()
        pass_textStyle.alignment = .right
        let pass_textFontAttributes = [
            .font: UIFont(name: "ArialRoundedMTBold", size: 15)!,
            .foregroundColor: UIColor.white,
            .paragraphStyle: pass_textStyle,
        ] as [NSAttributedString.Key: Any]

        let pass_textTextHeight: CGFloat = pass_textTextContent.boundingRect(with: CGSize(width: pass_textRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: pass_textFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: pass_textRect)
        pass_textTextContent.draw(in: CGRect(x: pass_textRect.minX, y: pass_textRect.minY + (pass_textRect.height - pass_textTextHeight) / 2, width: pass_textRect.width, height: pass_textTextHeight), withAttributes: pass_textFontAttributes)
        context.restoreGState()

        context.restoreGState()
        context.restoreGState()
        
        /// MatchAnimation
        context.saveGState()
        
        context.translateBy(x: (match_starX), y: (match_starY))
        context.rotate(by: -match_starAngle * CGFloat.pi/180)

        context.saveGState()
        context.setAlpha(match_triAlpha)

        let match_starPath = UIBezierPath()
        match_starPath.move(to: CGPoint(x: 0, y: -4.75))
        match_starPath.addLine(to: CGPoint(x: 1.68, y: -2.31))
        match_starPath.addLine(to: CGPoint(x: 4.52, y: -1.47))
        match_starPath.addLine(to: CGPoint(x: 2.71, y: 0.88))
        match_starPath.addLine(to: CGPoint(x: 2.79, y: 3.84))
        match_starPath.addLine(to: CGPoint(x: 0, y: 2.85))
        match_starPath.addLine(to: CGPoint(x: -2.79, y: 3.84))
        match_starPath.addLine(to: CGPoint(x: -2.71, y: 0.88))
        match_starPath.addLine(to: CGPoint(x: -4.52, y: -1.47))
        match_starPath.addLine(to: CGPoint(x: -1.68, y: -2.31))
        match_starPath.close()
        color1.setFill()
        match_starPath.fill()

        context.restoreGState()

        context.restoreGState()
        //star2
        context.saveGState()
        context.translateBy(x: (match_star2X), y: (match_star2Y))
        context.rotate(by: -match_starAngle * CGFloat.pi/180)

        context.saveGState()
        context.setAlpha(match_triAlpha)

        let match_star2Path = UIBezierPath()
        match_star2Path.move(to: CGPoint(x: 0, y: -4.75))
        match_star2Path.addLine(to: CGPoint(x: 1.68, y: -2.31))
        match_star2Path.addLine(to: CGPoint(x: 4.52, y: -1.47))
        match_star2Path.addLine(to: CGPoint(x: 2.71, y: 0.88))
        match_star2Path.addLine(to: CGPoint(x: 2.79, y: 3.84))
        match_star2Path.addLine(to: CGPoint(x: 0, y: 2.85))
        match_star2Path.addLine(to: CGPoint(x: -2.79, y: 3.84))
        match_star2Path.addLine(to: CGPoint(x: -2.71, y: 0.88))
        match_star2Path.addLine(to: CGPoint(x: -4.52, y: -1.47))
        match_star2Path.addLine(to: CGPoint(x: -1.68, y: -2.31))
        match_star2Path.close()
        color1.setFill()
        match_star2Path.fill()

        context.restoreGState()

        context.restoreGState()
        
        //// Rectangle Drawing
        context.saveGState()
        context.translateBy(x: match_x_trans, y: match_y_trans)

        context.saveGState()
        context.rotate(by: -30*CGFloat.pi/180)
        context.setAlpha(match_varOpac)
        
        let match_rectanglePath = UIBezierPath(rect: CGRect(x: -100, y: -25, width: match_rec_w, height: 25))
        color1.setFill()
        match_rectanglePath.fill()
        context.restoreGState()

        context.restoreGState()
        
        context.saveGState()
        context.translateBy(x: match_text_transX , y: match_text_transY)
        context.scaleBy(x: 1, y: 1)
        context.rotate(by: -30*CGFloat.pi/180)
        context.saveGState()
        context.setAlpha(match_varOpac)

        let match_textRect = CGRect(x: -100, y: -38, width: 90, height: 40)
        let match_textTextContent = "MATCH"
        let match_textStyle = NSMutableParagraphStyle()
        match_textStyle.alignment = .right
        let match_textFontAttributes = [
            .font: UIFont(name: "ArialRoundedMTBold", size: 12)!,
            .foregroundColor: UIColor.white,
            .paragraphStyle: match_textStyle,
        ] as [NSAttributedString.Key: Any]

        let match_textTextHeight: CGFloat = match_textTextContent.boundingRect(with: CGSize(width: match_textRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: match_textFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: match_textRect)
        match_textTextContent.draw(in: CGRect(x: match_textRect.minX, y: match_textRect.minY + (match_textRect.height - match_textTextHeight) / 2, width: match_textRect.width, height: match_textTextHeight), withAttributes: match_textFontAttributes)
        context.restoreGState()

        context.restoreGState()
        context.restoreGState()
        
        
        ///report Animation
        context.saveGState()
        
        context.translateBy(x: (report_starX), y: (report_starY))
        context.rotate(by: -report_starAngle * CGFloat.pi/180)

        context.saveGState()
        context.setAlpha(report_triAlpha)

        let report_starPath = UIBezierPath()
        report_starPath.move(to: CGPoint(x: 0, y: -4.75))
        report_starPath.addLine(to: CGPoint(x: 1.68, y: -2.31))
        report_starPath.addLine(to: CGPoint(x: 4.52, y: -1.47))
        report_starPath.addLine(to: CGPoint(x: 2.71, y: 0.88))
        report_starPath.addLine(to: CGPoint(x: 2.79, y: 3.84))
        report_starPath.addLine(to: CGPoint(x: 0, y: 2.85))
        report_starPath.addLine(to: CGPoint(x: -2.79, y: 3.84))
        report_starPath.addLine(to: CGPoint(x: -2.71, y: 0.88))
        report_starPath.addLine(to: CGPoint(x: -4.52, y: -1.47))
        report_starPath.addLine(to: CGPoint(x: -1.68, y: -2.31))
        report_starPath.close()
        color1.setFill()
        report_starPath.fill()

        context.restoreGState()

        context.restoreGState()
        //star2
        context.saveGState()
        context.translateBy(x: (report_star2X), y: (report_star2Y))
        context.rotate(by: -report_starAngle * CGFloat.pi/180)

        context.saveGState()
        context.setAlpha(report_triAlpha)

        let report_star2Path = UIBezierPath()
        report_star2Path.move(to: CGPoint(x: 0, y: -4.75))
        report_star2Path.addLine(to: CGPoint(x: 1.68, y: -2.31))
        report_star2Path.addLine(to: CGPoint(x: 4.52, y: -1.47))
        report_star2Path.addLine(to: CGPoint(x: 2.71, y: 0.88))
        report_star2Path.addLine(to: CGPoint(x: 2.79, y: 3.84))
        report_star2Path.addLine(to: CGPoint(x: 0, y: 2.85))
        report_star2Path.addLine(to: CGPoint(x: -2.79, y: 3.84))
        report_star2Path.addLine(to: CGPoint(x: -2.71, y: 0.88))
        report_star2Path.addLine(to: CGPoint(x: -4.52, y: -1.47))
        report_star2Path.addLine(to: CGPoint(x: -1.68, y: -2.31))
        report_star2Path.close()
        color1.setFill()
        report_star2Path.fill()

        context.restoreGState()

        context.restoreGState()
        
        //// Rectangle Drawing
        context.saveGState()
        context.translateBy(x: report_x_trans, y: report_y_trans)

        context.saveGState()
        context.rotate(by: -30*CGFloat.pi/180)
        context.setAlpha(report_varOpac)
        
        let report_rectanglePath = UIBezierPath(rect: CGRect(x: -100, y: -25, width: report_rec_w, height: 25))
        color1.setFill()
        report_rectanglePath.fill()
        context.restoreGState()

        context.restoreGState()
        
        context.saveGState()
        context.translateBy(x: report_text_transX , y: report_text_transY)
        context.scaleBy(x: 1, y: 1)
        context.rotate(by: -30*CGFloat.pi/180)
        context.saveGState()
        context.setAlpha(report_varOpac)

        let report_textRect = CGRect(x: -100, y: -38, width: 90, height: 40)
        let report_textTextContent = "REPORT"
        let report_textStyle = NSMutableParagraphStyle()
        report_textStyle.alignment = .right
        let report_textFontAttributes = [
            .font: UIFont(name: "ArialRoundedMTBold", size: 12)!,
            .foregroundColor: UIColor.white,
            .paragraphStyle: report_textStyle,
        ] as [NSAttributedString.Key: Any]

        let report_textTextHeight: CGFloat = report_textTextContent.boundingRect(with: CGSize(width: report_textRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: report_textFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: report_textRect)
        report_textTextContent.draw(in: CGRect(x: report_textRect.minX, y: report_textRect.minY + (report_textRect.height - report_textTextHeight) / 2, width: report_textRect.width, height: report_textTextHeight), withAttributes: report_textFontAttributes)
        context.restoreGState()

        context.restoreGState()
        context.restoreGState()
        
        
        
    }
    
    
    
    @objc(AniTestCode4ResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}


