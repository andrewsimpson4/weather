//
//  Sun.swift
//  weather
//
//  Created by Andrew Simpson on 6/8/19.
//  Copyright © 2019 Andrew Simpson. All rights reserved.
//


import UIKit
import Lottie
class Sun: UIView {
    let sun = LOTAnimationView(name: "sunny.json")
    init(y: CGFloat, width: CGFloat, skyPercent: Double) {
        super.init(frame: CGRect(x: 0, y: y, width: width, height: 300))
        self.addSubview(sun)
        sun.loopAnimation = true
        sun.frame.size = CGSize(width: 150, height: 150)
        // sun.frame.origin = CGPoint(x: Double(center.x - 75), y: sunpathFunc(x: Double(center.x)))
        setSunPosition(x: Double(width) * skyPercent)
        print(center)
        sun.play()
        print(sunpathFunc(x: 10))
        // sunpath()
    }
    func setSunPosition(x: Double) {
        print(sunpathFunc(x: x))
        sun.frame.origin = CGPoint(x: x - 75, y:  -sunpathFunc(x: x) - 75)
    }
    func sunpathFunc(x: Double) -> Double {
        let cx = Double(center.x)
        let cy = -70.0 //Double(center.y) - 300
        
        return (-0.01*pow(x - cx,2.0)) + cy
        
    }
    
    func sunpath() {
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.addSublayer(sun.layer)
        let path = UIBezierPath()
        path.move(to: CGPoint(x: -100, y: frame.size.height + 100))
        path.addCurve(to: CGPoint(x: frame.size.width + 100, y: frame.size.height + 100), controlPoint1: CGPoint(x: frame.size.width / 2, y: 0), controlPoint2: CGPoint(x: frame.size.width / 2, y: 0))
        // path.addArc(withCenter: self.center, radius: frame.size.width / 2, startAngle: .pi, endAngle: 0, clockwise: true)
//
//        let animation = CABasicAnimation(keyPath: "strokeEnd")
//        animation.fromValue = 0.0
//        animation.toValue = 1.0
//        animation.duration = 2.0
//        animation.isRemovedOnCompletion = false
//        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
//
//        self.layer.addSublayer(shapeLayer)
//        shapeLayer.add(animation, forKey: nil)
//
//        self.layer.addSublayer(shapeLayer)
        
//        let animation = CAKeyframeAnimation(keyPath: "position")
//        animation.path = path.cgPath
//        animation.rotationMode = CAAnimationRotationMode.rotateAuto
//        animation.speed = 0
//        animation.duration = 1
//        animation.calculationMode = CAAnimationCalculationMode.paced
//        sun.layer.add(animation, forKey: "animate position along path")
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = path.cgPath
        // I set this one to make the animation go smoothly along the path
        animation.calculationMode = CAAnimationCalculationMode.paced
        animation.duration = 5
        animation.rotationMode = CAAnimationRotationMode.rotateAuto
        sun.layer.add(animation, forKey: nil)
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


}
