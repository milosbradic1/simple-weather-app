//
//  ViewController.swift
//  WorldWeatherApp
//
//  Created by Milos-i5 on 1/19/17.
//  Copyright © 2017 iOS-ProjectMilos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ServiceProtocol {

    let service = Service()
    
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var cloud: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var hum: UILabel!
    @IBOutlet weak var cityTextLabel: UITextField!
    
    @IBAction func OK(_ sender: UIButton) {
        city.text = cityTextLabel.text
        self.service.fetchWeather(cityTextLabel.text!)
    }
    
    func setWeather(_ weather: Weather) {
        temp.text = String(Int(weather.temp))
        cloud.text = String(Int(weather.cloud))
        wind.text = String(weather.wind)
        hum.text = String(Int(weather.hum))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.service.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
