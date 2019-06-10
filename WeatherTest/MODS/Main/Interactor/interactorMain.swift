//
//  interactorMain.swift
//  WeatherTest
//
//  Created by Andrew Simpson on 6/8/19.
//  Copyright © 2019 Andrew Simpson. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class WeatherInteractor {
    var weather: Weather?
    func fetchCurrentWeather(lat: Double, lon: Double, done: @escaping (Weather) -> Void) {
        print("fetching data!!")
        let path = currentWeatherPathCordFor(lat: String(lat), lon: String(lon))
        print(path)
        
        Alamofire.request(path).responseJSON { response in
            if let json = response.result.value as AnyObject? {
                print(json)
                let weather = Mapper<Weather>().map(JSON: json as! [String : Any]);
                self.weather = weather
                print(self.getWeatherData())
                done(weather!)
            }
        }
    }
    
}

extension WeatherInteractor {
    
    func getWeatherData() -> WeatherData {
        let sunMoon = genSunAndMoonData()
        let sky = genSkyData()
        let clouds = genCloudsData()
        let display = genWeatherDisplayData()
        let ground = genGroundData()
        return WeatherData(sun: sunMoon.0, moon: sunMoon.1, clouds: clouds, ground: ground, sky: sky, display: display)
    }
    
    func genSunAndMoonData() -> (SunData, MoonData) {
        
        let sunData: SunData?
        let moonData: MoonData?
        
        let sunrise = weather?.sys!["sunrise"] as! Double
        let sunset = weather?.sys!["sunset"] as! Double
        
        let c = Double(NSDate().timeIntervalSince1970)
        
        if (c > sunset) {
            sunData = SunData(initPosition: -1)
            
            let newSunrise = sunrise + 86400
            let min = sunset
            let max = newSunrise - sunset
            let percentage = (c - min) / max
            
            print(newSunrise)
            print(sunset)
            print(max)
            
            moonData = MoonData(initPosition: percentage)
        } else {
            moonData = MoonData(initPosition: -1)
            
            let min = sunrise
            let max = sunset - sunrise
            let percentage = (c - min) / max
            
            sunData = SunData(initPosition: percentage)
            
        }
        
        return (sunData!, moonData!)
        
    }
    
    func genSkyData() -> SkyData {
        // [0, 0.5, 0.55,0.7,1]
        
        let sunrise = weather?.sys!["sunrise"] as! Double
        let sunset = weather?.sys!["sunset"] as! Double
        
        return SkyData(colorPosition: skyColorP(sunrise: sunrise, sunset: sunset))
    }
    
    func genCloudsData() -> CloudData {
        var cloudNumber: Double = 0
        var cloudColor: Double = 234
        var rainAmount: Double = 20
        
        if (weather?.clouds != nil) {
            cloudNumber = cloudThickness(p: weather?.clouds!["all"] as! Double)
        }
        
        if (weather?.rain != nil) {
            if (weather?.rain!["1h"] != nil) {
                rainAmount = rainAmountFunc(p: weather?.rain!["1h"] as! Double)
                cloudColor = cloudColorFunc(p: weather?.rain!["1h"] as! Double)
            }
//            }else if (weather?.rain!["3h"] != nil) {
//                rainAmount = rainAmountFunc(p: weather?.rain!["3h"] as! Double)
//                cloudColor = cloudColorFunc(p: weather?.rain!["3h"] as! Double)
//            }
        }
        let sunset = weather?.sys!["sunset"] as! Double
        let c = Double(NSDate().timeIntervalSince1970)
        if (sunset < c) {
            cloudColor = cloudColor + 0.05
        }
        
        return CloudData(thickness: cloudNumber, color: cloudColor, rainAmount: rainAmount)
    }
    
    func genWeatherDisplayData() -> WeatherDisplayData {
        let temp = kTof(k: weather?.main?["temp"] as! Double)
        let heighTemp = kTof(k: weather?.main?["temp_max"] as! Double)
        let lowTemp = kTof(k: weather?.main?["temp_min"] as! Double)
        let windSpeed = msToMph(ms: weather?.wind?["speed"] as! Double)
        let humidity = weather?.main?["humidity"] as! Double
        let sunrise = unixToTime(unix: weather?.sys?["sunrise"] as! Double)
        let sunset = unixToTime(unix: weather?.sys?["sunset"] as! Double)
        let name = weather?.name
        
        return WeatherDisplayData(temp: temp, highTemp: heighTemp, lowTemp: lowTemp, windSpeed: windSpeed, humidity: humidity, sunrise: sunrise, sunset: sunset, name: name ?? "")
    }
    
    func genGroundData() -> GroundData {
        let sunset = weather?.sys!["sunset"] as! Double
        let c = Double(NSDate().timeIntervalSince1970)
        // UIColor(red: 66 / 255, green: 247 / 255, blue: 102 / 255, alpha: 1)
        // UIColor(red: 48 / 255, green: 186 / 255, blue: 75 / 255, alpha: 1)
        if (sunset < c) {
            return GroundData(colorOne: UIColor(red: 57 / 255, green: 160 / 255, blue: 66 / 255, alpha: 1), colorTwo: UIColor(red: 42 / 255, green: 114 / 255, blue: 48 / 255, alpha: 1))
        } else {
            return GroundData(colorOne: UIColor(red: 66 / 255, green: 247 / 255, blue: 102 / 255, alpha: 1), colorTwo: UIColor(red: 48 / 255, green: 186 / 255, blue: 75 / 255, alpha: 1))
        }
    }
    
    
}
