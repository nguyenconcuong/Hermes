//
//  MainVC.swift
//  iPOSBilling
//
//  Created by Quan Nguyen on 18/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class MainVC: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
            super.viewDidLoad()
            
            //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
            self.delegate = self
            
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            let homevc = HomeVC()
            let tabHomeBarItem = UITabBarItem(title: "Home", image: UIImage(named: "tabbar_ic_home"), selectedImage: UIImage(named: "tabbar_ic_home_selected"))
            homevc.tabBarItem = tabHomeBarItem
            
            
            let reportvc = ReportVC()
            let tabreportBarItem = UITabBarItem(title: "Báo Cáo", image: UIImage(named: "tabbar_ic_notify"), selectedImage: UIImage(named: "tabbar_ic_notify_selected"))
            
            reportvc.tabBarItem = tabreportBarItem
            let Cusvc = CustVC()
            let tabcustBarItem = UITabBarItem(title: "Khách Hàng", image: UIImage(named: "tabbar_ic_customer"), selectedImage: UIImage(named: "tabbar_ic_customer_selected"))
            
            Cusvc.tabBarItem = tabcustBarItem
            
       
            let personalvc = PersonalVC()
            let tabpersonalBarItem = UITabBarItem(title: "Cá Nhân", image: UIImage(named: "tabbar_ic_other"), selectedImage: UIImage(named: "tabbar_ic_other_selected"))
            
            personalvc.tabBarItem = tabpersonalBarItem
            
            
            self.viewControllers = [homevc, reportvc,Cusvc,personalvc]
        }
        
        // UITabBarControllerDelegate method
        func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
            print("Selected \(viewController.title!)")
        }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
