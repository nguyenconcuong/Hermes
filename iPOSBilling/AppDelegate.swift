//
//  AppDelegate.swift
//  FabiManager
//
//  Created by quan nguyen on 10/9/19.
//  Copyright © 2019 quan nguyen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       
        window = UIWindow(frame: UIScreen.main.bounds)
        let main = MainVC(nibName: "MainVC", bundle: nil)
        window?.rootViewController = main

        if let window = window {
            window.makeKeyAndVisible()
        }
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
      
    }
    
    @objc func logEventFirebase(notify: Notification) {
//        let userInfo = notify.userInfo as? [String: Any]
    }
}

