//
//  LocationViewController.swift
//  WeatherTest
//
//  Created by Andrew Simpson on 6/9/19.
//  Copyright © 2019 Andrew Simpson. All rights reserved.
//

import UIKit
import GoogleMaps
class LocationViewController: UIViewController, GMSMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 48.166666, longitude: -100.166666, zoom: 3)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = self
        view = mapView
        // Do any additional setup after loading the view.
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        let lat = Double(coordinate.latitude)
        let lon = Double(coordinate.longitude)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Scene") as! ViewController
        controller.lat = lat
        controller.lon = lon
        controller.locationLocked = true
        DispatchQueue.main.async{
            self.present(controller, animated: true, completion: {() in
                controller.makeScene(lat_: lat, lon_: lon)
            })
            print("pressented")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
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
