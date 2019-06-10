//
//  Ground.swift
//  WeatherTest
//
//  Created by Andrew Simpson on 6/8/19.
//  Copyright © 2019 Andrew Simpson. All rights reserved.
//

import UIKit

class Ground: UIView {
    let firstPath = UIBezierPath()
    var firstHill: UIView!
    let secondPath = UIBezierPath()
    var secondHill: UIView!
    init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, firstColor: UIColor, secondColor: UIColor) {
        super.init(frame: CGRect(x: x, y: y, width: width, height: height))
        firstHill = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        firstHill.backgroundColor = UIColor(red: 66 / 255, green: 247 / 255, blue: 102 / 255, alpha: 1)
        addSubview(firstHill)
        
        secondHill = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        secondHill.backgroundColor = UIColor(red: 48 / 255, green: 186 / 255, blue: 75 / 255, alpha: 1)
        addSubview(secondHill)
        makeGround()
    }
    func makeGround() {
        let size = frame.size
        firstPath.move(to: CGPoint(x: 0.0, y: 80))
        firstPath.addCurve(to: CGPoint(x: size.width, y: 20), controlPoint1: CGPoint(x: size.width / 2.5, y: -20), controlPoint2: CGPoint(x: size.width / 1.5, y: 100.0))
        firstPath.addLine(to: CGPoint(x: size.width, y: size.height))
        firstPath.addLine(to: CGPoint(x: 0, y: size.height))
        firstPath.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = firstPath.cgPath
        firstHill.layer.mask = shapeLayer
        
        secondPath.move(to: CGPoint(x: 0.0, y: 80))
        secondPath.addCurve(to: CGPoint(x: size.width, y: 50), controlPoint1: CGPoint(x: size.width / 2.5, y: 140), controlPoint2: CGPoint(x: size.width / 2, y: -50))
        secondPath.addLine(to: CGPoint(x: size.width, y: size.height))
        secondPath.addLine(to: CGPoint(x: 0, y: size.height))
        secondPath.close()
        
        let shapeLayerSecond = CAShapeLayer()
        shapeLayerSecond.path = secondPath.cgPath
        secondHill.layer.mask = shapeLayerSecond
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
