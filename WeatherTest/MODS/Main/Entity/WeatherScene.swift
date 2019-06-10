//
//  WeatherScene.swift
//  WeatherTest
//
//  Created by Andrew Simpson on 6/8/19.
//  Copyright © 2019 Andrew Simpson. All rights reserved.
//

import Foundation
import UIKit

struct SunData {
    var initPosition: Double
}

struct MoonData {
    var initPosition: Double
}

struct CloudData {
    var thickness: Double
    var color: Double
    var rainAmount: Double
}

struct GroundData {
    var colorOne: UIColor
    var colorTwo: UIColor
}

struct SkyData {
    var colorPosition: Double
}

struct WeatherData {
    var sun: SunData
    var moon: MoonData
    var clouds: CloudData
    var ground: GroundData
    var sky: SkyData
    var display: WeatherDisplayData
}

struct WeatherDisplayData {
    var temp: Double
    var highTemp: Double
    var lowTemp: Double
    var windSpeed: Double
    var humidity: Double
    var sunrise: String
    var sunset: String
    var name: String
}

