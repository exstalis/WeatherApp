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
    
}
