//
//  ViewController.swift
//  Map
//
//  Created by Monica Girgis Kamel on 11/01/2022.
//

import UIKit
import GoogleMaps
import CoreLocation
import SideMenu

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var requestbutton: UIButton!
    
    var locationManager = CLLocationManager()
    lazy var gMSmapView = GMSMapView()
    let marker = GMSMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 30.033333, longitude: 31.233334, zoom: 10.0)
        gMSmapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        //mapView.addSubview(gMSmapView)
        
        // Creates a marker in the center of the map.
        marker.position = CLLocationCoordinate2D(latitude: 30.033333, longitude: 31.233334)
        marker.title = "Cairo"
        marker.snippet = "Egypt"
        marker.map = gMSmapView
        
        // User Location
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        
        mapView.addSubview(gMSmapView)
        
    }

}

//MARK:- CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if let location = locations.last{
            gMSmapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 18)
            marker.position = location.coordinate
        }
    }
}
