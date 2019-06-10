//
//  Cloud.swift
//  WeatherTest
//
//  Created by Andrew Simpson on 6/8/19.
//  Copyright © 2019 Andrew Simpson. All rights reserved.
//

import UIKit

class Cloud: UIView {
    let cloudImage = UIImageView(image: UIImage(named: "cloud.png"))
    var groundHeight: CGFloat?
    var rain: Double?
    init(width: CGFloat, groundHeight: CGFloat, rainAmount: Double, cloudColor: Double, id: Int) {
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: 100))
        self.groundHeight = groundHeight
        self.rain = rainAmount
        let y = 0 + Double.random(in: 0..<200)
        if (id <= 5) {
            cloudImage.frame = CGRect(x: -190, y: y, width: 180, height: 100)
        } else {
            cloudImage.frame = CGRect(x: Double.random(in: -600 ..< -190), y: y, width: 180, height: 100)
        }
        cloudImage.image = cloudImage.image?.withRenderingMode(.alwaysTemplate)
        cloudImage.tintColor = UIColor(white: CGFloat((cloudColor/255) + Double.random(in: -0.02..<0.02)), alpha: 1)
        addSubview(cloudImage)
        
    }
    
    func run() {
        UIView.animate(withDuration: 2.0, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.cloudImage.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        }, completion: nil)
        
        UIView.animate(withDuration: 40, delay: 0, options: [], animations: {
            self.cloudImage.frame.origin = CGPoint(x: self.frame.size.width + 190, y: self.cloudImage.frame.origin.y)
        }, completion: nil)
        // cloudpath()
        if (rain != 20) {
            Timer.scheduledTimer(withTimeInterval: Double.random(in: 0.05..<rain! * 1.5), repeats: true, block: {timer in
                self.makeItRain()
            })
        }
    }
    
    func makeItRain() {
        let rainImage = UIImageView(image: UIImage(named: "raindrop.png"))
        rainImage.frame.origin = (cloudImage.layer.presentation()?.frame.origin)!
        rainImage.frame.origin.x = (cloudImage.layer.presentation()?.frame.origin.x)! + CGFloat(Double.random(in: 10..<150))
        rainImage.frame.origin.y = (cloudImage.layer.presentation()?.frame.origin.y)! + 50
        rainImage.frame.size = CGSize(width: 20, height: 25)
        self.insertSubview(rainImage, at: 0)
        UIView.animate(withDuration: 1, delay: 0, options: [.curveLinear], animations: {
            rainImage.frame.origin = CGPoint(x: rainImage.frame.origin.x, y: self.groundHeight! + CGFloat(Double.random(in: 0..<100)))
        }, completion: {res in
            rainImage.removeFromSuperview()
        })
       
    }
    
    func cloudpath() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: -100, y: 100))
        path.addLine(to: CGPoint(x: frame.size.width + 100, y: 100))
        
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            self.removeFromSuperview()
        })
        
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = path.cgPath
        animation.calculationMode = CAAnimationCalculationMode.paced
        animation.duration = 30
        cloudImage.layer.add(animation, forKey: nil)
        
        CATransaction.commit()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
