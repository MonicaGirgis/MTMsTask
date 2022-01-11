//
//  AppDelegate.swift
//  Map
//
//  Created by Monica Girgis Kamel on 11/01/2022.
//

import UIKit
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        GMSServices.provideAPIKey("AIzaSyCxxyrduDtDPfkHU_Oyjkb9p33hkKkDsCI")
        
        return true
    }

}

