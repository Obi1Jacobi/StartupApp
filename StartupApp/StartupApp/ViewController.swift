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

    @IBOutlet var tempLabel:UILabel? = UILabel()
    @IBOutlet var tempLoading:UIActivityIndicatorView? = UIActivityIndicatorView()
    
    func test() {
        let forecastIOClient = APIClient(apiKey: "3fd99f3c6b90149f3f3e7f599a47a5a6")
        
        let myLat = 40.6963
        let myLon = -89.6166
        
        forecastIOClient.getForecast(latitude: myLat, longitude: myLon) { (currentForecast, error) -> Void in
            if let currentForecast = currentForecast {
                //  We got the current forecast!
                let currently = currentForecast.currently
                let temp = currently?.temperature
                
                //This is because it is trying to update things on the main UI thread and it throws an exception
                dispatch_async(dispatch_get_main_queue(), {
                    // code here
                    self.updateTemp(temp!)
                })
            } else if let error = error {
                //  Uh-oh we have an error!
                print("There is an error: \(error)")
            }
        }
        
    }
    
    func updateTemp(temperature:Float) {
        let roundTemp = round(temperature)
        let intTemp = Int(roundTemp)
        
        self.tempLoading?.stopAnimating()
        self.tempLoading?.hidden = true
        
        self.tempLabel?.text = "Temperature: \(intTemp)"
        //test change to the code
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tempLoading?.startAnimating()
        
        self.test()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

