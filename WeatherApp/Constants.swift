//
//  Constants.swift
//  WeatherApp
//
//  Created by elif ece arslan on 12/8/16.
//  Copyright © 2016 KolektifLabs. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "6e26783eac39cadce0d801ea235a1121"

typealias DownloadComplete = () -> ()
let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"

		
