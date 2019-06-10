//
//  WeatherDataView.swift
//  WeatherTest
//
//  Created by Andrew Simpson on 6/9/19.
//  Copyright © 2019 Andrew Simpson. All rights reserved.
//

import UIKit

class WeatherDataView: UIView {
    
    var tempLabel: UILabel?
    var nameLabel: UILabel?
    
    init(frame: CGRect, displayData: WeatherDisplayData) {
        super.init(frame: frame)
        
        self.nameLabel = UILabel()
        self.nameLabel?.font = UIFont(name: "AvenirNextCondensed-Bold", size: 25)
        self.nameLabel?.textAlignment = .left
        self.nameLabel?.frame.origin = CGPoint(x: 30, y: frame.size.height - 60)
        self.nameLabel?.textColor = UIColor.darkGray
        self.nameLabel?.frame.size = CGSize(width: frame.size.width, height: 30)
        self.nameLabel?.text = displayData.name
        self.addSubview(self.nameLabel!)
        

        self.tempLabel = UILabel()
        self.tempLabel?.font = UIFont(name: "AvenirNextCondensed-Bold", size: 90)
        self.tempLabel?.textAlignment = .left
        self.tempLabel?.frame.origin = CGPoint(x: 30, y: 100)
        self.tempLabel?.textColor = UIColor.white
        self.tempLabel?.frame.size = CGSize(width: 200, height: 200)
        self.tempLabel?.text = String(format: "%.1f", displayData.temp)
        self.addSubview(self.tempLabel!)
        
        let hi = normalItem(loc: CGPoint(x: 30, y: 250), text: "Hi: " + String(format: "%.1f", displayData.highTemp))
        self.addSubview(hi)
        
        let low = normalItem(loc: CGPoint(x: 130, y: 250), text: "Lo: " + String(format: "%.1f", displayData.lowTemp))
        self.addSubview(low)
        
        let wind = normalItem(loc: CGPoint(x: 220, y: 200), text: "Wind: " + String(format: "%.1f", displayData.windSpeed))
        self.addSubview(wind)
        
        let humidity = normalItem(loc: CGPoint(x: 220, y: 250), text: "Humidity: " + String(format: "%.1f", displayData.humidity))
        self.addSubview(humidity)

    }
    
    func normalItem(loc: CGPoint, text: String) -> UILabel {
        let new = UILabel()
        new.font = UIFont(name: "AvenirNextCondensed-Bold", size: 20)
        new.textAlignment = .left
        new.frame.origin = loc
        new.textColor = UIColor.white
        new.frame.size = CGSize(width: 200, height: 30)
        new.text = text
        self.addSubview(new)
        return new
    }
    
    func loadTempLabels() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
