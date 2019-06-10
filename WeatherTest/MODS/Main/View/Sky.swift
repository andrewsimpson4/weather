//
//  Sky.swift
//  WeatherTest
//
//  Created by Andrew Simpson on 6/8/19.
//  Copyright © 2019 Andrew Simpson. All rights reserved.
//

import UIKit

class Sky: UIView {
    
    init(frame: CGRect, percent: Double) {
        super.init(frame: frame)
        self.frame.size.height = 2000
        
        let blueSkyOne = UIColor(red: 33/255, green: 203/255, blue: 255/255, alpha: 1)
        let blueSkyTwo = UIColor(red: 30/255, green: 176/255, blue: 255/255, alpha: 1)
        let orangeSky = UIColor(red: 249/255, green: 123/255, blue: 32/255, alpha: 1)
        let graySky = UIColor(red: 86/255, green: 86/255, blue: 86/255, alpha: 1)
        let darkSky = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [blueSkyOne.cgColor, blueSkyTwo.cgColor, orangeSky.cgColor, graySky.cgColor, darkSky.cgColor].reversed()
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 0.5, 0.55,0.7,1]
        
        gradientLayer.frame = bounds
        
        layer.insertSublayer(gradientLayer, at: 0)
        
//        UIView.animate(withDuration: 20.0, delay: 0, options: [.curveLinear], animations: {
//            self.frame.origin.y = -1500
//        }, completion: nil)
        if (percent != 1) {
            self.frame.origin.y = (-CGFloat(2000 * percent))
        } else {
            self.frame.origin.y = -1500
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
