//
//  router.swift
//  WeatherTest
//
//  Created by Andrew Simpson on 6/9/19.
//  Copyright © 2019 Andrew Simpson. All rights reserved.
//

import Foundation
import UIKit

class Router {
    var presenter: WeatherPresentor?
    func goToLocation() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LocationView") as! LocationViewController
        DispatchQueue.main.async{
             self.presenter!.viewCon!.present(controller, animated: true, completion: nil)
            print("pressented")
        }
    }
}

