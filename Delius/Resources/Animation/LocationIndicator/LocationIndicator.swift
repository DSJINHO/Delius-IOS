//
//  LocationIndicator.swift
//  ProjectName
//
//  Created by Yoonhwan on 2020/08/21.
//  Copyright © 2020 Delius. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//
//  This code was generated by Trial version of PaintCode, therefore cannot be used for commercial purposes.
//



import UIKit

public class LocationIndicator : NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawCanvas1(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 400, height: 400), resizing: ResizingBehavior = .aspectFit, scale1: CGFloat = 0.2, alpha1: CGFloat = 1) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 400, height: 400), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 400, y: resizedFrame.height / 400)


        //// Color Declarations
//        let startColor = UIColor(red: 0.800, green: 0.320, blue: 0.320, alpha: 1.000)
        let startColor = UIColor.MainColor()
//        let endColor = UIColor(red: 0.800, green: 0.322, blue: 0.322, alpha: 0.196)
        let endColor = UIColor.white

        //// Gradient Declarations
        let gradient = CGGradient(colorsSpace: nil, colors: [endColor.cgColor, startColor.cgColor] as CFArray, locations: [0, 1])!

        //// Circle1 Drawing
        context.saveGState()
        context.translateBy(x: 200, y: 200)
        context.scaleBy(x: scale1, y: scale1)

        context.saveGState()
        context.setAlpha(alpha1)

        let circle1Path = UIBezierPath(ovalIn: CGRect(x: -100, y: -100, width: 200, height: 200))
        context.saveGState()
        circle1Path.addClip()
        context.drawRadialGradient(gradient,
            startCenter: CGPoint(x: 0, y: 0), startRadius: 40,
            endCenter: CGPoint(x: 0, y: 0), endRadius: 119.83,
            options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
        context.restoreGState()

        context.restoreGState()

        context.restoreGState()
        
        context.restoreGState()

    }




    @objc(LocationIndicatorResizingBehavior)
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

