//
//  ViewController.swift
//  WeatherTest
//
//  Created by Andrew Simpson on 6/8/19.
//  Copyright © 2019 Andrew Simpson. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var groundView: UIView!
    
    var presentor: WeatherPresentor?
    var tempLabel: UILabel?
    var tempNameLabel: UILabel?
    var lat: Double = 0
    var lon: Double = 0
    let locationManager = CLLocationManager()
    var locationLocked = false
    override func viewDidLoad() {
        super.viewDidLoad()
        if (lat == 0 && lon == 0) {
            self.locationManager.requestAlwaysAuthorization()
            self.locationManager.requestWhenInUseAuthorization()
            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self as CLLocationManagerDelegate
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.startUpdatingLocation()
            }
        }
        presentor = WeatherPresentor()
        presentor?.viewCon = self
        
        print("IN VIEW")
        print(self.locationLocked)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if (!locationLocked) {
            let l = locations[0].coordinate
            makeScene(lat_: Double(l.latitude), lon_: Double(l.longitude))
            locationLocked = true
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
