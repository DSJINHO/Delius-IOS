//
//  SampleStyleKit1.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 14/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//
import UIKit

public class MainIndicatorStyleKit : NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawCanvas1(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 100, height: 100), resizing: ResizingBehavior = .aspectFit, point1: CGPoint = CGPoint(x: 50, y: 50), point2: CGPoint = CGPoint(x: 50, y: 50), point3: CGPoint = CGPoint(x: 50, y: 50), point4: CGPoint = CGPoint(x: 50, y: 50), point5: CGPoint = CGPoint(x: 50, y: 50), point6: CGPoint = CGPoint(x: 50, y: 50), size1: CGSize = CGSize(width: 15, height: 15), size2: CGSize = CGSize(width: 15, height: 15), size3: CGSize = CGSize(width: 15, height: 15), size4: CGSize = CGSize(width: 15, height: 15), size5: CGSize = CGSize(width: 15, height: 15), size6: CGSize = CGSize(width: 15, height: 15),color1: UIColor, color2: UIColor, color3: UIColor, color4: UIColor, color5: UIColor, color6: UIColor) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 100, height: 100), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 100, y: resizedFrame.height / 100)


        //// Color Declarations
        

        //// Oval6 Drawing
        context.saveGState()
        context.translateBy(x: point6.x, y: point6.y)

        let oval6Path = UIBezierPath(ovalIn: CGRect(x: -7.5, y: -7.5, width: size6.width, height: size6.height))
        color6.setFill()
        oval6Path.fill()

        context.restoreGState()


        //// Oval5 Drawing
        context.saveGState()
        context.translateBy(x: point5.x, y: point5.y)

        let oval5Path = UIBezierPath(ovalIn: CGRect(x: -7.5, y: -7.5, width: size5.width, height: size5.height))
        color5.setFill()
        oval5Path.fill()

        context.restoreGState()


        //// Oval4 Drawing
        context.saveGState()
        context.translateBy(x: point4.x, y: point4.y)

        let oval4Path = UIBezierPath(ovalIn: CGRect(x: -7.5, y: -7.5, width: size4.width, height: size4.height))
        color4.setFill()
        oval4Path.fill()

        context.restoreGState()


        //// Oval3 Drawing
        context.saveGState()
        context.translateBy(x: point3.x, y: point3.y)

        let oval3Path = UIBezierPath(ovalIn: CGRect(x: -7.5, y: -7.5, width: size3.width, height: size3.height))
        color3.setFill()
        oval3Path.fill()

        context.restoreGState()


        //// Oval2 Drawing
        context.saveGState()
        context.translateBy(x: point2.x, y: point2.y)

        let oval2Path = UIBezierPath(ovalIn: CGRect(x: -7.5, y: -7.5, width: size2.width, height: size2.height))
        color2.setFill()
        oval2Path.fill()

        context.restoreGState()


        //// Oval1 Drawing
        context.saveGState()
        context.translateBy(x: point1.x, y: point1.y)

        let oval1Path = UIBezierPath(ovalIn: CGRect(x: -7.5, y: -7.5, width: size1.width, height: size1.height))
        color1.setFill()
        oval1Path.fill()

        context.restoreGState()
        
        context.restoreGState()

    }




    @objc(IndexampleResizingBehavior)
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
