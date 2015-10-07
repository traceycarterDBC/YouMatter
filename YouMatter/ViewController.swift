//
//  ViewController.swift
//  YouMatter
//
//  Created by Tracey Carter on 10/6/15.
//  Copyright © 2015 Tracey Carter. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "https://www.domesticshelters.org/search#?q=666%20Folsom%20St%2C%20San%20Francisco%2C%20CA%2094107%2C%20USA&latitude=37.78462700000001&longitude=-122.398458&radius=50&order=distance&page=1")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) {(data, response, error) -> Void in
        }
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
    

    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            print(locations)
            var userLocation: CLLocation = locations[0]
            
            var latitude = userLocation.coordinate.latitude
            
            var longitude = userLocation.coordinate.longitude
            
            var latDelta:CLLocationDegrees = 0.05
            
            var lonDelta:CLLocationDegrees = 0.05
            
            var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
            
            var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            
            var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
            
            self.map.setRegion(region, animated: false)
            
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

