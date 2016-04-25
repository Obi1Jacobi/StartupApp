//
//  ViewController.swift
//  StartupApp
//
//  Created by Jacob Wilson on 4/25/16.
//  Copyright © 2016 Jacob_Wilson. All rights reserved.
//

import UIKit
import Firebase
import ForecastIO

class ViewController: UIViewController {

    func test() {
        let forecastIOClient = APIClient(apiKey: "3fd99f3c6b90149f3f3e7f599a47a5a6")
        
        let myLat = 40.6963
        let myLon = -89.6166
        
        forecastIOClient.getForecast(latitude: myLat, longitude: myLon) { (currentForecast, error) -> Void in
            if let currentForecast = currentForecast {
                //  We got the current forecast!
                print(currentForecast)
            } else if let error = error {
                //  Uh-oh we have an error!
                print("There is an error: \(error)")
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.test()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

