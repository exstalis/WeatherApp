//
//  Forecast.swift
//  WeatherApp
//
//  Created by elif ece arslan on 12/8/16.
//  Copyright © 2016 KolektifLabs. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {

    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String {
        if _date == nil {
            _date = " "
        }
    return _date
    }
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = " "
        }
        return _weatherType
    }
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = " "
        }
        return _highTemp
    }
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = " "
        }
        return _lowTemp
    }
    init(weatherDict: Dictionary<String, AnyObject>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            if let min = temp["min"] as? Double {
                let kelvinToCelcius = min - 273.15
                self._lowTemp = "\(Double(round(10 * kelvinToCelcius/10)))"
                print("Current Tempreture : \(self._lowTemp)")
            }
            if let max = temp["max"] as? Double {
                let kelvinToCelcius = max - 273.15
                self._highTemp = "\(Double(round(10 * kelvinToCelcius/10)))"
                print("Current Tempreture : \(self._highTemp)")
            }
        }
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let formatter = DateFormatter()
            formatter.dateStyle = .full
            formatter.timeStyle = .none
            formatter.dateFormat = "EEEE"
            self._date = unixConvertedDate.dayOfTheWeek()
        }
    }
    
}

extension Date {
    
    func dayOfTheWeek() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: self)
    }
}
