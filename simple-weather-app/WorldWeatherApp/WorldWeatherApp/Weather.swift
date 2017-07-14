//
//  Weather.swift
//  WorldWeatherApp
//
//  Created by Milos-i5 on 1/19/17.
//  Copyright © 2017 iOS-ProjectMilos. All rights reserved.
//

import Foundation

struct Weather {
    
    let city: String
    let temp: Double
    let wind: Double
    let cloud: Double
    let hum: Double
    
    init(city: String, temp: Double, wind: Double, cloud: Double, hum: Double) {
        self.city = city
        self.temp = temp
        self.wind = wind
        self.cloud = cloud
        self.hum = hum
         
    }
}
