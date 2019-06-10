//
//  presentorMain.swift
//  WeatherTest
//
//  Created by Andrew Simpson on 6/8/19.
//  Copyright © 2019 Andrew Simpson. All rights reserved.
//

import Foundation


class WeatherPresentor {
    var interactor: WeatherInteractor = WeatherInteractor()
    var weather: Weather?
    var viewCon: ViewController?
    var router = Router()
    init() {
        router.presenter = self
    }
    func fetchCurrentWeather(lat: Double, lon: Double, done_: @escaping () -> Void) {
        interactor.fetchCurrentWeather(lat: lat, lon: lon, done: {response in
            self.weather = response
            done_()
        })
    }
    
    func fetchWeatherData() -> WeatherData {
        return interactor.getWeatherData()
    }
    
    func locationView() {
        router.goToLocation()
    }
    
    
    
    
}
