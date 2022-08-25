//
//  LoginnVc.swift
//  iPOSBilling
//
//  Created by ipos on 24/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class LoginnVc: UIViewController {
    
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    var window: UIWindow?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func login(_ sender: Any) {
      //  showSpinner(onView: self.view)
        let email = txtEmail.text!
        let pass = txtPass.text!
        let deviceId = UIDevice.current.identifierForVendor?.uuidString
        ApiOperations.getLogin(email: email, password: pass, deviceId: deviceId ?? "") {respone in
            let main = MainVC(nibName: "MainVC", bundle: nil)
            AppDelegate.shareDelegate.window?.rootViewController = main
            UserDefaults.standard.set(respone.data?.token, forKey: "userToken")
            UserDefaults.standard.set(respone.data?.email, forKey: "userEmail")
            AppDelegate.shareDelegate.user = respone.data
           
        } fail: { error in
            // create the alert
            self.showArlet(title: "Thông báo", mess: error.getMessage())
        }
    }
  
    
    /*(email: quannv.tm@gmail.com, password: "thanos", deviceId: "0bd7f919-9f7e-4f8a-b940-e40c50f6b458")*/
    /*
     
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}

