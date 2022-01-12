//
//  ViewController.swift
//  Map
//
//  Created by Monica Girgis Kamel on 11/01/2022.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    
    var locationManager = CLLocationManager()
    lazy var mapView = GMSMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                // Create a GMSCameraPosition that tells the map to display the
                let camera = GMSCameraPosition.camera(withLatitude: 30.033333, longitude: 31.233334, zoom: 10.0)
                mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
                self.view.addSubview(mapView)

                // Creates a marker in the center of the map.
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
                marker.title = "Cairo"
                marker.snippet = "Egypt"
                marker.map = mapView
        
        // User Location
               locationManager.delegate = self
               locationManager.requestWhenInUseAuthorization()
               locationManager.desiredAccuracy = kCLLocationAccuracyBest
               locationManager.startUpdatingLocation()
    }


}

//MARK:- CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last
        let center = CLLocationCoordinate2D(latitude: userLocation!.coordinate.latitude, longitude: userLocation!.coordinate.longitude)

        let camera = GMSCameraPosition.camera(withLatitude: userLocation!.coordinate.latitude,
                                                          longitude: userLocation!.coordinate.longitude, zoom: 13.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        self.view = mapView

        locationManager.stopUpdatingLocation()
    }
}
