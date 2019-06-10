//
//  WeatherDataClass.swift
//  weather
//
//  Created by Andrew Simpson on 6/8/19.
//  Copyright © 2019 Andrew Simpson. All rights reserved.
//

import Foundation
import ObjectMapper


class Weather: Mappable {
    var base: String?
    var name: String?
    var clouds: [String: Any]?
    var main: [String: Any]?
    var sys: [String: Any]?
    var weather: [String: Any]?
    var wind: [String: Any]?
    var rain: [String: Any]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        base    <- map["base"]
        name    <- map["name"]
        clouds    <- map["clouds"]
        main    <- map["main"]
        sys    <- map["sys"]
        weather    <- map["weather"]
        wind    <- map["wind"]
        rain    <- map["rain"]

        
    }
}
