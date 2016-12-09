//
//  Location.swift
//  WeatherApp
//
//  Created by elif ece arslan on 12/9/16.
//  Copyright © 2016 KolektifLabs. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    var latitude: Double!
    var longitude: Double!
    static var sharedInstance = Location()
    private init(){}
}
