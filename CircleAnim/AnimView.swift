//
//  AnimView.swift
//  CircleAnim
//
//  Created by Nguyen Manh Hung on 4/17/21.
//

import UIKit

class AnimView: UIView {
    
    private var maskLayer: CALayer?
    private let animKey = "animKey"
    
    private var circleRect: CGRect {
        return CGRect(x: frame.midX - 40, y: frame.midY - 40, width: 80, height: 80)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
        setupAnimation()
    }
    
    private func setupAnimation() {
        maskLayer?.removeAllAnimations()
        maskLayer?.removeFromSuperlayer()
        maskLayer = nil
        
        let layer = CAShapeLayer()
        layer.path = createPath(insets: 0, -15, -25)
        layer.fillRule = .evenOdd
        layer.fillColor = UIColor.black.cgColor
        layer.opacity = 0.85
        self.layer.addSublayer(layer)
        maskLayer = layer
    }
    
    private func createPath(insets: CGFloat ...) -> CGPath {
        let bgPath = UIBezierPath(rect: bounds)
        bgPath.usesEvenOddFillRule = true
        
        for inset in insets {
            let roundedRect = circleRect.inset(by: UIEdgeInsets(top: inset,
                                                                left: inset,
                                                                bottom: inset,
                                                                right: inset))
            let cornerRadii = CGSize(width: roundedRect.width / 2,
                                     height: roundedRect.height / 2)
            let path = UIBezierPath(roundedRect: roundedRect,
                                    byRoundingCorners: .allCorners,
                                    cornerRadii: cornerRadii)
            bgPath.append(path)
        }
        
        return bgPath.cgPath
    }
    
    func startAnimation() {
        let animation = CAKeyframeAnimation(keyPath: "path")
        animation.duration = 1.5
        animation.values = [
            createPath(insets: 0, -15, -25),
            createPath(insets: -20, -80, -80),
            createPath(insets: 0, -80, -80)
        ]
        animation.keyTimes = [0, 0.5, 1]
        animation.repeatCount = .infinity
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        self.maskLayer?.add(animation, forKey: animKey)
    }
    
    func stopAnimation() {
        maskLayer?.removeAllAnimations()
    }
}
