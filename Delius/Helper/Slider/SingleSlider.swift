//
//  SingleSlider.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 19/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
import QuartzCore

class SingleSliderTrackLayer: CALayer {
    weak var SingleSlider: SingleSlider?
    
    override func draw(in ctx: CGContext) {
        guard let slider = SingleSlider else {
            return
        }
        
        // Clip
        let cornerRadius = bounds.height * slider.curvaceousness / 2.0
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        ctx.addPath(path.cgPath)
        
        // Fill the track
        ctx.setFillColor(slider.trackTintColor.cgColor)
        ctx.addPath(path.cgPath)
        ctx.fillPath()
        
        // Fill the highlighted range
        ctx.setFillColor(slider.trackHighlightTintColor.cgColor)
        let upperValuePosition = CGFloat(slider.positionForValue(slider.upperValue))
        let rect = CGRect(x: 0, y: 0.0, width: upperValuePosition, height: bounds.height)
        ctx.fill(rect)
    }
}

class SingleSliderThumbLayer: CALayer {
    
    var highlighted: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    weak var SingleSlider: SingleSlider?
    
    var strokeColor: UIColor = UIColor.white {
        didSet {
            setNeedsDisplay()
        }
    }
    var lineWidth: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(in ctx: CGContext) {
        guard let slider = SingleSlider else {
            return
        }
        
        let thumbFrame = bounds.insetBy(dx: 0, dy: 0)
        //let cornerRadius = thumbFrame.height * slider.curvaceousness / 2.0
        let cornerRadius = 15 as CGFloat
        let thumbPath = UIBezierPath(roundedRect: thumbFrame, cornerRadius: cornerRadius)
        
        // Fill
        ctx.setFillColor(slider.thumbTintColor.cgColor)
        ctx.addPath(thumbPath.cgPath)
        ctx.fillPath()
        
        // Outline
        ctx.setStrokeColor(strokeColor.cgColor)
        ctx.setLineWidth(lineWidth)
        ctx.addPath(thumbPath.cgPath)
        ctx.strokePath()
        
        if highlighted {
            ctx.setFillColor(UIColor(white: 0.0, alpha: 0.1).cgColor)
            ctx.addPath(thumbPath.cgPath)
            ctx.fillPath()
        }
    }
}

@IBDesignable
public class SingleSlider: UIControl {
    
    @IBInspectable public var maximumValue: Double = 1.0 {
        willSet(newValue) {
            assert(newValue > 0, "SingleSlider: maximumValue should be greater than minimumValue")
        }
        didSet {
            updateLayerFrames()
        }
    }
    
    
    @IBInspectable public var upperValue: Double = 1 {
        didSet {
            if upperValue > maximumValue {
                upperValue = maximumValue
            }
            updateLayerFrames()
        }
    }
    
    var gapBetweenThumbs: Double {
        return 1 * Double(thumbWidth) * (maximumValue) / Double(bounds.width)
    }
    
    @IBInspectable public var trackTintColor: UIColor = UIColor(white: 0.9, alpha: 1.0) {
        didSet {
            trackLayer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var trackHighlightTintColor: UIColor = UIColor.MainColor() {
        didSet {
            trackLayer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var thumbTintColor: UIColor = UIColor.gradientColor()[2] {
        didSet {
            upperThumbLayer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var thumbBorderColor: UIColor = UIColor.gray {
        didSet {
            upperThumbLayer.strokeColor = thumbBorderColor
        }
    }
    
    @IBInspectable public var thumbBorderWidth: CGFloat = 0.5 {
        didSet {
            upperThumbLayer.lineWidth = thumbBorderWidth
        }
    }
    
    @IBInspectable public var curvaceousness: CGFloat = 1.0 {
        didSet {
            if curvaceousness < 0.0 {
                curvaceousness = 0.0
            }
            
            if curvaceousness > 1.0 {
                curvaceousness = 1.0
            }
            
            trackLayer.setNeedsDisplay()
            upperThumbLayer.setNeedsDisplay()
        }
    }
    
    fileprivate var previouslocation = CGPoint()
    
    fileprivate let trackLayer = SingleSliderTrackLayer()
    fileprivate let upperThumbLayer = SingleSliderThumbLayer()
    
    fileprivate var thumbWidth: CGFloat {
        return CGFloat(bounds.height)
    }
    
    override public var frame: CGRect {
        didSet {
            updateLayerFrames()
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initializeLayers()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeLayers()
    }
    
    override public func layoutSublayers(of: CALayer) {
        super.layoutSublayers(of:layer)
        updateLayerFrames()
    }
    
    fileprivate func initializeLayers() {
        layer.backgroundColor = UIColor.clear.cgColor
        
        trackLayer.SingleSlider = self
        trackLayer.contentsScale = UIScreen.main.scale
        layer.addSublayer(trackLayer)
        
        
        upperThumbLayer.SingleSlider = self
        upperThumbLayer.contentsScale = UIScreen.main.scale
        layer.addSublayer(upperThumbLayer)
    }
    
    func updateLayerFrames() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        trackLayer.frame = bounds.insetBy(dx: 0.0, dy: bounds.height/3)
        trackLayer.setNeedsDisplay()
        
        
        let upperThumbCenter = CGFloat(positionForValue(upperValue))
        upperThumbLayer.frame = CGRect(x: upperThumbCenter - thumbWidth/2.0, y: 0.0, width: thumbWidth, height: thumbWidth)
        upperThumbLayer.setNeedsDisplay()
        
        CATransaction.commit()
    }
    
    func positionForValue(_ value: Double) -> Double {
        return Double(bounds.width - thumbWidth) * (value) /
            (maximumValue) + Double(thumbWidth/2.0)
    }
    
    func boundValue(_ value: Double, toLowerValue lowerValue: Double, upperValue: Double) -> Double {
        return min(max(value, lowerValue), upperValue)
    }
    
    
    // MARK: - Touches
    
    override public func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        previouslocation = touch.location(in: self)
        
        
        if upperThumbLayer.frame.contains(previouslocation) {
            upperThumbLayer.highlighted = true
        }
        return upperThumbLayer.highlighted
    }
    
    override public func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        
        // Determine by how much the user has dragged
        let deltaLocation = Double(location.x - previouslocation.x)
        let deltaValue = (maximumValue) * deltaLocation / Double(bounds.width - bounds.height)
        
        previouslocation = location
        
        
        if upperThumbLayer.highlighted {
            upperValue = boundValue(upperValue + deltaValue, toLowerValue: 0 + gapBetweenThumbs, upperValue: maximumValue)
        }
        sendActions(for: .valueChanged)
        
        return true
    }
    
    override public func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        upperThumbLayer.highlighted = false
    }
}
