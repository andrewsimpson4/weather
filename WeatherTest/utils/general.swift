//
//  general.swift
//  WeatherTest
//
//  Created by Andrew Simpson on 6/8/19.
//  Copyright © 2019 Andrew Simpson. All rights reserved.
//

import Foundation


func currentWeatherPathFor(location: String) -> String {
    return WEATHER_CURRENT_PATH + location + "&APPID=" + API_KEY
}

func currentWeatherPathCordFor(lat: String, lon: String) -> String {
    return WEATHER_PATH_BY_CORD + lat + "&lon=" + lon + "&APPID=" + API_KEY
}


func kTof(k: Double) -> Double {
    return (k * (9/5)) - 459.67
}

func msToMph(ms: Double) -> Double {
    return ms * 2.237
}

func unixToTime(unix: Double) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(exactly: unix)!)
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(abbreviation: TimeZone.current.abbreviation() ?? "")
    dateFormatter.locale = NSLocale.current
    dateFormatter.dateFormat = "HH:mm"
    let str = dateFormatter.string(from: date)
    return str
}


func cloudThickness(p: Double) -> Double {
    var e = -1.97*pow(p, 0.5) + 20
    if (e < 0.3) { e = 0.3 }
    return e
}

func rainAmountFunc(p: Double) -> Double {
    var e = -13*pow(p, 0.5) + 20
    if (e < 0.1) { e = 0.1 }
    return e
}

func cloudColorFunc(p: Double) -> Double {
    var e = 0.0
    if (p > 50.8) {e = 76} else if (p < 1) {e = 234} else {
        e = (-52.6667 * p) + 286.667
    }
    return e
}

func skyColorP(sunrise: Double, sunset: Double) -> Double {
    let c = Double(NSDate().timeIntervalSince1970)
    if (c < sunset) {
        let ssHat = sunset - sunrise
        var n = (0.2 / ssHat) * (c - sunrise)
        if (n < 0) {n = 0}
        return n
    } else {
        return 1
    }
}
