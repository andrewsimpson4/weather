//
//  MakeScene.swift
//  WeatherTest
//
//  Created by Andrew Simpson on 6/9/19.
//  Copyright © 2019 Andrew Simpson. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    func makeScene(lat_: Double, lon_: Double) {
        let h = groundView.frame.size.height
        let w = groundView.frame.size.width
        print(lat_)
        print(lon_)
        presentor?.fetchCurrentWeather(lat: lat_, lon: lon_, done_: {() in
            let weatherData = self.presentor?.fetchWeatherData()
            
            let sky = Sky(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - h + 200), percent: (weatherData?.sky.colorPosition)!)
            self.view.addSubview(sky)
            
            if (weatherData?.sun.initPosition != -1) {
                let sun = Sun(y: self.view.frame.size.height - h - 300, width: self.view.frame.size.width, skyPercent: (weatherData?.sun.initPosition)!)
                self.view.addSubview(sun)
            }else {
                let moon = Moon(y: self.view.frame.size.height - h - 300, width: self.view.frame.size.width, skyPercent: (weatherData?.moon.initPosition)!)
                self.view.addSubview(moon)
            }
            
            let ground = Ground(x: 0, y: self.view.frame.size.height - h, width: w, height: h, firstColor: (weatherData?.ground.colorOne)!, secondColor: (weatherData?.ground.colorTwo)!)
            self.view.addSubview(ground)
            
            if ((weatherData?.clouds.thickness)! != 20) {
                var cloudCount = 0
                let cloudFirst = Cloud(width: self.view.frame.width, groundHeight: h, rainAmount: (weatherData?.clouds.rainAmount)!, cloudColor: (weatherData?.clouds.color)!, id: cloudCount)
                self.view.addSubview(cloudFirst)
                cloudFirst.run()
                Timer.scheduledTimer(withTimeInterval: (weatherData?.clouds.thickness)!, repeats: true, block: {timer in
                    cloudCount += 1
                    let cloud = Cloud(width: self.view.frame.width, groundHeight: h, rainAmount: (weatherData?.clouds.rainAmount)!, cloudColor: (weatherData?.clouds.color)!, id: cloudCount)
                    self.view.addSubview(cloud)
                    cloud.run()
        
                })
            }
            let display = WeatherDataView(frame: self.groundView.frame, displayData: weatherData!.display)
            self.view.addSubview(display)
            
            let map = UIButton(frame: CGRect(x: self.view.frame.size.width - 70, y: self.view.frame.size.height - 70, width: 50, height: 50))
            map.setImage(UIImage(named: "map.png"), for: .normal)
            map.addTarget(self, action: #selector(self.mapPushed), for: .touchUpInside)
            self.view.addSubview(map)
        })
    }
    
    @objc func mapPushed() {
        presentor?.locationView()
    }
}



