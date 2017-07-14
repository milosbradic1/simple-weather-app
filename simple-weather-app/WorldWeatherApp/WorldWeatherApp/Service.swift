//
//  Service.swift
//  WorldWeatherApp
//
//  Created by Milos-i5 on 1/19/17.
//  Copyright © 2017 iOS-ProjectMilos. All rights reserved.
//

import Foundation

protocol ServiceProtocol {
    
    func setWeather(_ weather: Weather)
    }

class Service {
    
     var delegate: ServiceProtocol?
    
     let baseURL = "http://api.openweathermap.org/data/2.5/weather?q="
     let key = "9bf8f90ca7cee278ca13c3f95725ae77"
    
    func fetchWeather(_ city: String) {
        
        let session = URLSession.shared
        
        let cityWithEscapes = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let requestURL = URL(string: "\(baseURL)\(cityWithEscapes!)&units=metric&appid=\(key)")!
        
        let dataTask = session.dataTask(with: requestURL, completionHandler: {
            data, response, error in
            
            if let error = error {
                
                print("Error:\(error)")
            }
            else {
                
                do  {
                    
                    let weather = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                    
                    print("City: \(weather["name"]!)")
                    let c = String(describing: weather["name"]!)
                    print("Temperature: \(weather["main"]!["temp"]!!)")
                    let t = weather["main"]!["temp"]!! as! Double
                    print("Humidity: \(weather["main"]!["humidity"]!!)")
                    let h = weather["main"]!["humidity"]!! as! Double
                    print("Cloud cover: \(weather["clouds"]!["all"]!!)")
                    let cl = weather["clouds"]!["all"]!! as! Double
                    print("Wind speed: \(weather["wind"]!["speed"]!!)")
                    let w = weather["wind"]!["speed"]!! as! Double
                    
                  let weatherForDelegate = Weather(city: c, temp: t , wind: w, cloud: cl, hum: h)
                
                    if self.delegate != nil {
                    
                        DispatchQueue.main.async {
                            self.delegate?.setWeather(weatherForDelegate)
                        }
                    }
                }
                   
                catch let jsonError  {
                    
                    print("JSON error description: \(jsonError) ")
                }
              }
           }
        )
        dataTask.resume()
    }
}
