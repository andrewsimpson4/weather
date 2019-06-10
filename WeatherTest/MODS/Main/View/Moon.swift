//
//  Moon.swift
//  WeatherTest
//
//  Created by Andrew Simpson on 6/8/19.
//  Copyright © 2019 Andrew Simpson. All rights reserved.
//

import UIKit
import Lottie

class Moon: UIView {

    let moon = LOTAnimationView(name: "moon.json")
    init(y: CGFloat, width: CGFloat, skyPercent: Double) {
        super.init(frame: CGRect(x: 0, y: y, width: width, height: 300))
        self.addSubview(moon)
        moon.loopAnimation = true
        moon.frame.size = CGSize(width: 150, height: 150)
        setMoonPosition(x: Double(width) * skyPercent)
        moon.play()
    }
    
    func setMoonPosition(x: Double) {
        print(moonpathFunc(x: x))
        moon.frame.origin = CGPoint(x: x - 75, y:  -moonpathFunc(x: x) - 75)
    }
    func moonpathFunc(x: Double) -> Double {
        let cx = Double(center.x)
        let cy = -70.0
        return (-0.01*pow(x - cx,2.0)) + cy
        
    }
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
