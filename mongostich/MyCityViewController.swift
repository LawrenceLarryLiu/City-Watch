//
//  MyCityViewController.swift
//  mongostich
//
//  Created by Nikhil Vaidyamath on 9/15/18.
//  Copyright © 2018 HopHacks18. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class MyCityViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // Do any additional setup after loading the view.
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let annotation = MKPointAnnotation()
        map.removeAnnotation(annotation)
        let userLocation = locations[0] as CLLocation
        let latDelta = 0.05
        let lonDelta = 0.05
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let location = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
        annotation.title = "Current Location"
        annotation.coordinate = location
        map.addAnnotation(annotation)
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
