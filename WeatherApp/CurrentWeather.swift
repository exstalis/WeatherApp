//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by elif ece arslan on 12/8/16.
//  Copyright © 2016 KolektifLabs. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        guard let name = _cityName, !name.isEmpty else{
            print("City Name is nil or empty")
            return _cityName
        }
        return _cityName
    }
    var weatherType: String {
        guard let type = _weatherType, !type.isEmpty else {
            print("Weather type is nil or empty")
            return _weatherType
        }
        return _weatherType
    }
    var currentTemp: Double {
        guard (_currentTemp) != nil else {
            print("Current Tempreture is nil")
            _currentTemp = 0.0
            return _currentTemp
        }
        return _currentTemp
    }
    var date: String {
        guard let dateString = _date, !dateString.isEmpty else {
            print("date is nil or empty")
            return _date
        }
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        let currentDate = formatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    func downloadWeatherDetails(completed: DownloadComplete) {
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
        completed()
    }
}
