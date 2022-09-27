//
//  AppDelegate.swift
//  FabiManager
//
//  Created by quan nguyen on 10/9/19.
//  Copyright © 2019 quan nguyen. All rights reserved.
//

import UIKit
import DropDown
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
 
    let baseurl = "https://apibilling.iposdev.com"
    static let shareDelegate = UIApplication.shared.delegate as! AppDelegate
    var user: User?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        DropDown.startListeningToKeyboard()
        let userToken = UserDefaults.standard.string(forKey: "userToken")
        let userEmail = UserDefaults.standard.string(forKey: "userEmail")
        if let userToken = userToken,let userEmail = userEmail{
            loginWithtoken(userToken: userToken,email: userEmail)
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
            let main = LoginnVc(nibName: "LoginnVc", bundle: nil)
            window?.rootViewController = main
            if let window = window {
                window.makeKeyAndVisible()
            }
        }
       
        return true
    }
    func loginWithtoken(userToken: String, email: String){
        ApiOperations.loginWithToken(email: email,token: userToken){respone in
            let main = MainVC(nibName: "MainVC", bundle: nil)
            UserDefaults.standard.set(respone.data?.token, forKey: "userToken")
            AppDelegate.shareDelegate.user = respone.data
            AppDelegate.shareDelegate.window?.rootViewController = main
        } fail:{Error in
            let alert = UIAlertController(title: "thông báo", message: Error.getMessage(), preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.window = UIWindow(frame: UIScreen.main.bounds)
            let main = LoginnVc(nibName: "LoginnVc", bundle: nil)
            self.window?.rootViewController = main
            if let window = self.window {
                window.makeKeyAndVisible()
            }
            // show the alert
           //present(alert, animated: true, completion: nil)
        }
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
      
    }
    @objc func logEventFirebase(notify: Notification) {
//        let userInfo = notify.userInfo as? [String: Any]
    }
    var vSpinner : UIView?
       func showSpinner(onView : UIView) {
           let spinnerView = UIView.init(frame: onView.bounds)
           spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
           let ai = UIActivityIndicatorView.init(style: .whiteLarge)
           ai.startAnimating()
           ai.center = spinnerView.center
           DispatchQueue.main.async {
               spinnerView.addSubview(ai)
               onView.addSubview(spinnerView)
           }
           vSpinner = spinnerView
       }
       
       func removeSpinner() {
        DispatchQueue.main.async { [self] in
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
           }
       }


}

