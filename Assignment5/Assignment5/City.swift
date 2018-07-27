//
//  City.swift
//  Assignment5
//
//  Created by 北田晴佳 on 2018/05/28.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import Foundation

class City {
    var temperature: Double
    var time: String
    
    enum weather: String {
        case sunny = "Sunny"
        case cloudy = "Cloudy"
        case rain = "Rain"
        case fog = "Fog"
    }
    
    init(_ temperature: Double, _ time: String) {
        self.temperature = temperature
        self.time = time
    }
}
