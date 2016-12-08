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
        if _cityName == nil {
            _cityName = " "
        }
        return _cityName
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = " "
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            print("Current Tempreture is nil")
            _currentTemp = 0.0
            return _currentTemp
        }
        return _currentTemp
    }
    
    var date: String {
        if _date == nil {
            print("Date is nil")
            _date = " "
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
            //Unwrap JSON object dictionary
            if let dict = response.result.value as? Dictionary<String, AnyObject>{
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                }
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTempreture = main["temp"] as? Double {
                        //temp comes as Kelvin. Convert to celcius
                        let kelvinToCelcius = currentTempreture - 273.15
                        self._currentTemp = Double(round(10 * kelvinToCelcius/10))
                        print("Current Tempreture : \(self._currentTemp)")
                    }
                }
            }
            
        }
        completed()
    }
}
