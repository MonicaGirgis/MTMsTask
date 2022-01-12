//
//  ViewController.swift
//  Map
//
//  Created by Monica Girgis Kamel on 11/01/2022.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var requestbutton: UIButton!
    
    var locationManager = CLLocationManager()
    lazy var mapView = GMSMapView()
    let marker = GMSMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 30.033333, longitude: 31.233334, zoom: 10.0)
        mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)
        
        // Creates a marker in the center of the map.
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Cairo"
        marker.snippet = "Egypt"
        marker.map = mapView
        
        // User Location
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        
        view.addSubview(requestbutton)
        
    }
    
    override func viewDidLayoutSubviews() {
        self.view = mapView
    }
    
    private func setupUI(){
        
    }
    
    private func setupSubViews(){
        view.subviews.forEach { view in
            view.willRemoveSubview(view)
        }
        
        view.addSubview(mapView)
        view.addSubview(requestbutton)
        marker.map = mapView
        
        view.layoutSubviews()
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
        //setupSubViews()
        //self.view = mapView
//        view.willRemoveSubview(requestbutton)
//        view.addSubview(requestbutton)
//        view.layoutSubviews()

//        locationManager.stopUpdatingLocation()
    }
}
